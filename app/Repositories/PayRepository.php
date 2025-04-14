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
        $order = Order::query()->where('order_no', $param['order_no'])->first();
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        if (!UserLock::orderLock($param['order_no'])) {
            throw new BusinessException("操作频繁，请稍后再试");
        }

        try {
            if (OrderConstant::PAY_STATUS_1 == $order->pay_status) {
                throw new BusinessException('订单已支付');
            }

            (new OmiseService)->createLink($order->amount, '课程订单');
        } catch (\Throwable $e) {
            throw $e;
            Log::error('获取支付链接失败', [
                'param' => $param,
                'exception' => ExceptionUtil::normalize($e),
            ]);

            throw new BusinessException('获取支付链接失败');
        } finally {
            UserLock::orderUnLock($param['order_no']);
        }

        return [
            'pay_url' => '',
        ];
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
        $order = Order::query()->where('order_no', $param['order_no'])->first();
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        return true;
    }
}
