<?php

namespace App\Exceptions;

/**
 * 用户相关的.
 */
class UserException extends BaseException
{
    /**
     * @var int
     */
    public static $errorCode = ErrorCode::CODE_ERROR_USER_LOGIN;
}
