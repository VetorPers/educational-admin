<?php

namespace App\Utils;

use Illuminate\Support\Arr;

/**
 * SignUtil 验签.
 *
 * @author xiaowei
 */
class SignUtil
{
    /**
     * @param array $param 请求参数.
     *
     * @return bool
     * @author xiaowei
     */
    public static function check(array $param): bool
    {
        $secret = Arr::pull($param, 'app_secret');
        $sign = Arr::pull($param, 'sign');

        return $sign === self::sign($param, $secret);
    }

    /**
     * @param array  $param  请求参数.
     * @param string $secret 秘钥.
     *
     * @return string
     * @author xiaowei
     */
    public static function sign(array $param, string $secret): string
    {
        unset($param['app_secret'], $param['sign']);

        ksort($param);

        return crypt(http_build_query($param), $secret);
    }
}
