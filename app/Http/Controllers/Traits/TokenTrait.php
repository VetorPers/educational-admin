<?php

namespace App\Http\Controllers\Traits;

use App\Constants\UserConstant;
use App\Exceptions\BusinessException;
use App\Models\OauthClient;
use App\Utils\ExceptionUtil;
use GuzzleHttp\Client;
use Illuminate\Support\Facades\Log;

/**
 *
 */
trait TokenTrait
{
    /**
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function authenticate(): array
    {
        return $this->reqPassport([
            'grant_type' => 'password', // 认证类型 passport
            'scope' => request('login_role'), // 设置 token 作用域
            'username' => request('username'),
            'password' => request('password'),
        ]);
    }

    /**
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    public function getRefreshToken(): array
    {
        return $this->reqPassport([
            'grant_type' => 'refresh_token', // 认证类型 refresh_token
            'scope' => request('login_role'), // 设置 token 作用域
            'refresh_token' => request('refresh_token'),
        ]);
    }

    /**
     * @param array $params
     *
     * @return array
     * @throws \App\Exceptions\BusinessException
     * @author xiaowei
     */
    protected function reqPassport(array $params): array
    {
        $client = new Client();

        try {
            if (empty($params['grant_type'])) {
                throw new BusinessException('认证类型不能为空');
            }

            if (empty($params['scope'])) {
                throw new BusinessException('作用域不能为空');
            }

            // 请求本地的 passport token
            $url = request()->root() . '/oauth/token';

            // 查询客户端
            $passwordClient = OauthClient::query()->where('name', "passport-{$params['scope']}")->first();
            if (!$passwordClient) {
                throw new BusinessException('没有找到passport客户端');
            }

            $respond = $client->request('POST', $url, [
                'form_params' => array_merge($params, [
                    'client_id' => $passwordClient->id,
                    'client_secret' => $passwordClient->secret,
                ]),
            ]);

            if ($respond->getStatusCode() !== 401) {
                return json_decode($respond->getBody()->getContents(), true);
            }

            throw new BusinessException('授权失败');
        } catch (\Throwable $e) {
            Log::error("请求 {$params['grant_type']} 错误", ['exception' => ExceptionUtil::normalize($e)]);
            throw new BusinessException('系统繁忙');
        }
    }
}
