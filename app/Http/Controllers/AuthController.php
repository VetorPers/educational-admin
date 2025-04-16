<?php

namespace App\Http\Controllers;

use App\Constants\UserConstant;
use App\Exceptions\BusinessException;
use App\Http\Controllers\Traits\TokenTrait;
use App\Http\Requests\Auth\LoginRequest;
use App\Models\Student;
use App\Models\Teacher;
use App\Repositories\BaseRepository;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;
use Illuminate\Http\JsonResponse;

class AuthController extends Controller
{
    use TokenTrait;

    /**
     * @param \App\Http\Requests\Auth\LoginRequest $request
     *
     * @return \Illuminate\Http\JsonResponse
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function login(LoginRequest $request): JsonResponse
    {
        $reqData = $request->validated();

        // 根据用户名登录
        $query = match ($reqData['login_role']) {
            UserConstant::USER_LOGIN_ROLE_STUDENT => Student::query(),
            UserConstant::USER_LOGIN_ROLE_TEACHER => Teacher::query(),
            default => throw new BusinessException('登录角色错误'),
        };

        $user = $query->where('username', $request->input('username'))->firstOrFail();

        // 检验密码是否正确，错误返回 401 和报错信息
        if (!Hash::check($request->password, $user->password)) {
            return $this->error('用户名或密码错误');
        }

        return $this->success(array_merge($this->authenticate(), [
            'login_role' => $reqData['login_role'],
            'id' => $user->id,
            'name' => $user->name,
            'avatar' => (new BaseRepository)->imageFullUrl($user->avatar),
        ]));
    }

    /**
     * @return \Illuminate\Http\JsonResponse
     * @author xiaowei
     */
    public function logout(): JsonResponse
    {
        if (Auth::guard('api')->check()) {
            Auth::guard('api')->user()->token()->delete();
        }

        return $this->success([]);
    }
}
