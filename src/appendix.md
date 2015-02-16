# 付録: 後置if, 後置for

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
この際、このように書くことはできません

    print "Find Perl\n" if $lang eq "perl";
    print "Find Ruby\n" elsif $lang eq "ruby";
    print "Find Python\n" elsif $lang eq "python";

- `elsif` を使った行は `syntax error` になります

## 後置for
for文を1行で書く場合、リスト内の要素は `$_` に格納されます

    print $_ for (1 .. 100);

## 後置for
この際、このようなコードを書くことはできません

    print $foo for my $foo (1 .. 100);

