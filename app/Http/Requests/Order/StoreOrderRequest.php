<?php

namespace App\Http\Requests\Order;

use App\Http\Requests\BaseRequest;

class StoreOrderRequest extends BaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'course_id' => 'required|integer|min:1',
            'student_ids' => 'required|array',
        ];
    }

    /**
     * @return string[]
     * @author xiaowei
     */
    public function messages(): array
    {
        return [
            'course_id.*' => '课程ID必须',
            'student_ids.*' => '学生ID必须',
        ];
    }
}
