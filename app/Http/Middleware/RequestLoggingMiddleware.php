<?php

namespace App\Http\Middleware;

use App\Utils\EnvUtil;
use Closure;
use Illuminate\Http\Request;
use Illuminate\Support\Facades\Log;
use Illuminate\Support\Str;

class RequestLoggingMiddleware
{
    /**
     * @var string[]
     */
    protected array $accept = [
        'callback/*', 'api/*',
    ];

    /**
     * @param $request
     *
     * @return bool
     * @author xiaowei
     */
    protected function inAcceptArray($request): bool
    {
        foreach ($this->accept as $accept) {
            if ($accept !== '/') {
                $accept = trim($accept, '/');
            }

            if ($request->fullUrlIs($accept) || $request->is($accept)) {
                return true;
            }
        }

        return false;
    }

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
        $path = $request->path();
        if (!$this->inAcceptArray($request)) {
            return $next($request);
        }

        // 在请求处理之前记录请求信息
        Log::channel('access')->info('request start ' . $path);

        $response = $next($request);

        // 在响应发送之后记录响应信息
        $code = $response->getStatusCode();
        Log::channel('access')->info('request end ' . $path, [
            'status' => $code,
            'content' => Str::startsWith($code, [2]) ? $response->getContent() : $response->statusText(),
        ]);

        return $response;
    }
}
