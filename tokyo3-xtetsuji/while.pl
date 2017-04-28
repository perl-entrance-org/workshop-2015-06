#!/usr/bin/perl

use strict;
use warnings;

while(my $input = <STDIN>) {
    chomp $input;
    print "echo: $input\n";
}
