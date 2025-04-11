<?php

namespace App\Logging;

use App\Services\Message\DingTalk;
use App\Utils\EnvUtil;
use Guanguans\Notify\DingTalk\Messages\MarkdownMessage;
use Monolog\Logger;
use Monolog\Handler\AbstractProcessingHandler;

/**
 * PushLogHandler
 *
 * @author xiaowei
 */
class PushLogHandler extends AbstractProcessingHandler
{
    public function __construct($level = Logger::DEBUG, bool $bubble = true)
    {
        parent::__construct($level, $bubble);
    }

    /**
     * @param array $record
     *
     * @return void
     * @author xiaowei
     */
    protected function write(array $record): void
    {
        if ($this->isHandling($record) && !EnvUtil::isLocal()) {
            $this->pushMessage($record);
        }
    }

    /**
     * @param array $data
     *
     * @return bool
     * @author xiaowei
     */
    protected function pushMessage(array $data): bool
    {
        $now = now();
        $path = request()->path();
        $env = EnvUtil::getEnv();
        $context = json_encode($data['context'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        $param = json_encode($data['extra']['param'], JSON_UNESCAPED_UNICODE | JSON_UNESCAPED_SLASHES);
        $text = ">**BIZ**：<font color='SlateGray'>{$data['extra']['biz_id']}</font><br/>
>**ORIGIN-TRACE**：<font color='SlateGray'>{$data['extra']['origin_trace_id']}</font><br/>
>**TRACE**：<font color='SlateGray'>{$data['extra']['trace_id']}</font><br/>
>**环境**：<font color='SlateGray'>{$env}</font><br/>
>**路由**：<font color='SlateGray'>{$path}</font><br/>
>**参数**：<font color='SlateGray'>{$param}</font><br/>
>**信息**：<font color='warning'>{$data['message']}</font><br/>
>**内容**：<font color='SlateGray'>{$context}</font><br/>
>**时间**：<font color='SlateGray'>{$now}</font>";

        $msg = MarkdownMessage::make([
            'title' => '业务日志',
            'text' => $text,
        ]);
        return (new DingTalk())->push($msg);
    }
}
