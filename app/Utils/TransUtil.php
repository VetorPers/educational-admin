<?php

namespace App\Utils;

/**
 * 数据转换
 */
class TransUtil
{
    /**
     * 字符串转数组（支持英文逗号空格和换行符）
     *
     * @param string        $str       字符串.
     * @param array         $filter    需要过滤的字符.
     * @param callable|null $callback  成员转换函数.
     * @param string        $pattern   表达式.
     * @param string        $separator 分隔符.
     * @return array
     */
    public static function commonExplode(
        string $str,
        array $filter = [],
        ?callable $callback = null,
        string $pattern = '/[\s,，、|]+/u',
        string $separator = ','
    ): array {
        $str = preg_replace($pattern, $separator, $str);
        $strArr = explode($separator, $str);
        if (!$strArr) {
            return [];
        }

        $strArr = array_unique($strArr);
        if (!empty($filter)) {
            $strArr = array_diff($strArr, $filter);
        }

        $strArr = array_values($strArr);
        is_callable($callback) && $strArr = array_map($callback, $strArr);

        return $strArr;
    }
}
