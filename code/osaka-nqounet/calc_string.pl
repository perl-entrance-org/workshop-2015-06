#!/usr/bin/env perl
use utf8;
use v5.12;
use open qw/:encoding(utf-8) :std/;

use DDP {deparse => 1};

if (0) {    # デバッグ用
    check('1 + 1', 2);
    check('1 - 1', 0);
    check('1+1');
    check('-1 - +1', -2);
    check('+1 - -1', 2);
    check('-1 * -1', 1);
    check('-1 / -1', 1);
    check('-1 / -0');
    check('-1 % -1', 0);
    check('-1 % 0');
}

while (my $input = <STDIN>) {
    chomp $input;
    say calc_string($input);
}

# 一定の書式に従っている計算式を計算する関数
sub calc_string {
    my ($str) = @_;
    return if $str eq '';
    return unless $str =~ /\A([\+\-]?\d+)\s([\+\-\*\/\%])\s([\+\-]?\d+)\z/ms;
    my $num_a    = $1;
    my $operator = $2;
    my $num_b    = $3;
    if ($operator eq '+') {
        return $num_a + $num_b;
    }
    elsif ($operator eq '-') {
        return $num_a - $num_b;
    }
    elsif ($operator eq '*') {
        return $num_a * $num_b;
    }
    elsif ($operator eq '/') {
        return if $num_b == 0;
        return $num_a / $num_b;
    }
    elsif ($operator eq '%') {
        return if $num_b == 0;
        return $num_a % $num_b;
    }
    return;
}

# 計算させる文字列と期待する答えを渡して関数が正しいか確認する
sub check {
    my ($str, $answer) = @_;
    if (defined $answer) {
        if ($answer == calc_string($str)) {
            say 'OK ' . $str;
        }
        else {
            say 'NG ' . $str;
        }
    }
    else {
        if (calc_string($str)) {
            say 'NG ' . $str;
        }
        else {
            say 'OK ' . $str;
        }
    }
}
