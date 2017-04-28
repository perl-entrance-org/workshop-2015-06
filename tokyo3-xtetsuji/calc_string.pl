#!/usr/bin/perl

use strict;
use warnings;

# my $formula = "40 ^ 7";
# my $answer = calc_string($formula);
# print "$formula is $answer\n";

while (my $input = <STDIN>) {
    chomp $input;
    $input =~ s/^((\d+) ([-+\/*%] (\d+)$)/$1/ee;
    print "answer $input\n";

    my $answer = calc_string($input);
    print "$input is $answer\n";
}

sub calc_string {
    my $formula = shift;
    print "suushi is $formula\n";
    $formula =~ /^(\d+) ([+*\/%-]) (\d+)$/; # 正規表現で分割
    my ($left, $right) = ($1, $3); # 括弧のキャプチャでとる
    my $operator = $2;
    if ( !$operator ) {
        die "ERROR!\n";
    }
    if ( $operator eq '+' ) {
        return $left + $right;
    }
    if ( $operator eq '-' ) {
        return $left - $right;
    }
    if ( $operator eq '/' ) {
        if ( $right == 0 ) {
            die "ゼロでわっちゃだめです\n";
        }
        return $left / $right;
    }
    if ( $operator eq '*' ) {
        return $left * $right;
    }
    if ( $operator eq '%' ) {
        return $left % $right;
    }
}
