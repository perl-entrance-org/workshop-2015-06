# next, last
- `for`や`while`と組み合わせて使われる関数がいくつかあります。今回はその中から、使用頻度の高い `next`, `last` を紹介します

## next
    my @languages = qw/c ruby perl python java c++/;
    for my $lang (@languages) {
        if ($lang eq "perl") {
            print "Find Perl\n";
            next;
        }
        print "$lang\n";
    }

- 上記のコードを実行してみましょう

## 実行結果 (next)
    c
    ruby
    Find Perl
    python
    java
    c++

- "Find Perl" という文字列は出力されますが、`perl` という文字列は出力されません
    - これは、`next` に到達すると残りの処理を行わず、次のループ（ここでは`$languages[3]`）を開始するためです

## last
    my @languages = qw/c ruby perl python java c++/;
    for my $lang (@languages) {
        if ($lang eq "perl") {
            print "Find Perl\n";
            last;
        }
        print "$lang\n";
    }

- 上記のコードを実行してみましょう
    - `next` を `last` に書き換えるのみです

## 実行結果 (last)
    c
    ruby
    Find Perl

- `$languages[2]` の `perl` という文字列が `if` 文の条件式と一致し、 `last` に到達した時点で `for` ループを抜けます。これにより、その後のループで表示されるはずだった `python`, `java`, `c++` という文字列が表示されません
