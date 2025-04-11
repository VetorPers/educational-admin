<?php

namespace App\Cache\Pay;

use App\Cache\Cache;
use App\Constants\CacheConstant;
use App\Utils\EnvUtil;

class OrderCache extends Cache
{
    private static string $orderNoKey = "order_no_%s";

    /**
     * 生成订单编号
     *
     * @param string $prefix 业务前置.
     * @return string
     * @throws \RedisException
     */
    public static function generateOrderNo(string $prefix = ""): string
    {
        $prefix = $prefix . date('Ymd');
        $key = sprintf(self::$orderNoKey, $prefix);
        $int = self::incrBy($key, seconds: CacheConstant::DAY + CacheConstant::MINUTES);
        return sprintf('%s%d%08d', $prefix, EnvUtil::getEnvEnum(), $int);
    }
}
