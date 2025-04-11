<?php

namespace App\Http\Controllers;

use App\Http\Controllers\Traits\TokenTrait;
use App\Models\Teacher;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Auth;
use Illuminate\Support\Facades\Hash;

class AuthController extends Controller
{
    use TokenTrait;

    public function login(Request $request)
    {
        // 根据用户名或者邮箱登录
        $admin = Teacher::query()
            ->where('username', $request->input('username'))
            ->firstOrFail();

        // 检验密码是否正确，错误返回 401 和报错信息
        if (!Hash::check($request->password, $admin->password)) {
            return response()->json([
                'message' => '用户名或密码错误',
            ], 401);
        }

        $token = $this->authenticate();
        return response()->json($token);
    }

    public function refresh()
    {
        // 获取 token
        $token = $this->getRefreshToken();
        return response()->json($token);
    }

    public function logout()
    {
        if (Auth::guard('admin')->check()) {
            Auth::guard('admin')->user()->token()->delete();
        }

        return response()->noContent();
    }
}
