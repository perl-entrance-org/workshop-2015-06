 #!/usr/bin/env perl

 use strict;
 use warnings;
 use Data::Dumper;
 use feature ':5.10';

#####################
##calc_string練習問題
###1.引数として与えられた文字列が、数値A 演算子 数値Bという文字列であれば、その式を計算して結果を返す関数calc_stringを書いてみましょう
###2.関数calc_stringとwhile文を使って、Ctrlキーとdキーを押すまでの間、標準入力から文字列を受け取り、文字列に書かれた式を計算するようなコードを書いてみましょう

 sub calc_string{
  my $str = shift;
  return "undifined_if!" if !($str);
  return "undifined_unless" unless ($str);
  return "undifined_defined" if !defined($str);
  my @strings = split(/ /,$str);
  return 'first not num!!' unless $strings[0] =~ m/^[-]?\d+$/;
  return 'not set Operator' unless $strings[1] =~ m/(\+|\-|\*|\/|%)/;
  return 'second not num!!' unless $strings[2] =~ /^[-]?\d+$/;
  my $result = '';
  $result = $strings[0] + $strings[2] if $strings[1] eq '+';
  $result = $strings[0] - $strings[2] if $strings[1] eq '-';
  $result = $strings[0] * $strings[2] if $strings[1] eq '*';
  $result = $strings[0] / $strings[2] if $strings[1] eq '/';
  $result = $strings[0] % $strings[2] if $strings[1] eq '%';
  return $result;
 }

while(my $input = <STDIN>) {
    chomp $input;
    my $result = calc_string($input);
    print "$result\n";
}
 # print calc_string('')."\n";
 # print calc_string('1 +1')."\n";
 # print calc_string('1 + 1')."\n";
 # print calc_string('3 - 1')."\n";
