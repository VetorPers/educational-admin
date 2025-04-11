<?php

namespace App\Constants;

/**
 * OrderConstant
 *
 * @author xiaowei
 */
class OrderConstant
{
    public const STATUS_0 = 0;
    public const STATUS_1 = 1;
    public const PAY_STATUS_0 = 0;
    public const PAY_STATUS_1 = 1;
    public const PAY_STATUS_2 = 2;

    /**
     * STATUS
     */
    public const STATUS_MAP = [
        self::STATUS_0 => '待发送',
        self::STATUS_1 => '已发送',
    ];

    public const PAY_STATUS_MAP = [
        self::PAY_STATUS_0 => '未支付',
        self::PAY_STATUS_1 => '已支付',
        self::PAY_STATUS_2 => '支付失败',
    ];

}
