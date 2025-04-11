<?php

namespace App\Http\Controllers;

use App\Http\Requests\Order\IndexOrderRequest;
use App\Http\Requests\Order\StoreOrderRequest;
use App\Repositories\OrderRepository;

class OrderController extends Controller
{
    public function __construct(protected OrderRepository $repository){

    }

    public function index(IndexOrderRequest $request)
    {
        $reqData = $request->validated();

        $data = $this->repository->index($reqData);

        return $this->success($data);
    }

    public function store(StoreOrderRequest $request)
    {
        $reqData = $request->validated();

        $this->repository->store($reqData);

        return $this->success([]);
    }

    public function sendOrder()
    {

    }

    public function studentOrder()
    {

    }
}
