<?php

namespace App\Http\Controllers;

use App\Cache\Cache;
use App\Http\Requests\Pay\PayOrderRequest;
use App\Repositories\PayRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Http\JsonResponse;
use Illuminate\Support\Facades\Redis;

/**
 * PayController
 *
 * @author xiaowei
 */
class PayController extends Controller
{
    /**
     * @param \App\Repositories\PayRepository $repository
     */
    public function __construct(protected PayRepository $repository)
    {

    }

    /**
     * @param PayOrderRequest $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function payOrder(PayOrderRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        $data = $this->repository->payOrder($reqData);

        return $this->success($data);
    }

    /**
     * @param Request $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function omiseCallback(Request $request): JsonResponse
    {
        $this->repository->omiseCallback($request->all());

        return response()->json('success');
    }
}
