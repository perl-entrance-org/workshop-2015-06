#!/usr/bin/perl

use strict;
use warnings;

my @languages = qw/c ruby perl python java c++/;
for my $lang (@languages) {
    if ($lang eq "perl") {
        print "Find Perl\n";
        last;
    }
    print "$lang\n";
}
