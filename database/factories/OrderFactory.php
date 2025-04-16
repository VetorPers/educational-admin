<?php

namespace Database\Factories;

use App\Constants\OrderConstant;
use App\Models\Order;
use Illuminate\Database\Eloquent\Factories\Factory;

/**
 * @extends \Illuminate\Database\Eloquent\Factories\Factory<\App\Models\Order>
 */
class OrderFactory extends Factory
{
    protected $model = Order::class;

    /**
     * Define the model's default state.
     *
     * @return array<string, mixed>
     */
    public function definition(): array
    {
        return [
            'pay_id' => fake()->unique()->uuid(),
            'pay_status' => OrderConstant::PAY_STATUS_0,
            'order_no' => fake()->unique()->uuid(),
            'student_id' => fake()->numberBetween(1, 100),
            'teacher_id' => fake()->numberBetween(1, 100),
            'course_id' => fake()->numberBetween(1, 100),
            'amount' => fake()->randomFloat(2, 10, 1000),
        ];
    }
}
