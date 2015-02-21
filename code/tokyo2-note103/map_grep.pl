#!/usr/bin/env perl
use strict;
use warnings;

my @files = qw/foo.pl bar.pm baz.rb qux.py/;

# grep
sub grep_pl_and_pm {
    my @arr = @_;
    my @arr2 = grep { $_ =~ /\.p[lm]$/} @arr;
    return @arr2;
}
print join "\n", grep_pl_and_pm(@files);
print "\n";

# map
sub map_bak {
    my @arr = @_;
    my @arr2 = map {$_ . '.bak'} @arr;
    return @arr2;
}
print join "\n", map_bak(@files);
