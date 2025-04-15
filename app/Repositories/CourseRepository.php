<?php

namespace App\Repositories;

use App\Constants\UserConstant;
use App\Exceptions\BusinessException;
use App\Models\Course;

/**
 * CourseRepository
 *
 * @author xiaowei
 */
class CourseRepository extends BaseRepository
{
    /**
     * @param array $param
     *
     * @return array
     * @author xiaowei
     */
    public function index(array $param): array
    {
        $query = Course::query()->with(['teacher:id,name,avatar', 'students:id,name,avatar']);

        // 查询条件
        !empty($param['course.name']) && $query->where('course.name', 'like', '%' . $param['name'] . '%');
        // 获取学生课程
        if (isset($param['login_role']) && $param['login_role'] == UserConstant::USER_LOGIN_ROLE_STUDENT) {
            $query->whereHas('students', function ($query) {
                $query->where('students.id', $this->userId());
            });
        }

        // 排序
        $query = $query->orderBy('courses.id', 'desc');

        $data = $query->paginate($param['per_page'] ?? 10, page: $param['page'] ?? 1)->toArray();
        foreach ($data['data'] as &$datum) {
            !empty($datum['teacher']['avatar']) && $datum['teacher']['avatar'] = $this->imageFullUrl($datum['teacher']['avatar']);
            foreach ($datum['students'] as &$student) {
                !empty($student['avatar']) && $student['avatar'] = $this->imageFullUrl($student['avatar']);
                unset($student['pivot']);
            }
        }
        unset($student, $datum);

        return $this->paginateTransform($data);
    }

    /**
     * @param array $param
     *
     * @return array
     * @author xiaowei
     */
    public function store(array $param): array
    {
        $param['teacher_id'] = $this->userId();

        $course = Course::query()->create($param);

        return $course->toArray();
    }

    /**
     * @param int   $id
     * @param array $param
     *
     * @return array
     * @author xiaowei
     */
    public function update(int $id, array $param): array
    {
        $course = Course::query()->where('teacher_id', $this->userId())->findOrFail($id);

        $course->fill($param)->save();

        return $course->refresh()->toArray();
    }

    /**
     * @param int $id
     *
     * @return true
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function destroy(int $id): bool
    {
        $course = Course::query()->where('teacher_id', $this->userId())->findOrFail($id);
        if ($course->students()->exists()) {
            throw new BusinessException('课程下有学生，无法删除');
        }

        $course->delete();

        return true;
    }
}
