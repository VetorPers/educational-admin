<?php

namespace App\Constants;

class UserConstant
{
    const USER_ROLE_TEACHER = 2;

    const USER_ROLE_TYPE_TEACHER = 1;

    const USER_LOGIN_ROLE_TEACHER = 'teacher';

    const USER_LOGIN_ROLE_STUDENT = 'student';
    const USER_LOGIN_ROLES = [
        self::USER_LOGIN_ROLE_TEACHER,
        self::USER_LOGIN_ROLE_STUDENT,
    ];
}
