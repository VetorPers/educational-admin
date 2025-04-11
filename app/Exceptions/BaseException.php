<?php

namespace App\Exceptions;

use Exception;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Request;

/**
 * 基础异常
 */
class BaseException extends Exception
{
    /**
     * @var int
     */
    public static $errorCode = ErrorCode::CODE_ERROR_SYSTEM;
    /**
     * 更细化的子code.
     * @var int|string
     */
    protected  $subCode = 0;

    /**
     * 错误的时候返回给前端的默认值.
     * @var mixed|null
     */
    protected $errorData = null;

    /**
     * 设置业务子code.
     * @param integer|string $code 业务子code.
     *
     * @return $this
     */
    public function setSubCode($code)
    {
        $this->subCode = $code;
        return $this;
    }

    /**
     * 子业务code.
     * @return integer|string
     */
    public function getSubCode()
    {
        return $this->subCode;
    }

    /**
     * http响应.
     * @param Request $request Request.
     * @return JsonResponse
     */
    public function render(Request $request)
    {
        return response()->json([
            'code' => $this->getErrorCode(),
            'msg' => $this->getMessage(),
            'data' => $this->getErrorData(),
        ], 200, [], JSON_UNESCAPED_UNICODE);
    }

    /**
     * 获取错误.
     * @return integer|mixed
     */
    public function getErrorCode()
    {
        return $this->getCode() == 0 ? static::$errorCode : $this->getCode();
    }

    /**
     * 默认返回给前端的数据.
     *
     * @param mixed $data 数据.
     * @return $this
     */
    public function setErrorData($data)
    {
        $this->errorData = $data;
        return $this;
    }

    /**
     * @return mixed|null.
     */
    public function getErrorData()
    {
        return $this->errorData;
    }
}
