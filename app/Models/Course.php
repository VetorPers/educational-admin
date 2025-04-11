<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use App\Constants\UserConstant;
use Carbon\Carbon;
use Illuminate\Database\Eloquent\SoftDeletes;

/**
 * Class Course
 *
 * @property int         $id
 * @property int         $teacher_id
 * @property string      $name
 * @property string      $period
 * @property float       $charge
 * @property string      $description
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @package App\Models
 */
class Course extends Model
{
    use SoftDeletes;

    protected $table = 'courses';

    protected $casts = [
        'teacher_id' => 'int',
        'charge' => 'float',
    ];

    protected $fillable = [
        'teacher_id',
        'name',
        'period',
        'charge',
        'description',
    ];

    public function teacher()
    {
        return $this->belongsTo(Teacher::class)->where('role_type', UserConstant::USER_ROLE_TYPE_TEACHER);
    }

    public function students()
    {
        return $this->belongsToMany(Student::class, 'course_student', 'course_id', 'student_id');
    }
}
