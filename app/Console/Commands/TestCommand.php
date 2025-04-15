<?php

namespace App\Console\Commands;

use Illuminate\Console\Command;

class TestCommand extends Command
{
    /**
     * The name and signature of the console command.
     *
     * @var string
     */
    protected $signature = 'vtest';

    /**
     * The console command description.
     *
     * @var string
     */
    protected $description = 'Command description';

    /**
     * Create a new command instance.
     *
     * @return void
     */
    public function __construct()
    {
        parent::__construct();
    }

    /**
     * Execute the console command.
     *
     * @return int
     */
    public function handle()
    {
        define('OMISE_PUBLIC_KEY', 'pkey_test_63bwxqmlsds8p45awi2');
        define('OMISE_SECRET_KEY', 'skey_test_63bwxqn57v2ad58dly8');
        $r = \OmiseLink::search('link_test_63e6gpw9aqnegxsaija');
        dd($r);
        return 0;
    }
}
