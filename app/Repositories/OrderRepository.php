<?php

namespace App\Repositories;


use App\Constants\OrderConstant;
use App\Exceptions\BusinessException;
use App\Models\Course;
use App\Models\Order;

/**
 * StudentRepository
 *
 * @author xiaowei
 */
class OrderRepository extends BaseRepository
{
    /**
     * @param array $param
     *
     * @return array
     * @author xiaowei
     */
    public function index(array $param): array
    {
        $query = Order::query()
            ->with(['teacher:id,name', 'student:id,name', 'course:id,name,period,charge,description']);

        // 查询条件
        !empty($param['order_no']) && $query->where('order_no', $param['order_no']);

        // 排序
        $query = $query->orderBy('id', 'desc');

        $data = $query->paginate($param['per_page'] ?? 10, page: $param['page'] ?? 1)->toArray();
        foreach ($data['data'] as &$datum) {
            $datum['status_text'] = OrderConstant::STATUS_MAP[$datum['status']] ?? '';
            $datum['pay_status_text'] = OrderConstant::PAY_STATUS_MAP[$datum['pay_status']] ?? '';
        }
        unset($datum);

        return $this->paginateTransform($data);
    }

    public function store(array $param)
    {
        $courseId = $param['course_id'];
        $studentIds = $param['student_ids'];
        if (empty($studentIds)) {
            return true;
        }

        $course = Course::query()->find($courseId);
        if (!$course) {
            throw new BusinessException('课程不存在');
        }

        $hasStudentIds = $course->students()->whereIn('id', $studentIds)->get()->pluck('id')->toArray();
        $studentIds = array_diff($studentIds, $hasStudentIds);
        $studentIds && $course->students()->attach();
    }

    public function sendOrder(array $param)
    {

    }
}
