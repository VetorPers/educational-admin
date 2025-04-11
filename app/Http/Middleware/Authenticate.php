<?php

namespace App\Http\Middleware;

use App\Exceptions\AuthException;
use Illuminate\Auth\Middleware\Authenticate as Middleware;
use Illuminate\Http\Request;

class Authenticate extends Middleware
{
    /**
     * Get the path the user should be redirected to when they are not authenticated.
     */
    protected function redirectTo(Request $request): ?string
    {
        if (!$request->expectsJson()) {
            if (str_starts_with($request->path(), 'api')) {
                throw new AuthException('登陆已过期, 请重新登陆!');
            }

            return route('login');
        }

        return null;
    }
}
