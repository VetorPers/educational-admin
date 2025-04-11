<?php

namespace App\Cache;

use App\Constants\CacheConstant;

/**
 * 基础锁
 */
class Lock extends Cache
{
    public const LOCK_DEFAULT_VALUE = 1;

    /**
     * 可重入的锁
     * @var string
     */
    private static string $script_lock = <<<lua
local result =  redis.call('SET', KEYS[1], ARGV[1], 'NX', 'EX', ARGV[2])
if result then
    return 1
else
    local value = redis.call('GET', KEYS[1])
    if value == ARGV[1] then
        redis.call('EXPIRE', KEYS[1], ARGV[2])
        return 1
    else
        return 0
    end
end
lua;

    /**
     * 删除锁
     * @var string
     */
    private static string $script_unlock = <<<lua
local value = redis.call('GET', KEYS[1])
if value == ARGV[1] then
    redis.call('DEL', KEYS[1])
    return 1
else
    return 0
end
lua;

    /**
     * 看门狗
     * @var string
     */
    public static string $script_watch_dog = <<<lua
local value = redis.call('GET', KEYS[1])
if value == ARGV[1] then
    redis.call('EXPIRE', KEYS[1], ARGV[2])
    return 1
else
    return 0
end
lua;

    /**
     * 加锁
     *
     * @param string  $name    锁的名称.
     * @param integer $seconds 锁的秒数.
     *
     * @return boolean
     * @throws \RedisException
     */
    public static function lock(string $name, int $seconds = CacheConstant::SECONDS * 5): bool
    {
        return self::getClient()->set($name, self::LOCK_DEFAULT_VALUE, ['NX', 'EX' => $seconds]) === true;
    }

    /**
     * 加锁
     *
     * @param string $name 锁的名称.
     *
     * @return boolean
     * @throws \RedisException
     */
    public static function checkLock(string $name): mixed
    {
        return self::getClient()->get($name);
    }

    /**
     * 注意，该方法会释放非自己的加锁.
     *
     * @param string $name 释放的锁.
     *
     * @return boolean
     * @throws \RedisException
     */
    public static function unlock(string $name): bool
    {
        return (bool)self::getClient()->del($name);
    }

    /**
     * 注意这是一个可重入锁
     *
     * @param string  $name    名称.
     * @param string  $value   值.
     * @param integer $seconds 锁的时间.
     *
     * @return boolean
     * @throws \RedisException
     */
    public static function reentryLock(string $name, string $value, int $seconds = CacheConstant::SECONDS * 5): bool
    {
        return (bool)self::getClient()->eval(
            self::$script_lock,
            [$name, $value, $seconds],
            1
        );
    }

    /**
     * 释放锁，只释放自己的
     *
     * @param string $name  名称.
     * @param string $value 值.
     *
     * @return boolean
     * @throws \RedisException
     */
    public static function reentryUnLock(string $name, string $value): bool
    {
        return (bool)self::getClient()->eval(
            self::$script_unlock,
            [$name, $value],
            1
        );
    }

    /**
     * 添加一个看门狗
     *
     * @param string  $key    Key.
     * @param string  $value  值.
     * @param integer $expire 过期时间.
     *
     * @return boolean
     * @throws \RedisException
     */
    public static function watchDog(string $key, string $value, int $expire = CacheConstant::MINUTES): bool
    {
        // 续失败，说明被其他锁了或者释放，退出
        return (bool)self::getClient()->eval(self::$script_watch_dog, [$key, $value, $expire], 1);
    }
}
