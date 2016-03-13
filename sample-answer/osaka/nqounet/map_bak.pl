#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;


my @files  = qw/foo.pl bar.pm baz.rb qux.py hoge.bak/;
my @result = map_bak(@files);
print Dumper \@result;
my @result2 = grep_pl_and_pm_map_bak(@files);
print Dumper \@result2;


sub map_bak {
    my @files  = @_;
    my @result = map {
        if ($_ =~ /\.bak\z/) {
            $_;
        }
        else {
            $_ . '.bak';
        }
    } @files;
    return @result;
}

sub grep_pl_and_pm {
    my @files = @_;
    my @result = grep { $_ =~ /\.p[lm]\z/ } @files;
    return @result;
}

sub grep_pl_and_pm_map_bak {
    my @files   = @_;
    my @result  = grep_pl_and_pm(@files);
    my @result2 = map_bak(@result);
    return @result2;
}
