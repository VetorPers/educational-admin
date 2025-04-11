<?php

namespace App\Constants;

/**
 * 缓存时间配置
 */
class CacheConstant
{
    public const SECONDS = 1;

    public const MINUTES = 60 * self::SECONDS;

    public const THREE_MINUTES = 3 * self::MINUTES;

    public const FIVE_MINUTES = 5 * self::MINUTES;

    public const DAY = 86400;

    public const SEVEN_DAY = 7 * self::DAY;

    /**
     * @param string $appId
     * @param string $business
     * @param int    $channel
     *
     * @return string
     * @author xiaowei
     */
    public static function getBusinessKey(string $appId, string $business, int $channel): string
    {
        return sprintf('%s:%s:%d', $appId, $business, $channel);
    }
}
