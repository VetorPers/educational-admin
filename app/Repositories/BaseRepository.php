<?php

namespace App\Repositories;

use Illuminate\Support\Arr;
use Illuminate\Support\Facades\Auth;
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
     * @param string|null $path
     *
     * @return string
     * @author xiaowei
     */
    public function imageFullUrl(string $path = null): string
    {
        if (empty($path)) {
            return '';
        }

        if (Str::startsWith($path, 'http')) {
            return $path;
        }

        return sprintf('%s/storage/%s', rtrim(env('TEACH_ADMIN_URL', 'http://127.0.0.1:8093'), '/'), ltrim($path, '/'));
    }

    /**
     * @param string $guard
     *
     * @return int
     * @author xiaowei
     */
    public function userId(string $guard = 'api'): int
    {
        $user = Auth::guard($guard)->user();
        if (!$user) {
            return 0;
        }

        return intval($user->id);
    }
}
