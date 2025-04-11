<?php

namespace App\Utils;

use App\Exceptions\BusinessException;

/**
 * 环境
 */
class EnvUtil
{
    const ENV_LOCAL = 'local';  // 本地环境
    const ENV_DEV = 'dev';  // 开发环境
    const ENV_TEST = 'test'; // 测试环境
    const ENV_PROD = 'prod';   // 正式环境
    const ENV_PROD2 = 'pre1';   // 预发环境

    const ENV_MAP = [
        self::ENV_LOCAL => "本地环境",
        self::ENV_DEV => "开发环境",
        self::ENV_TEST => "测试环境",
        self::ENV_PROD => "正式环境",
        self::ENV_PROD2 => "预发环境"
    ];

    /**
     * @var string|null 第一次获取赋值
     */
    private static ?string $env = null;

    /**
     * @return boolean
     */
    public static function isLocal(): bool
    {
        return self::getEnv() === self::ENV_LOCAL;
    }

    /**
     * @return boolean
     */
    public static function isDev(): bool
    {
        return self::getEnv() === self::ENV_DEV;
    }

    /**
     * @return boolean
     */
    public static function isTest(): bool
    {
        return self::getEnv() === self::ENV_TEST;
    }

    /**
     * @return boolean
     */
    public static function isRelease(): bool
    {
        return self::getEnv() === self::ENV_PROD;
    }

    /**
     * @return boolean
     */
    public static function isPre(): bool
    {
        return self::getEnv() === self::ENV_PROD2;
    }

    /**
     * @return int
     * @author xiaowei
     */
    public static function getEnvEnum(): int
    {
        if (self::isRelease()) {
            return 5;
        }

        if (self::isPre()) {
            return 4;
        }

        if (self::isTest()) {
            return 3;
        }

        if (self::isDev()) {
            return 2;
        }

        return 1;
    }

    /**
     * @return string
     */
    public static function getEnv(): string
    {
        if (self::$env === null) {
            self::$env = strtolower((string)env('APP_ENV', 'production'));
        }

        return self::$env;
    }

    /**
     * 环境中文名
     * @return string
     */
    public static function getEnvName(): string
    {
        return self::ENV_MAP[self::getEnv()] ?? '未知';
    }
}
