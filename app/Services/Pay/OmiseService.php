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
    protected string $currency = 'rmb';

    /**
     * 初始化key
     */
    public function __construct()
    {
        define('OMISE_PUBLIC_KEY', 'pkey_test_63bwxqmlsds8p45awi2');
        define('OMISE_SECRET_KEY', 'skey_test_63bwxqn57v2ad58dly8');
    }

    /**
     * 创建支付链接
     *
     * @param string $amount
     * @param string $title
     * @param array  $param
     *
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function createLink(string $amount, string $title, array $param = [])
    {
        try {
            $reqData = [
                'amount' => $amount,
                'title' => $title,
                'currency' => $this->currency,
                'multiple' => $this->multiple,
            ];

            !empty($param['description']) && $reqData['description'] = $param['description'];

            $r = \OmiseLink::create($reqData);
            dd($r);
        } catch (\Throwable $e) {
            throw $e;
            Log::error('创建支付链接失败', [
                'params' => $reqData,
                'exception' => ExceptionUtil::normalize($e),
            ]);
            throw new BusinessException('创建支付链接失败');
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
