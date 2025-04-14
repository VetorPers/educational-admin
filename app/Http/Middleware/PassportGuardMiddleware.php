<?php

namespace App\Http\Middleware;

use App\Constants\UserConstant;
use Closure;
use Illuminate\Http\Request;

class PassportGuardMiddleware
{
    /**
     * Handle an incoming request.
     *
     * @param \Illuminate\Http\Request                                                                          $request
     * @param \Closure(\Illuminate\Http\Request): (\Illuminate\Http\Response|\Illuminate\Http\RedirectResponse) $next
     *
     * @return \Illuminate\Http\Response|\Illuminate\Http\RedirectResponse
     */
    public function handle(Request $request, Closure $next)
    {
        if ($request->is('api/teacher/*')) {
            config(['auth.guards.api.provider' => 'teachers']);

            return $next($request);
        }

        if ($request->is('api/student/*')) {
            config(['auth.guards.api.provider' => 'students']);

            return $next($request);
        }

        $loginRole = $request->input('login_role', UserConstant::USER_LOGIN_ROLE_STUDENT);
        if ($loginRole == UserConstant::USER_LOGIN_ROLE_TEACHER) {
            config(['auth.guards.api.provider' => 'teachers']);
        }

        config(['auth.guards.api.provider' => 'students']);

        return $next($request);
    }
}
