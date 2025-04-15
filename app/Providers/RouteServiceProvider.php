<?php

namespace App\Providers;

use App\Constants\UserConstant;
use Illuminate\Cache\RateLimiting\Limit;
use Illuminate\Foundation\Support\Providers\RouteServiceProvider as ServiceProvider;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\RateLimiter;
use Illuminate\Support\Facades\Route;

class RouteServiceProvider extends ServiceProvider
{
    /**
     * The path to your application's "home" route.
     *
     * Typically, users are redirected here after authentication.
     *
     * @var string
     */
    public const HOME = '/home';

    /**
     * Define your route model bindings, pattern filters, and other route configuration.
     */
    public function boot(): void
    {
        RateLimiter::for('api', function (Request $request) {
            return Limit::perMinute(60)->by($request->user()?->id ?: $request->ip());
        });

        request()->is('api/*') && $this->setApiGuard(request());

        $this->routes(function () {
            Route::middleware('api')
                ->prefix('api')
                ->group(base_path('routes/api.php'));

            Route::middleware('web')
                ->group(base_path('routes/web.php'));
        });
    }

    protected function setApiGuard(Request $request)
    {
        if ($request->is('api/teacher/*')) {
            config(['auth.guards.api.provider' => 'teachers']);

            return;
        }

        if ($request->is('api/student/*')) {
            config(['auth.guards.api.provider' => 'students']);

            return;
        }

        $loginRole = $request->input('login_role', UserConstant::USER_LOGIN_ROLE_STUDENT);
        if ($loginRole == UserConstant::USER_LOGIN_ROLE_TEACHER) {
            config(['auth.guards.api.provider' => 'teachers']);

            return;
        }

        config(['auth.guards.api.provider' => 'students']);
    }
}
