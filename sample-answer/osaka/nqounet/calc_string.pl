#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;

sub calc_string {
    my $str = shift;
    if ($str =~ /\A([\-\+]?[0-9]+) ([\+\-\*\/\%]) ([\-\+]?[0-9]+)\z/) {
        my $x    = $1;
        my $y    = $3;
        my $type = $2;
        if ($type eq '+') {
            return $x + $y;
        }
        if ($type eq '-') {
            return $x - $y;
        }
        if ($type eq '*') {
            return $x * $y;
        }
        if ($type eq '/') {
            return $x / $y;
        }
        if ($type eq '%') {
            return $x % $y;
        }
    }
    else {
        return 'ERROR!';
    }
}

while (my $input = <STDIN>) {
    chomp $input;
    say calc_string($input);
}
