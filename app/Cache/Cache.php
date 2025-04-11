<?php

namespace App\Cache;

use App\Constants\CacheConstant;
use Illuminate\Support\Facades\Redis;

/**
 * 缓存基类
 */
class Cache
{
    /**
     *redis连接
     *
     * @var string
     */
    public static string $connect = 'default';

    /**
     * redis实例
     *
     * @var null
     */
    private static $instance = null;

    /**
     * lua脚本
     */
    private const LUA_INCR_TTL = <<<LUA
local x = redis.call('INCRBY',KEYS[1],ARGV[1])
if tonumber(x) == tonumber(ARGV[1]) then
    redis.call('EXPIRE',KEYS[1],ARGV[2])
end
return x
LUA;

    /**
     * @return \Redis
     * @author xiaowei
     */
    public static function getClient(): ?\Redis
    {
        if (null === self::$instance) {
            self::$instance = Redis::connection(self::$connect)->client();
        }

        return self::$instance;
    }

    /**
     * @param string  $name    名称.
     * @param integer $offset  偏移量.
     * @param integer $seconds 有效期.
     *
     * @return integer
     * @throws \RedisException
     */
    public static function incrBy(string $name, int $offset = 1, int $seconds = CacheConstant::MINUTES): int
    {
        return static::getClient()->eval(
            self::LUA_INCR_TTL,
            [$name, $offset, $seconds],
            1
        );
    }

    /**
     * @param string $key
     * @param int    $index
     *
     * @return bool|mixed|\Redis
     * @throws \RedisException
     * @author xiaowei
     */
    public static function lIndex(string $key, int $index)
    {
        return static::getClient()->lIndex($key, $index);
    }

    /**
     * @param string $key
     * @param array  $value
     *
     * @return false|int|\Redis
     * @throws \RedisException
     * @author xiaowei
     */
    public static function lpush(string $key, array $value)
    {
        return static::getClient()->lpush($key, ...$value);
    }

    /**
     * @param string $key
     * @param mixed  $value
     * @param int    $count
     *
     * @return bool|int|\Redis
     * @throws \RedisException
     * @author xiaowei
     */
    public static function lrem(string $key, mixed $value, int $count = 0)
    {
        return static::getClient()->lRem($key, $value, $count);
    }

    /**
     * @param mixed $key
     *
     * @return false|int|\Redis
     * @throws \RedisException
     * @author xiaowei
     */
    public static function del(mixed $key)
    {
        if (is_array($key)) {
            return static::getClient()->del(...$key);
        } else {
            return static::getClient()->del(strval($key));
        }
    }
}
