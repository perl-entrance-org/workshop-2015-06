#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use feature ':5.10';

###################
##mapを使用した例題

my @array = (1..10);
my @array2 = ();
for my $val(@array){
  push @array2,$val*2;
}

my @array3 = map{$_ * 2}@array;
say Dumper @array3;

my @strs = ('aa','bb    c','c   c');
say @strs;

my @forma_str = map{$_ =~ s/\s//g;$_}@strs;
print "@forma_str"."\n";
