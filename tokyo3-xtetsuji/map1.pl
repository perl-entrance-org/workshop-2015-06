#!/usr/bin/perl

use strict;
use warnings;

my @array1 = ( 1 .. 100 );
my @array2 = map { $_ * 7 } @array1;
print "@array2"; # => 2 4 6 8 10

