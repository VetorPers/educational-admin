<?php

namespace App\Logging;

use Illuminate\Log\Logger;
use Monolog\Formatter\JsonFormatter;

class CustomizeFormatter
{
    /**
     * 自定义给定的记录器实例。
     *
     * @param Logger $logger
     *
     * @return void
     */
    public function __invoke(Logger $logger): void
    {
        foreach ($logger->getHandlers() as $handler) {
            $logger->pushProcessor(function ($data) {
                $this->setDataExtra($data);

                return $data;
            });

            $format = new JsonFormatter();
            $format->setDateFormat('Y-m-d H:i:s');
            $handler->setFormatter($format);
        }
    }

    /**
     * @param $data
     *
     * @return void
     * @author xiaowei
     */
    protected function setDataExtra(&$data): void
    {
        $bizId = BIZ_ID;
        $originTraceId = request()->header('Origin-trace-id');
        $traceId = request()->header('Stgw-request-id', TRACE_ID);

        $data['extra']['biz_id'] = $bizId;
        $data['extra']['origin_trace_id'] = $originTraceId;
        $data['extra']['trace_id'] = $traceId;
        $data['extra']['path'] = request()->path();
        $data['extra']['ip'] = request()->ip();
        $data['extra']['param'] = request()->all();
        $data['extra']['method'] = request()->method();
    }
}
