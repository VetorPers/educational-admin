<?php

namespace App\Http\Requests\Student;

use App\Http\Requests\BaseRequest;

class IndexStudentRequest extends BaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'page' => 'required|integer|min:1|max:100',
            'per_page' => 'required|integer|min:1|max:100',
            'name' => 'string|max:40',
        ];
    }

    /**
     * @return string[]
     * @author xiaowei
     */
    public function messages(): array
    {
        return [
            'page.required' => '页码必须',
            'page.*' => '页码必须是一个1~100的数字',
            'per_page.required' => '每页数量必须',
            'per_page.*' => '每页数量必须是一个1~100的数字',
            'name.*' => '课程名必须是一个字符串',
        ];
    }
}
