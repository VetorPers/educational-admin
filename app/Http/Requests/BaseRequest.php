<?php

namespace App\Http\Requests;

use App\Exceptions\InvalidArgumentException;
use Illuminate\Contracts\Validation\Validator;
use Illuminate\Foundation\Http\FormRequest;

class BaseRequest extends FormRequest
{
    /**
     * Determine if the user is authorized to make this request.
     *
     * @return bool
     */
    public function authorize(): bool
    {
        return true;
    }

    /**
     * Handle a failed validation attempt.
     *
     * @param Validator $validator
     *
     * @return void
     * @throws InvalidArgumentException
     */
    protected function failedValidation(Validator $validator): void
    {
        throw new InvalidArgumentException($validator->errors()->first());
    }
}
