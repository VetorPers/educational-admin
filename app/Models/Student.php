<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use Carbon\Carbon;
use Laravel\Passport\HasApiTokens;

/**
 * Class Student
 *
 * @property int         $id
 * @property string      $username
 * @property string      $password
 * @property string      $name
 * @property string|null $avatar
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 * @package App\Models
 */
class Student extends Model
{
    use HasApiTokens;

    protected $table = 'students';

    protected $fillable = [
        'username',
        'password',
        'name',
        'avatar',
    ];

    /**
     * Passport 多认证字段
     */
    public function findForPassport($username)
    {
        return self::where('username', $username)->first();
    }
}
