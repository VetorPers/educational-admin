<?php

namespace App\Http\Controllers;

use Illuminate\Foundation\Auth\Access\AuthorizesRequests;
use Illuminate\Foundation\Validation\ValidatesRequests;
use Illuminate\Http\JsonResponse;
use Illuminate\Routing\Controller as BaseController;

class Controller extends BaseController
{
    use AuthorizesRequests, ValidatesRequests;

    /**
     * 错误返回.
     *
     * @param string  $msg  提示.
     * @param integer $code CODE.
     * @param mixed   $data 数据.
     * @return JsonResponse
     */
    public function error(string $msg = '', int $code = 400, mixed $data = null): JsonResponse
    {
        return response()->json([
            'code' => $code,
            'msg' => $msg,
            'data' => $data,
        ], 200, [], JSON_UNESCAPED_UNICODE);
    }

    /**
     * 成功返回.
     *
     * @param mixed   $data 数据.
     * @param string  $msg  提示.
     * @param integer $code CODE.
     * @return JsonResponse
     */
    public function success(mixed $data, string $msg = '', int $code = 200): JsonResponse
    {
        return response()->json([
            'code' => $code,
            'msg' => $msg,
            'data' => $data,
        ], 200, [], JSON_UNESCAPED_UNICODE);
    }
}
