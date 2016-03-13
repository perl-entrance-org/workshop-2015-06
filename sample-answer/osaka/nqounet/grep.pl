#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;

my @array1 = (1 .. 10);
my @array2 = grep { $_ =~ /\A[0-9]+\z/} @array1;
print Dumper \@array1;
print Dumper \@array2;
