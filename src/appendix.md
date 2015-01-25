# 後置if, 後置for

## 後置if, 後置for
通常、if文やfor文は以下のように書きますが、

    #if文
    if ($lang eq "perl") {
      print "Find Perl\n";
    }

    #for文
    for my $foo (1 .. 100) {
      print $foo, "\n";
    }

これらのコードには別の書き方があります

## 後置 if
if文は以下のように1行で書くことができます（「ワンライナー」と言います）

    print "Find Perl\n" if $lang eq "perl";

## 後置 if
この際、このように書くことはできますが、

    print "FizzBuzz\n" if $var % 15;

このように書くことはできません

    print "Fizz\n" elsif $var % 3;
    print "Buzz\n" elsif $var % 15;

- `syntax error` となります

## 後置for
for文を1行で書く場合、リスト内の要素は `$_` に格納されます

    print $_ for (1 .. 100);

## 後置for
この際、このようなコードを書くことはできません

    print $val for my $val (1 .. 100);

