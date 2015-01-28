#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use feature ':5.10';

########################
##Perl入学式 #4 復習問題
###3.$data に人物名と好きな食べ物を (スペース):(スペース) 区切りで与えています.
###この変数から食べ物が何回出現したかカウントして表示させてください.

 my $data = q{
   papix : sushi
   moznion : soba
   boolfool : sushi
   macopy : sushi
 };

 my @lines = split "\n", $data;
 my %foods_count;
 for my $line (@lines){
  if($line =~ m/(\w+)\s:\s(\w+)/){
    $foods_count{$2}++;
  }
}
print Dumper \%foods_count;
