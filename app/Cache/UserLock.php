<?php

namespace App\Cache;

use App\Constants\CacheConstant;

/**
 * 用户相关锁
 */
class UserLock extends Lock
{
    private static string $create_order_lock_key = "create_order_lock_%s";

    /**
     * 加锁
     *
     * @param int $courseId 课程id.
     * @param int $ttl      锁时间.
     *
     * @return bool
     */
    public static function createOrderLock(int $courseId, int $ttl = CacheConstant::MINUTES * 10): bool
    {
        return Lock::lock(sprintf(self::$create_order_lock_key, $courseId), $ttl);
    }

    /**
     * 解锁
     *
     * @param int $courseId 课程id.
     *
     * @return bool
     */
    public static function createOrderUnLock(int $courseId): bool
    {
        return Lock::unlock(sprintf(self::$create_order_lock_key, $courseId));
    }
}
