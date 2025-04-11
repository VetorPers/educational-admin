<?php

namespace App\Cache;

use App\Constants\CacheConstant;

/**
 * 用户相关锁
 */
class UserLock extends Lock
{
    private static string $pay_lock_key = "pay_lock_%s_%s";

    private static string $transfer_lock_key = "transfer_lock_%s";

    private static string $cycle_pay_lock_key = "cycle_pay_lock_%s";

    /**
     * 用户支付加锁
     *
     * @param string $appName 应用名.
     * @param string $orderNo 订单号.
     * @param int    $ttl     锁时间.
     *
     * @return bool
     */
    public static function payLock(string $appName, string $orderNo, int $ttl = CacheConstant::MINUTES * 10): bool
    {
        return Lock::lock(sprintf(self::$pay_lock_key, $appName, $orderNo), $ttl);
    }

    /**
     * 用户支付解锁
     *
     * @param string $appName 应用名.
     * @param string $orderNo 订单号.
     *
     * @return bool
     */
    public static function payUnLock(string $appName, string $orderNo): bool
    {
        return Lock::unlock(sprintf(self::$pay_lock_key, $appName, $orderNo));
    }

    /**
     * 用户提现转账加锁
     *
     * @param string $openId 三方用户id.
     * @param int    $ttl    锁时间.
     *
     * @return bool
     */
    public static function transferLock(string $openId, int $ttl = CacheConstant::MINUTES * 10): bool
    {
        return Lock::lock(sprintf(self::$transfer_lock_key, $openId), $ttl);
    }

    /**
     * 用户提现转账解锁
     *
     * @param string $openId 三方用户id.
     *
     * @return bool
     */
    public static function transferUnLock(string $openId): bool
    {
        return Lock::unlock(sprintf(self::$transfer_lock_key, $openId));
    }

    /**
     * 用户周期扣款加锁
     *
     * @param string $agreementNo 协议号.
     * @param int    $ttl         锁时间.
     *
     * @return bool
     */
    public static function cyclePayLock(string $agreementNo, int $ttl = CacheConstant::MINUTES * 10): bool
    {
        return Lock::lock(sprintf(self::$cycle_pay_lock_key, $agreementNo), $ttl);
    }

    /**
     * 用户周期扣款解锁
     *
     * @param string $agreementNo 协议号.
     *
     * @return bool
     */
    public static function cyclePayUnLock(string $agreementNo): bool
    {
        return Lock::unlock(sprintf(self::$cycle_pay_lock_key, $agreementNo));
    }
}
