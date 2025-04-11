<?php

namespace App\Utils;

use Throwable;

/**
 * 异常类工具
 */
class ExceptionUtil
{
    /**
     * @param Throwable $e     异常类.
     * @param integer   $depth 链路深度.
     * @return array
     */
    public static function normalize(Throwable $e, int $depth = 5): array
    {
        $data = [
            'class' => get_class($e),
            'message' => $e->getMessage(),
            'code' => $e->getCode(),
            'file' => $e->getFile() . ':' . $e->getLine(),
        ];

        $trace = $e->getTrace();
        if ($depth) {
            $trace = array_slice($trace, 0, $depth);
        }
        foreach ($trace as $frame) {
            if (isset($frame['file'])) {
                $data['trace'][] = sprintf("%s(%s): %s", $frame['file'], $frame['line'], $frame['function'] ?? "none");
            }
        }

        if ($previous = $e->getPrevious()) {
            $data['previous'] = self::normalize($previous, 1);
        }

        return $data;
    }
}
