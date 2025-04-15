<?php

namespace App\Exceptions;

use App\Utils\EnvUtil;
use App\Utils\ExceptionUtil;
use Illuminate\Auth\Access\AuthorizationException;
use Illuminate\Auth\AuthenticationException;
use Illuminate\Contracts\Support\Responsable;
use Illuminate\Foundation\Exceptions\Handler as ExceptionHandler;
use Illuminate\Http\JsonResponse;
use Illuminate\Http\Response;
use Illuminate\Support\Facades\Log;
use Illuminate\Validation\ValidationException;
use Symfony\Component\HttpKernel\Exception\HttpException;
use Illuminate\Database\Eloquent\ModelNotFoundException;
use Symfony\Component\HttpKernel\Exception\NotFoundHttpException;
use Throwable;

class Handler extends ExceptionHandler
{
    /**
     * A list of the exception types that are not reported.
     *
     * @var array<int, class-string<Throwable>>
     */
    protected $dontReport = [
        AuthorizationException::class,
        HttpException::class,
        ModelNotFoundException::class,
        ValidationException::class,
        BaseException::class,
    ];

    /**
     * A list of the inputs that are never flashed for validation exceptions.
     *
     * @var array<int, string>
     */
    protected $dontFlash = [
        'current_password',
        'password',
        'password_confirmation',
    ];

    /**
     * Register the exception handling callbacks for the application.
     *
     * @return void
     */
    public function register()
    {
        $this->reportable(function (Throwable $e) {
            //
        });
    }

    /**
     * Report or log an exception.
     * This is a great spot to send exceptions to Sentry, Bugsnag, etc.
     *
     * @param Throwable $exception Ex.
     *
     * @return void
     * @throws Throwable
     */
    public function report(Throwable $exception)
    {
        //        parent::report($exception);
        if (!$this->shouldntReport($exception)) {
            $msg = mb_substr($exception->getMessage(), 0, 500);
            $context = [
                'exception' => [
                    'class' => get_class($exception),
                    'code' => $exception->getCode(),
                    'file' => $exception->getFile(),
                    'line' => $exception->getLine(),
                    'trace' => $exception->getTraceAsString(),
                ],
            ];

            Log::error($msg, $context);
        }
    }

    /**
     * @param mixed     $request   Request.
     * @param Throwable $exception Ex.
     *
     * @return JsonResponse|Response|\Symfony\Component\HttpFoundation\Response
     */
    public function render($request, Throwable $exception)
    {
        if (method_exists($exception, 'render')) {
            return $exception->render($request);
        }

        if ($exception instanceof Responsable) {
            return $exception->toResponse($request);
        }

        if ($exception instanceof NotFoundHttpException) {
            return response()->json([
                'code' => 404,
                'sub_code' => $exception->getCode(),
                'msg' => '接口不存在!',
                'data' => null,
            ], 404, [], JSON_UNESCAPED_UNICODE);
        }

        if ($exception instanceof ModelNotFoundException) {
            return response()->json([
                'code' => 404,
                'sub_code' => $exception->getCode(),
                'msg' => '数据不存在!',
                'data' => null,
            ], 404, [], JSON_UNESCAPED_UNICODE);
        }

        if ($exception instanceof AuthenticationException) {
            return response()->json([
                'code' => 80001,
                'sub_code' => $exception->getCode(),
                'msg' => '登陆已过期, 请重新登陆!',
                'data' => null,
            ], 500, [], JSON_UNESCAPED_UNICODE);
        }

        return response()->json([
            'code' => ErrorCode::CODE_ERROR_SYSTEM,
            'sub_code' => $exception->getCode(),
            'msg' => '系统错误',
            'data' => EnvUtil::isRelease() ? null : ExceptionUtil::normalize($exception),
        ], 200, [], JSON_UNESCAPED_UNICODE);
    }
}
