#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;

my $result = calc(2, '4');
print Dumper $result;

sub calc {
    my ($x, $y) = @_;

    if ($x =~ /[^0-9]/) {
        print 'x error!';
        return undef;
    }
    if ($y !~ /\A[0-9]+\z/) {
        print 'y error!';
        return;
    }

    my $array = +[1, 1, 1];
    p $array;
    my $hash = +{};
    p $hash;
    my $array2 = [1, 1, 1];
    p $array2;
    my $hash2 = {};
    p $hash2;

    my $result = +{
        add => $x + $y,
        sub => $x - $y,
        mul => $x * $y,
        div => $x / $y,
        mod => $x % $y,
    };
    return $result;
}

sub ya_calc {
    my ($x, $y) = @_;

    my %hash;
    $hash{add} = $x + $y;
    $hash{sub} = $x - $y;
    $hash{mul} = $x * $y;
    $hash{div} = $x / $y;
    $hash{mod} = $x % $y;
    return \%hash;
}
