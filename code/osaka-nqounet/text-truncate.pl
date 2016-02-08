#!/usr/bin/env perl
use utf8;
use v5.12;
use warnings;
use open qw/:encoding(utf-8) :std/;

use DDP {deparse => 1};

use Text::Truncate;

my $string = 'This is a long long string.';

p $string;
say truncstr($string, 10);
say truncstr($string, 15);
