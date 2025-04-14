<?php

namespace App\Http\Requests\Auth;

use App\Constants\UserConstant;
use App\Http\Requests\BaseRequest;

class LoginRequest extends BaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'username' => 'required|string|max:20',
            'password' => 'required|string|min:6',
            'login_role' => 'required|string|in:' . implode(',', UserConstant::USER_LOGIN_ROLES),
        ];
    }

    /**
     * @return string[]
     * @author xiaowei
     */
    public function messages(): array
    {
        return [
            'username.*' => '用户名必须',
            'password.*' => '密码必须',
            'login_role.*' => '登录角色错误',
        ];
    }
}
