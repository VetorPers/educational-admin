<?php

declare(strict_types=1);

namespace App\Utils;

/**
 * 价格工具
 */
class PriceUtil
{
    /**
     * 分转元
     *
     * @param mixed $pennyAmount
     *
     * @return string
     */
    public static function pennyToYuan(mixed $pennyAmount): string
    {
        return self::format((float)($pennyAmount / 100), 2, true);
    }

    public static function yunToCentimeter(mixed $number): float|int
    {
        return $number * 1000;
    }

    /**
     * 厘转元
     *
     * @param mixed $centimeter
     *
     * @return string
     */
    public static function centimeterToYuan(mixed $centimeter): string
    {
        return self::format((float)($centimeter / 1000), 2, true);
    }

    /**
     * 价格统一格式化.
     *
     * @param mixed   $price    金额.
     * @param integer $decimals 小数点位数. 负数代表不处理.
     * @param boolean $isRepair 是否补0.
     *
     * @return string
     */
    public static function format(mixed $price, int $decimals = 2, bool $isRepair = false): string
    {
        $price = number_format((float)$price, $decimals, '.', '');
        if ($isRepair) {
            return sprintf("%.{$decimals}f", $price);
        }
        return $price;
    }

    /**
     *  求差
     *
     * @param mixed $num1  被减数.
     * @param mixed $num2  减数.
     * @param int   $scale 精度.
     *
     * @return string
     */
    public static function sub(mixed $num1, mixed $num2, int $scale = 2): string
    {
        return self::format(bcsub(self::format($num1), self::format($num2), 6), $scale, true);
    }

    /**
     * 求和
     *
     * @param mixed $num1  N1 .
     * @param mixed $num2  N2.
     * @param int   $scale 精度.
     *
     * @return string
     */
    public static function add(mixed $num1, mixed $num2, int $scale = 2): string
    {
        return self::format(bcadd(self::format($num1), self::format($num2), 6), $scale, true);
    }

    /**
     * 是否相等
     *
     * @param mixed $num1  N1.
     * @param mixed $num2  N2.
     * @param int   $scale 精度.
     *
     * @return bool
     */
    public static function isEqual(mixed $num1, mixed $num2, int $scale = 2): bool
    {
        return bccomp(self::format($num1, $scale), self::format($num2, $scale), $scale) === 0;
    }

    /**
     * 是否大于
     *
     * @param mixed $num1  N1.
     * @param mixed $num2  N2.
     * @param int   $scale 精度.
     *
     * @return bool
     */
    public static function isGreater(mixed $num1, mixed $num2, int $scale = 2): bool
    {
        return bccomp(self::format($num1, $scale), self::format($num2, $scale), $scale) === 1;
    }

    /**
     * 乘积
     *
     * @param mixed $num1  N1.
     * @param mixed $num2  N2.
     * @param int   $scale 精度.
     *
     * @return string
     */
    public static function mul(mixed $num1, mixed $num2, int $scale = 2): string
    {
        return self::format(bcmul(self::format($num1, 6), self::format($num2, 6), 6), $scale, true);
    }

    /**
     * 除
     *
     * @param mixed $num1  N1.
     * @param mixed $num2  N2.
     * @param int   $scale 精度.
     *
     * @return string
     */
    public static function div(mixed $num1, mixed $num2, int $scale = 2): string
    {
        return self::format(bcdiv(self::format($num1, 6), self::format($num2, 6), 6), $scale, true);
    }

    /**
     * 元转分
     *
     * @param mixed $amount
     *
     * @return int
     */
    public static function yuanToPenny(mixed $amount): int
    {
        return (int)self::mul($amount, 100, 0);
    }
}
