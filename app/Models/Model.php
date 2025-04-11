<?php

namespace App\Models;

use Carbon\CarbonInterface;
use Illuminate\Database\Eloquent\Model as BaseModel;

class Model extends BaseModel
{
    protected function serializeDate(\DateTimeInterface $date): string
    {
        return $date->format(CarbonInterface::DEFAULT_TO_STRING_FORMAT);
    }

    protected $connection = 'pgsql';
}
