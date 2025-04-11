<?php

namespace App\Exceptions;

/**
 * ErrorCode.
 */
class ErrorCode
{
    /**
     * 参数错误.
     */
    const CODE_ERROR_ARGUMENT = 400;

    /**
     * 业务类型异常.
     */
    const CODE_ERROR_BUSINESS = 600;

    /**
     *系统错误.
     */
    const CODE_ERROR_SYSTEM = 500;

    /**
     * 用户未登陆.
     */
    const CODE_ERROR_USER_LOGIN = 80000;

    /**
     * 没权限.
     */
    const CODE_ERROR_USER_NO_PERMISSION = 80001;
}
