<?php

namespace App\Http\Requests\Course;

use App\Http\Requests\BaseRequest;

class StoreCourseRequest extends BaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'name' => 'required|string|max:40',
            'period' => 'required|string|max:10',
            'charge' => 'required|numeric|min:2000',
            'description' => 'string|max:255',
        ];
    }

    /**
     * @return string[]
     * @author xiaowei
     */
    public function messages(): array
    {
        return [
            'name.*' => '课程名必须',
            'period.*' => '年月必须',
            'charge.*' => '课程费用必须',
            'charge.min' => '课程费用不能小于2000thb',
            'description.*' => '课程描述必须是一个字符串',
        ];
    }
}
