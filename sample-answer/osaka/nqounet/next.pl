#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;

my @languages = qw/c ruby perl python java c++/;
for my $lang (@languages) {
    if ($lang eq "perl") {
        print "Find Perl\n";
        next;
    }
    print "$lang\n";
}
