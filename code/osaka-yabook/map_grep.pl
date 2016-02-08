#!/usr/bin/env perl

use strict;
use warnings;
use Data::Dumper;
use feature ':5.10';

my @files = qw/foo.pl bar.pm baz.rb qux.py/;

sub map_back{
  my @files = @_;
  my @format = ();
  @format = map{$_ =~ s/$/.bak/g;$_;}@files;
  return @format;
}
say Dumper map_back(@files);

sub grep_pl_and_pm{
  my @files = @_;
  my @get = ();
  @get = grep{$_ =~ /pm|pl/}@files;
  return @get;
}
say Dumper grep_pl_and_pm(@files);
