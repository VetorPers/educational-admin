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
     *
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
     *
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
     *
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
     */
    public static function lock(string $name, int $seconds = CacheConstant::SECONDS * 5): bool
    {
        return self::getClient()->set($name, self::LOCK_DEFAULT_VALUE, 'EX', $seconds, 'NX') !== null;
    }


    /**
     * 注意，该方法会释放非自己的加锁.
     *
     * @param string $name 释放的锁.
     *
     * @return boolean
     */
    public static function unlock(string $name): bool
    {
        return (bool)self::getClient()->del($name);
    }

}
