#!/usr/bin/env perl

use strict;
use warnings;
use lib "lib";
use PerlBeginners;

##################
##練習問題
###PerlBeginnersというモジュールを作って、その中にperllevelというサブルーチンを作りましょう
###perllevelは1から10の整数の引数を取ります
###引数をレベルと解釈して、上記のように使います
###Perlレベルは以下のブログに掲載されています。何らかの形でモジュール内に保持しましょう

print PerlBeginners::perllevel(10);
print PerlBeginners::perllevel('a');
