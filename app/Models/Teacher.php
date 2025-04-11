<?php

/**
 * Created by Reliese Model.
 */

namespace App\Models;

use App\Constants\UserConstant;
use Carbon\Carbon;
use Illuminate\Foundation\Auth\User as Authenticatable;
use Laravel\Passport\HasApiTokens;

/**
 * Class Teacher
 *
 * @property int $id
 * @property string $username
 * @property string $password
 * @property string $name
 * @property string|null $avatar
 * @property Carbon|null $created_at
 * @property Carbon|null $updated_at
 *
 * @package App\Models
 */
class Teacher extends Authenticatable
{
    use HasApiTokens;

	protected $table = 'admin_users';

	protected $fillable = [
		'username',
		'password',
		'name',
		'avatar'
	];

    /**
     * Passport 多认证字段
     */
    public function findForPassport($username)
    {
        return self::where('username', $username)->where('role_type', UserConstant::USER_ROLE_TYPE_TEACHER)->first();
    }
}
