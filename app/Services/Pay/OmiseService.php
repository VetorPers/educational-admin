<?php

namespace App\Services\Pay;

use App\Exceptions\BusinessException;
use App\Services\BaseService;
use App\Utils\ExceptionUtil;
use Illuminate\Support\Facades\Log;

/**
 * OmiseService
 *
 * @author xiaowei
 */
class OmiseService extends BaseService
{
    /**
     * @var bool
     */
    protected bool $multiple = false;

    /**
     * @var string
     */
    protected string $currency = 'thb';

    /**
     * 初始化key
     */
    public function __construct()
    {
        !defined('OMISE_PUBLIC_KEY') && define('OMISE_PUBLIC_KEY', env('OMISE_PUBLIC_KEY', 'pkey_test_63bwxqmlsds8p45awi2'));
        !defined('OMISE_SECRET_KEY') && define('OMISE_SECRET_KEY', env('OMISE_SECRET_KEY', 'skey_test_63bwxqn57v2ad58dly8'));
    }

    /**
     * 创建支付链接
     *
     * @param string $amount
     * @param string $title
     * @param array  $param
     *
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function createLink(string $amount, string $title, array $param = []): array
    {
        try {
            $reqData = [
                'amount' => $amount,
                'title' => $title,
                'currency' => $this->currency,
                'multiple' => $this->multiple,
                'description' => $param['description'] ?? $title,
            ];

            return \OmiseLink::create($reqData)->toArray();
        } catch (\Throwable $e) {
            Log::channel('pay')->error('创建支付链接失败', [
                'params' => $reqData,
                'exception' => ExceptionUtil::normalize($e),
            ]);
            throw new BusinessException('创建支付链接失败');
        }
    }

    /**
     * @param string $id
     *
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function retrieve(string $id): array
    {
        $params = get_defined_vars();

        try {
            return \OmiseLink::retrieve($id)->toArray();
        } catch (\Throwable $e) {
            Log::channel('pay')->error('创建支付链接失败', [
                'params' => $params,
                'exception' => ExceptionUtil::normalize($e),
            ]);
            throw new BusinessException('获取订单状态失败');
        }
    }

    /**
     * @return string
     * @author xiaowei
     */
    public function getCurrency(): string
    {
        return $this->currency;
    }

    /**
     * @param string $currency
     *
     * @return void
     * @author xiaowei
     */
    public function setCurrency(string $currency): void
    {
        $this->currency = $currency;
    }

    /**
     * @return bool
     * @author xiaowei
     */
    public function isMultiple(): bool
    {
        return $this->multiple;
    }

    /**
     * @param bool $multiple
     *
     * @return void
     * @author xiaowei
     */
    public function setMultiple(bool $multiple): void
    {
        $this->multiple = $multiple;
    }
}
