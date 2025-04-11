<?php

namespace App\Repositories;

use Illuminate\Support\Arr;
use Illuminate\Support\Str;

/**
 * BaseRepository
 *
 * @author xiaowei
 */
class BaseRepository
{
    /**
     * 分页返回过滤
     *
     * @param array $data
     *
     * @return array
     * @author xiaowei
     */
    public function paginateTransform(array $data): array
    {
        return Arr::only($data, ['current_page', 'data', 'per_page', 'total']);
    }

    /**
     * 获取图片完整路径
     *
     * @param string $path
     *
     * @return string
     * @author xiaowei
     */
    public function imageFullUrl(string $path): string
    {
        if (Str::startsWith($path, 'http')) {
            return $path;
        }

        return sprintf('%s/storage/%s', rtrim(env('TEACH_ADMIN_URL', 'http://127.0.0.1:8093'), '/'), ltrim($path, '/'));
    }
}
