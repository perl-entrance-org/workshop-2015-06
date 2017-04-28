#!/usr/bin/perl

use Test::More;
use YAPC;

is YAPC::year(), 2015;
is YAPC::month(), 8;
is YAPC::day(), 20;

is YAPC::is_yet("2015/01/01"), 1;
is YAPC::is_yet("2015/12/31"), 0;

done_testing();
