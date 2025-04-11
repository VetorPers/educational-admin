<?php

namespace App\Http\Controllers;

use App\Exceptions\InvalidArgumentException;
use App\Http\Requests\Order\IndexOrderRequest;
use App\Http\Requests\Order\StoreOrderRequest;
use App\Repositories\OrderRepository;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;
use App\Exceptions\BusinessException;

/**
 * OrderController
 *
 * @author xiaowei
 */
class OrderController extends Controller
{
    /**
     * @param OrderRepository $repository
     */
    public function __construct(protected OrderRepository $repository)
    {

    }

    /**
     * @param IndexOrderRequest $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function index(IndexOrderRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        $data = $this->repository->index($reqData);

        return $this->success($data);
    }

    /**
     * @param StoreOrderRequest $request
     *
     * @return JsonResponse
     * @throws BusinessException
     * @author xiaowei
     */
    public function store(StoreOrderRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        $this->repository->store($reqData);

        return $this->success([]);
    }

    /**
     * @param Request $request
     *
     * @return JsonResponse
     * @throws BusinessException
     * @throws InvalidArgumentException
     * @author xiaowei
     */
    public function sendOrder(Request $request): JsonResponse
    {
        $id = $request->input('id');
        if (empty($id)) {
            throw new InvalidArgumentException('订单id不能为空');
        }

        $this->repository->sendOrder(intval($id));

        return $this->success([]);
    }

    /**
     * @param IndexOrderRequest $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function studentOrder(IndexOrderRequest $request): JsonResponse
    {
        $reqData = $request->validated();
        $reqData['student_id'] = 1;

        $data = $this->repository->index($reqData);

        return $this->success($data);
    }

    public function payOrder(Request $request)
    {

    }
}
