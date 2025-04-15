<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use App\Constants\UserConstant;
use Carbon\Carbon;

/**
 * Class Order
 *
 * @property int         $id
 * @property string      $order_no
 * @property int         $student_id
 * @property int         $teacher_id
 * @property int         $course_id
 * @property int         $sender_id
 * @property Carbon|null $send_time
 * @property float       $amount
 * @property int         $status
 * @property int         $pay_status
 * @property Carbon|null $pay_time
 * @property string|null $pay_info
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @property string|null $pay_id
 * @package App\Models
 */
class Order extends Model
{
    protected $table = 'orders';

    protected $casts = [
        'student_id' => 'int',
        'teacher_id' => 'int',
        'sender_id' => 'int',
        'course_id' => 'int',
        'amount' => 'float',
        'status' => 'int',
        'pay_status' => 'int',
        'pay_time' => 'datetime',
        'send_time' => 'datetime',
    ];

    protected $fillable = [
        'order_no',
        'student_id',
        'teacher_id',
        'course_id',
        'sender_id',
        'send_time',
        'amount',
        'status',
        'pay_status',
        'pay_time',
        'pay_info',
        'pay_id',
    ];

    public function student()
    {
        return $this->belongsTo(Student::class);
    }

    public function teacher()
    {
        return $this->belongsTo(Teacher::class)->where('role_type', UserConstant::USER_ROLE_TYPE_TEACHER);
    }

    public function course()
    {
        return $this->belongsTo(Course::class);
    }
}
