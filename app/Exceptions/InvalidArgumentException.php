<?php

namespace App\Exceptions;

/**
 * 参数相关验证.
 */
class InvalidArgumentException extends BaseException
{
    /**
     * @var int
     */
    public static $errorCode = ErrorCode::CODE_ERROR_ARGUMENT;
}
