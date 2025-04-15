<?php

namespace App\Repositories;


use App\Cache\Pay\OrderCache;
use App\Cache\UserLock;
use App\Constants\OrderConstant;
use App\Constants\UserConstant;
use App\Exceptions\BusinessException;
use App\Models\Course;
use App\Models\Order;
use Illuminate\Support\Facades\DB;

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
        if (isset($param['login_role']) && $param['login_role'] == UserConstant::USER_LOGIN_ROLE_STUDENT) {
            $query->where('student_id', $this->userId())->where('status', OrderConstant::STATUS_1);
        }

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

    /**
     * @param array $param
     *
     * @return true
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function store(array $param): bool
    {
        $courseId = $param['course_id'];
        $studentIds = $param['student_ids'];
        if (empty($studentIds)) {
            return true;
        }

        if (!UserLock::createOrderLock($courseId)) {
            throw new BusinessException("操作频繁，请稍后再试");
        }

        DB::beginTransaction();
        try {
            /** @var Course $course */
            $course = Course::query()->find($courseId);
            if (!$course) {
                throw new BusinessException('课程不存在');
            }

            if ($course->teacher_id != $this->userId()) {
                throw new BusinessException('权限错误');
            }

            $hasStudentIds = $course->students()->whereIn('students.id', $studentIds)->get()->pluck('id')->toArray();
            // 排查已经存在的学生id
            $studentIds = array_diff($studentIds, $hasStudentIds);
            // 添加到关联表
            $studentIds && $course->students()->attach($studentIds);

            $orders = [];
            foreach ($studentIds as $studentId) {
                $orders[] = [
                    'order_no' => OrderCache::generateOrderNo('O'),
                    'student_id' => $studentId,
                    'course_id' => $courseId,
                    'teacher_id' => $course->teacher_id,
                    'amount' => $course->charge,
                ];
            }

            // 插入订单表
            $orders && Order::query()->insert($orders);

            DB::commit();
        } catch (\Throwable $e) {
            DB::rollBack();

            throw new BusinessException($e->getMessage());
        } finally {
            UserLock::createOrderUnLock($courseId);
        }

        return true;
    }

    /**
     * @param int $id
     *
     * @return true
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function sendOrder(int $id): bool
    {
        $order = Order::query()->find($id);
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        $order->update([
            'status' => OrderConstant::STATUS_1,
            'sender_id' => $this->userId(),
            'send_time' => now(),
        ]);

        return true;
    }

    /**
     * @param array $param
     *
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function orderResult(array $param): array
    {
        /** @var Order $order */
        $order = Order::query()
            ->select(['order_no', 'pay_status'])
            ->where('order_no', $param['order_no'])
            ->where('student_id', $this->userId())
            ->first();
        if (!$order) {
            throw new BusinessException('订单不存在');
        }

        return $order->toArray();
    }
}
