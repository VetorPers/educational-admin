<?php

use Illuminate\Support\Facades\Route;


Route::group([

], function () {
    // 登录
    Route::post('login', [\App\Http\Controllers\AuthController::class, 'login']);
    // 刷新 token
    Route::put('refresh', 'AuthController@refresh');
    Route::group([
//        'middleware' => ['auth:api'],
    ], function () {
        // 退出
        Route::delete('logout', 'AuthController@logout');
        // 详情
        Route::get('customers/current', 'CustomersController@current');

        Route::group([
            'prefix' => 'teacher',
        ], function () {
            Route::resource('courses', \App\Http\Controllers\CourseController::class);

            Route::get('orders', [\App\Http\Controllers\OrderController::class, 'index']);
            Route::get('students', [\App\Http\Controllers\StudentController::class, 'index']);
            Route::post('create-order', [\App\Http\Controllers\OrderController::class, 'store']);
            Route::post('send-order', [\App\Http\Controllers\OrderController::class, 'sendOrder']);
        });
    });
});
