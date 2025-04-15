<?php

namespace App\Repositories;

use App\Cache\UserLock;
use App\Constants\OrderConstant;
use App\Exceptions\BusinessException;
use App\Models\Order;
use App\Services\Pay\OmiseService;
use App\Utils\ExceptionUtil;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Facades\Redis;

/**
 * PayRepository
 *
 * @author xiaowei
 */
class PayRepository extends BaseRepository
{
    /**
     * @param array $param
     *
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function payOrder(array $param): array
    {
        /** @var Order $order */
        $order = Order::query()
            ->where('order_no', $param['order_no'])
            ->first();
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        if (!UserLock::orderLock($param['order_no'])) {
            throw new BusinessException("操作频繁，请稍后再试");
        }

        try {
            if ($order->student_id != $this->userId()) {
                throw new BusinessException('权限错误');
            }

            if (OrderConstant::PAY_STATUS_1 == $order->pay_status) {
                throw new BusinessException('订单已支付');
            }

            $ret = (new OmiseService)->createLink($order->amount, '课程订单');
            if (empty($ret['id'])) {
                throw new BusinessException('获取支付链接失败');
            }

            $order->pay_id = $ret['id'];
            $order->save();

            return $ret;
        } catch (\Throwable $e) {
            Log::channel('stderr')->error('获取支付链接失败', [
                'param' => $param,
                'exception' => ExceptionUtil::normalize($e),
            ]);

            throw new BusinessException('获取支付链接失败');
        } finally {
            UserLock::orderUnLock($param['order_no']);
        }
    }

    /**
     * @param array $param
     *
     * @return true
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function omiseCallback(array $param): bool
    {
        /** @var Order $order */
        $order = Order::query()->where('pay_id', $param['id'])->first();
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        if (!UserLock::orderLock($order->order_no)) {
            throw new BusinessException("操作频繁，请稍后再试");
        }

        try {
            $ret = (new OmiseService)->retrieve($order->pay_id);
            Log::channel('stderr')->error('omiseCallback', [
                'ret' => $ret,
            ]);

        } catch (\Throwable $e) {

        } finally {
            UserLock::orderUnLock($order->order_no);
        }

        return true;
    }
}
