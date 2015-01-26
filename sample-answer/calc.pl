#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use feature ':5.10';

sub calc{
  my ($first,$second) = @_;
  if($first =~ m|^\d+$| && $second =~ m/^\d+$/){
    my %result = (
      add => $first + $second,
      sub => $first - $second,
      mol => $first * $second,
      div => $first / $second,
      mod => $first % $second,
    );
    return \%result;
  }else{
    return undef;
  }
}

print Dumper calc(9,6);
print Dumper calc('a','b');

sub result_dump{
 my $result = shift;
  for my $key (keys %$result){
    print $key."=>".$result->{$key}.",\n";
  }
  return;
 }

# result_dump(calc(9,6));
