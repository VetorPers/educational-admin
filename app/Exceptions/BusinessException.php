<?php

namespace App\Exceptions;

/**
 *业务中断异常.
 */
class BusinessException extends BaseException
{
    /**
     * @var int
     */
    public static $errorCode = ErrorCode::CODE_ERROR_BUSINESS;
}
