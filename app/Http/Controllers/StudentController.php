<?php

namespace App\Http\Controllers;

use App\Http\Requests\Student\IndexStudentRequest;
use App\Repositories\StudentRepository;
use Illuminate\Http\JsonResponse;

/**
 * StudentController
 *
 * @author xiaowei
 */
class StudentController extends Controller
{
    /**
     * @param StudentRepository $repository
     */
    public function __construct(protected StudentRepository $repository)
    {

    }

    /**
     * @param IndexStudentRequest $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function index(IndexStudentRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        $data = $this->repository->index($reqData);

        return $this->success($data);
    }
}
