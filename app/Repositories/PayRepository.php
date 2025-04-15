<?php

namespace App\Repositories;

use App\Cache\UserLock;
use App\Constants\OrderConstant;
use App\Exceptions\BusinessException;
use App\Models\Order;
use App\Services\Pay\OmiseService;
use App\Utils\ExceptionUtil;
use App\Utils\PriceUtil;
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
     * @var array|string[]
     */
    protected array $events = [
        'charge.create',
    ];

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

            $ret = (new OmiseService)->createLink(PriceUtil::mul($order->amount, 100), '课程订单');
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
     * @param string $event
     *
     * @return true
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    protected function filterEvent(string $event): true
    {
        if (!in_array($event, $this->events)) {
            throw new BusinessException('不支持的事件类型');
        }

        return true;
    }

    /**
     * @param array $param
     *
     * @return bool
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function omiseCallback(array $param): bool
    {
        if (empty($param['data']['link']) || empty($param['key'])) {
            throw new BusinessException('参数错误');
        }

        $this->filterEvent($param['key']);

        /** @var Order $order */
        $order = Order::query()->where('pay_id', $param['data']['link'])->first();
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        if (!UserLock::orderLock($order->order_no)) {
            throw new BusinessException("操作频繁，请稍后再试");
        }

        try {
            if (OrderConstant::PAY_STATUS_1 == $order->pay_status) {
                throw new BusinessException('订单已支付');
            }

            $payStatus = 0;
            $ret = (new OmiseService)->retrieve($order->pay_id);
            if (!empty($ret['charges']['data'])) {
                foreach ($ret['charges']['data'] as $item) {
                    if (!isset($item['link']) || $item['link'] != $order->pay_id) {
                        continue;
                    }

                    $payStatus = isset($item['status']) && $item['status'] == 'successful' ? 1 : 0;
                    break;
                }
            }

            $order->fill([
                'pay_status' => $payStatus ? OrderConstant::PAY_STATUS_1 : OrderConstant::PAY_STATUS_2,
                'pay_time' => $payStatus ? now() : null,
                'pay_info' => json_encode($param, JSON_UNESCAPED_UNICODE),
            ])->save();

            return true;
        } catch (\Throwable $e) {
            Log::channel('stderr')->error('支付回调失败', [
                'param' => $param,
                'exception' => ExceptionUtil::normalize($e),
            ]);
            return false;
        } finally {
            UserLock::orderUnLock($order->order_no);
        }
    }
}
