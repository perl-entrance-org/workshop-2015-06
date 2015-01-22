#!/usr/bin/env perl
use utf8;
use v5.10;
use open qw/:encoding(utf-8) :std/;

use DDP {deparse => 1};

use Path::Tiny qw(path);
use lib path(path(__FILE__)->parent, 'lib')->stringify;
use PerlBeginners;

say PerlBeginners::perllevel(5);
say PerlBeginners::perllevel(0);
say PerlBeginners::perllevel(\010);

1;
