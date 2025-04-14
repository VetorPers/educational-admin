<?php

namespace App\Http\Requests\Pay;

use App\Http\Requests\BaseRequest;

class PayOrderRequest extends BaseRequest
{
    /**
     * Get the validation rules that apply to the request.
     *
     * @return array<string, \Illuminate\Contracts\Validation\ValidationRule|array<mixed>|string>
     */
    public function rules(): array
    {
        return [
            'order_no' => 'required|string|max:30',
        ];
    }

    /**
     * @return string[]
     * @author xiaowei
     */
    public function messages(): array
    {
        return [
            'order_no.*' => '订单号必须',
        ];
    }
}
