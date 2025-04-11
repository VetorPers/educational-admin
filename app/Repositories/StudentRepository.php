<?php

namespace App\Repositories;

use App\Models\Student;

/**
 * StudentRepository
 *
 * @author xiaowei
 */
class StudentRepository extends BaseRepository
{
    /**
     * @param array $param
     *
     * @return array
     * @author xiaowei
     */
    public function index(array $param): array
    {
        $query = Student::query()->select(['id', 'name', 'avatar']);

        // 查询条件
        !empty($param['name']) && $query->where('name', 'like', '%' . $param['name'] . '%');
        if (!empty($param['course_id'])) {
            $query->whereDoesntHave('courses', function ($query) use ($param) {
                $query->where('course_id', $param['course_id']);
            });
        }

        // 排序
        $query = $query->orderBy('id', 'desc');

        $data = $query->paginate($param['per_page'] ?? 10, page: $param['page'] ?? 1)->toArray();
        foreach ($data['data'] as &$datum) {
            $datum['avatar'] = $this->imageFullUrl($datum['avatar']);
        }
        unset($datum);

        return $this->paginateTransform($data);
    }
}
