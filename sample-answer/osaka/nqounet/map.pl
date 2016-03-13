#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;

my @array1 = (1 .. 5);
my @array2 = map { $_ * 2 } @array1;
print Dumper \@array1;
print Dumper \@array2;
