#!/usr/bin/env perl
use utf8;
use v5.12;
use warnings;
use open qw/:encoding(utf-8) :std/;

use DDP {deparse => 1};

my @files = qw/foo.pl bar.pm baz.rb qux.py/;

say 'map_bak';
say join ', ', map_bak(\@files);
say 'grep_pl_and_pm';
say join ', ', grep_pl_and_pm(\@files);

sub map_bak {
    my ($files) = @_;
    my @result = map {"$_.bak"} @{$files};
    return @result;
}

sub grep_pl_and_pm {
    my ($files) = @_;
    my @result = grep { $_ =~ /\.p[lm]\z/ } @{$files};
    return @result;
}
