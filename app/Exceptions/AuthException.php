<?php

namespace App\Exceptions;

/**
 *用户权限相关验证.
 */
class AuthException extends BaseException
{
    /**
     * @var int
     */
    public static $errorCode = ErrorCode::CODE_ERROR_USER_NO_PERMISSION;
}
