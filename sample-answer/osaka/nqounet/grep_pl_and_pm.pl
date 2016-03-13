#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;


my @files  = qw/foo.pl bar.pm baz.rb qux.py hoge.ppm/;
my @result = grep_pl_and_pm(@files);
print Dumper \@result;

sub grep_pl_and_pm {
    my @files = @_;
    my @result = grep { $_ =~ /\.p[lm]\z/ } @files;
    return @result;
}
