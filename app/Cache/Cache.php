<?php

namespace App\Cache;

use App\Constants\CacheConstant;
use Predis\Client;

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
     * @author xiaowei
     */
    public static function getClient()
    {
        if (null === self::$instance) {
            self::$instance = new Client(config('database.redis.' . self::$connect), [
                'read_write_timeout' => 0,
            ]);
        }

        return self::$instance;
    }

    /**
     * @param string  $name    名称.
     * @param integer $offset  偏移量.
     * @param integer $seconds 有效期.
     *
     * @return integer
     */
    public static function incrBy(string $name, int $offset = 1, int $seconds = CacheConstant::MINUTES): int
    {
        return static::getClient()->eval(
            self::LUA_INCR_TTL,
            1,
            $name, $offset, $seconds
        );
    }
}
