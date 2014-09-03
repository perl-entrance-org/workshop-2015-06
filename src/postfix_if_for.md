# 後置if, 後置for

## 後置if, 後置for
    if ($lang eq "perl") {
      print "Find Perl\n";
    }
    for my $foo (1 .. 100) {
      print $foo, "\n";
    }

- これらのコードには別の書き方があります

## 後置 if
    print "Find Perl\n" if $lang eq "perl";

- このようにワンライナーで書くことができます
    - `;` の位置に注意してください

## 後置 if
    print "FizzBuzz\n" if $var % 15;
    print "Fizz\n" elsif $var % 3;
    print "Buzz\n" elsif $var % 15;

- こういったコードを書くことはできません
    - 1行目は問題ありませんが, 2, 3行目で `syntax error` となります

## 後置for
    print $_ for (1 .. 100);

- リスト内の要素は, `$_` に格納されます

## 後置for
    print $val for my $val (1 .. 100);

- こういったコードを書くことはできません

## 練習問題

- 引数として与えられた文字列が, `数値A 演算子 数値B`という文字列であれば, その値を計算して, 結果を返すような関数`calc_string`を書いてみましょう
    - ｢数値A｣は任意の桁の正･負の整数とします. また, 演算子は`+-*/%`が使えるものとします.
    - 但し, 引数が与えられなかった場合(空の文字列の場合)は, undefを返します
    - また, `数値A 演算子 数値B`というフォーマットと一致しない場合もundefを返します
- 関数`calc_string`とwhile文を使って, `Ctrl`キーと`d`キーを押すまでの間標準入力から文字列を受け取り, 文字列に書かれた式を計算するようなコードを書いてみましょう
