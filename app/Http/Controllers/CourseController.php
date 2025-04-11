<?php

namespace App\Http\Controllers;

use App\Http\Requests\Course\IndexCourseRequest;
use App\Http\Requests\Course\StoreCourseRequest;
use App\Http\Requests\Course\UpdateCourseRequest;
use App\Repositories\CourseRepository;
use Illuminate\Http\Request;
use Illuminate\Http\JsonResponse;

/**
 * CourseController
 *
 * @author xiaowei
 */
class CourseController extends Controller
{
    /**
     * @param CourseRepository $repository
     */
    public function __construct(protected CourseRepository $repository)
    {

    }

    /**
     * @param IndexCourseRequest $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function index(IndexCourseRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        $data = $this->repository->index($reqData);

        return $this->success($data);
    }

    /**
     * @param StoreCourseRequest $request
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function store(StoreCourseRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        $data = $this->repository->store($reqData);

        return $this->success($data);
    }

    /**
     * @param UpdateCourseRequest $request
     * @param string              $id
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function update(UpdateCourseRequest $request, string $id): JsonResponse
    {
        $reqData = $request->validated();

        $data = $this->repository->update(intval($id), $reqData);

        return $this->success($data);
    }

    /**
     * @param Request $request
     * @param string  $id
     *
     * @return JsonResponse
     * @author xiaowei
     */
    public function destroy(Request $request, string $id): JsonResponse
    {
        $this->repository->destroy($id);

        return $this->success([]);
    }

}
