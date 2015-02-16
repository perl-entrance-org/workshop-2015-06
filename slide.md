<!-- このファイルは直接編集せずに src ディレクトリ内のファイルを編集し build.pl を実行してください。 -->
# Perl入学式
### 第5回 モジュール/テスト編

___
## 諸注意
- 会場について
    - 飲食・喫煙・トイレetc
- 写真撮影について
    - 写真撮影NGな方はお手数ですが申し出てください

___
## 紹介
- 講師・サポーター紹介

___
## 本日の内容
- 前回の復習
- mapとgrep
- while
- next, last
- package / 名前空間
- モジュール
- テスト
- テストを使った開発
- 付録: 後置if, 後置for

___
## 皆さんで自己紹介

---
# 前回の復習

- [前回の復習問題](https://github.com/perl-entrance-org/workshop-2014-04/blob/master/practice.md)の｢calc.pl｣の一部を解きながら、サブルーチンを復習しましょう。

---
# map と grep

___
## map

- 配列内の値を、一括で変換する関数です

### 例題
- `1 2 3 4 5`の配列の中身をそれぞれ2倍にして`2 4 6 8 10`にする

___
## for で作成
    my @array1 = ( 1 .. 5 );
    my @array2 = ();
    for my $foo (@array1) {
      push @array2, $foo * 2;
    }
    print "@array2"; # => 2 4 6 8 10

- `1 2 3 4 5`の配列を作成し、各要素を2倍して`2, 4, 6, 8, 10` という配列を作成します

___
## map で作成
    my @array1 = ( 1 .. 5 );
    my @array2 = map { $_ * 2 } @array1;
    print "@array2"; # => 2 4 6 8 10

- 上記のように、一行で処理することができます

___
## map の構文
    map BLOCK LIST

- `BLOCK` は `{}` で囲まれた式の集合です
- `LIST` には変換の元となる配列を置きます
- `BLOCK` 内の `$_` は `LIST` における一つ一つの要素を指します
- 返り値は変換後の配列です

___
## grep

- 配列内から条件が真となる値を抽出する関数です

### 例題
- 1〜10の配列から、2で割り切れる数だけを取り出す

___
## for で作成
    my @array1 = ( 1 .. 10 );
    my @array2 = ();
    for my $foo (@array1) {
      if ($foo % 2 == 0) {
        push @array2, $foo;
      }
    }
    print "@array2"; # => 2 4 6 8 10

- `@array1`のうち、2で割り切れる数を抽出しています

___
## grep を使う
    my @array1 = ( 1 .. 10 );
    my @array2 = grep { $_ % 2 == 0 } @array1;
    print "@array2"; # => 2 4 6 8 10

- 上記のように一行で処理することができます

___
## grep の構文
    grep BLOCK LIST

- 構文は `map` と同様です

___
## 練習問題
    my @files = qw/foo.pl bar.pm baz.rb qux.py/;

- 上記の配列を引数として、拡張子（`.pl`、`.pm` など）の後ろに `.bak` を付け足す関数 `map_bak` を作成してください
- 拡張子が `pl`、`pm` であるものを抜き出す関数 `grep_pl_and_pm` を作成してください

---
# while
`for` 文で繰り返し処理について学びましたが、`while` というものもあります

___
## while の例
    while(my $input = <STDIN>) {
        chomp $input;
        print "$input\n";
    }

- `()` 内の式が真である間、`{}` 内の処理を繰り返します
- 上記の場合、標準入力に `<C-d>`(`Ctrl`キーを押しながら`d`キー) が入力されるまで、標準入力に入力された文字列を出力し続けます

---
# next, last
- `for`や`while`と組み合わせて使われる関数がいくつかあります。今回はその中から、使用頻度の高い `next`, `last` を紹介します

___
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

___
## 実行結果 (next)
    c
    ruby
    Find Perl
    python
    java
    c++

- "Find Perl" という文字列は出力されますが、`perl` という文字列は出力されません
    - これは、`next` に到達すると残りの処理を行わず、次のループ（ここでは`$languages[3]`）を開始するためです

___
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

___
## 実行結果 (last)
    c
    ruby
    Find Perl

- `$languages[2]` の `perl` という文字列が `if` 文の条件式と一致し、 `last` に到達した時点で `for` ループを抜けます。これにより、その後のループで表示されるはずだった `python`, `java`, `c++` という文字列が表示されません

---
## 練習問題

- 引数が`数値A 演算子 数値B`という文字列であれば、その式を計算して結果を返す関数`calc_string`を書いてみましょう
    - 「数値A」「演算子」「数値B」の間にはそれぞれ半角スペースが入ります
    - 数値は正･負の整数とし、演算子は`+-*/%`が使えるものとします
    - 引数が `数値A 演算子 数値B` というフォーマットに一致しない場合は `ERROR!` という文字列を返すようにしましょう
- 関数`calc_string`とwhile文を使って、`Ctrl`キーと`d`キーを押すまでの間、標準入力から文字列を受け取り、文字列に書かれた式を計算するようなコードを書いてみましょう


---
# package / 名前空間

___
## packageとは?
- ある処理を行うサブルーチンと、それと同種の機能を持った、でも少しだけ処理の異なるサブルーチンを作りたくなったとします
- package とは、そのような似た機能を持つ複数のサブルーチンをグループ化する方法です

___
## packageの宣言

    package Foo {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }

- 渡した文字列に改行を付けて表示してくれる`output`という関数を、`Foo`というpackageの中に作ってみます
  - ところで、ここで出てきた`Foo`は、意味のない「仮の名前」（メタ構文変数）です。このように、プログラミングで変数や関数に名前を付ける際、どのような名前でも良い場合には `foo, bar, baz, qux...` がよく使われます（順番も左記の通り）
  - 日本では `hoge, piyo, fuga` なども使われますが、特別の理由がなければ `foo, bar...`で良いでしょう

___
## packageの宣言

    package Foo {
        ...
    }

- packageを定義するためには、`package package名 { ... }`と書きます

___
## packageの宣言

以下のように書くこともできます。

    package Foo;
    ...

- この場合、packageの範囲は次のpackage宣言までです

___
## package 内のサブルーチンを使う

    package Foo {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }
    output('hello, world!'); # packageが異なるので使えない

- packageの外は別のpackageなので、package内のサブルーチン`output`をそのまま使うことは出来ません
  - 何もpackageを宣言していない時は、`main`というpackageに属しています

___
## package 内のサブルーチンを使う

    package Foo {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }
    Foo::output("hello, world!"); # => hello, world![改行]

- package内のサブルーチンを使いたい時は、`package名::サブルーチン名`で呼び出します

___
## 練習問題

- `PerlEntrance`というpackageの中に、`tokyo`, `osaka`という名前の、それぞれ引数を持たないサブルーチンを作りましょう
- `tokyo`には`Tokyo!`, `osaka`には`Osaka!`という文字列を返す機能を持たせましょう

---
# モジュール

___
## モジュールとは

    use Text::Truncate;

    my $long_string = "This is a very long string";
    print truncstr( $long_string, 10); # => This is...

- モジュールとは、ある処理をひとまとめにして別の場所に置き、必要に応じて呼び出して使うものです
- モジュールは `use モジュール名;` で呼び出します
- モジュールはCPANと呼ばれる場所に集積されているものを利用したり、自分で作ったりして使います
- 一定の処理をモジュールに分けると、コードの見通しが悪くなることを防ぐことができます

___
## モジュールのインストール

- CPANに公開されているモジュールをインストールするには`cpanm`コマンドを利用します
- cpanmはPerl入学式第1回でインストールしています。まだの方は資料を参照してください
  - [第1回資料: モジュールとCPAN](https://github.com/perl-entrance-org/workshop-2014-01/blob/master/slide2.md#user-content-%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%A8cpan)
- 今回はモジュールの例として、`Text::Truncate` をインストールしてみましょう

    $ cpanm Text::Truncate

___
## モジュールのドキュメントを読む

### perldocを使う

    $ perldoc Text::Truncate

- perldocコマンドを使って、インストールしたモジュールのドキュメントを読むことができます

### ソースコードを読む

    $ perldoc -m Text::Truncate

- `perldoc -m`オプションをつけると、ソースコードを表示することができます

___
## 練習問題

- 実際にText::Truncateを使って、長い文字列を詰めてみましょう

___
## 自作モジュールを作る

### モジュールの構成

    作業ディレクトリ
     |- plactice.pl # モジュールを実行するスクリプト
     |- lib
        |- PerlEntrance.pm # モジュール本体

- このような構成でディレクトリ（フォルダ）とファイルを作ります
- Perlのスクリプトの拡張子は`*.pl`ですが、モジュールの場合は`*.pm`にします
- package の練習問題で書いたコードから、実行する部分を取り除いたものを PerlEntrance.pm に書いておきます
- PerlEntrance.pm のコードの一番下に、`1;` とだけ書いた行を追加してください

___
## 自作モジュールを使う

    #!/usr/bin/env perl
    use strict;
    use warnings;
    use PerlEntrance;

    print PerlEntrance::tokyo(); # => Tokyo!
    print PerlEntrance::osaka(); # => Osaka!

- `practice.pl`をこのように書くと、PerlEntrance.pm に書いたサブルーチンを使えるようになります
- ただし、実行時には `perl practice.pl` ではなく `perl -Ilib practice.pl` としてください
- モジュール名（ファイル名）と package名は、同じ名前にすることが多いです

___
## 練習問題

- `PerlBeginners`というモジュールを作って、その中に`perllevel`というサブルーチンを作りましょう
- `perllevel`は、1から10の整数を引数に取ることとします

___
## 練習問題

    use PerlBeginners;
    print PerlBeginners::perllevel(1);
    # => レベル1: Perl 関係の書籍や資料を何も読んでいない。(中略)この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して、上記のように使います
- Perlレベルは以下のブログに掲載されています。何らかの形でモジュール内に保持しましょう
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)

---
# テスト

___
## テストを書く

`practice.pl`が置いてあるディレクトリに `practice.t`という名前で以下のようなコードを書きます

    use Test::More;
    use PerlEntrance;

    is PerlEntrance::tokyo(), 'Fukuoka!';

    done_testing();

- そのディレクトリで、`prove -Ilib practice.t` と実行してみましょう
    - どうなりましたか？

___
## Test::More

- 今回のテストでは、Test::More というモジュールを使います
- 上のテストでは、`is`という Test::More のサブルーチンを使いました
    - `is <テストしたいサブルーチン> <返ってくるのが期待される値>`のように使います
    - `Tokyo!`と返ってくれば「成功」ですが、今回はあえて「失敗」させるために別の文字列`Fukuoka!`を使っています

___
## prove

    practice.t .. 1/?
    #   Failed test at practice.t line 5.
    #          got: 'Tokyo!'
    #     expected: 'Fukuoka!'
    # Looks like you failed 1 test of 1.
    practice.t .. Dubious, test returned 1 (wstat 256, 0x100)
    Failed 1/1 subtests

- Test::More を使ったテストコードを`prove`というコマンドで実行すると、テストの状況を分かりやすく表示できます
- 上記の表示は、「テストでは`Fukuoka!`という文字列が返ってくることを期待（`expected`）しているのに、実際のコードでは`Tokyo!`という文字が返ってきた（`got`）ので、テストが失敗した（`Failed`）」という意味です

___
## 練習問題
- テストコードは直さずに、元のコードを直してテストを通るようにしてください
    - ｢テストコードの方を直すんじゃないの？｣と思うかもしれません
    - 実際の開発では、テストと元のコードのどちらが正しいかという前提状況によって、どちらのコードを直すかを決めます。今回は、テストの方が正しいと仮定して進めます
    - `All tests successful.`と出たら、テストは通っています！


---
# テストを使った開発

___
## テストを使った開発

- テストはテストコードから書くこともあれば、対象のコードを書いて手で動作を確認した後に、その手動の内容をテストコードに反映することもあります
- テストは無理をして書くものではありません。自分がわかりやすい方法、楽な方法で書いていきましょう
- たとえば、ブラウザがなければ確認が難しい内容をテストコードで検証することは困難です。そのような場合には手動で行うなど、適材適所の使い分けが重要です

___
## 最終問題（初級編）
隣の人とペアを組み、ペアプログラミングをしましょう。ペアプログラミングでは、1台のPCで作業を行います

- 以下の機能がある`YAPC`モジュールを実装してください
    + 次回の YAPC::Asia は、2015年8月20日から22日に開催予定です。日付を教えてくれるモジュールを2人で作りましょう
    + `YAPC::year()`で年(2015)を4桁の整数で返します（先にAの人がテストを、次にBの人がコードを書きましょう）
    + `YAPC::month()`で月(8)を1桁の整数で返します（今度はBの人がテストを、Aの人がコードを書きましょう）
    + `YAPC::day()`で開催日初日の日付(20)を2桁の整数で返します（Aの人がテストを、Bの人がコードを書きましょう）

___
## 最終問題（上級編）
- 以下の機能がある`YAPC`モジュールを実装してください
    + `YAPC::is_yet(<日付の文字列>)`で、開催前か開催後かを真か偽で返します（先にBの人がテストを、Aの人がコードを書きましょう）
    + ｢2015年8月20日より前｣ならば「真」、それ以降であれば「偽」として扱うことにします
        + 日付のフォーマットは、｢4桁の年/2桁の月/2桁の日｣という形にします
        + たとえば、2015年1月1日は、｢2015/01/01｣です
- この上級編はテストもコードも結構難しいです! わからないことがあれば、サポーターに｢どうすればXXXXが出来る？｣と聞いてみましょう

___
## 最終問題のヒント
- `prove -Ilib`は、実は`prove -l`と書くことができます
- `ok YAPC::is_yet();`でちゃんと真が返ってきているかをテストできます
    - 偽を調べたい時は`ok !YAPC::is_yet();`と書きます

___
## ワンランク上の実装へ……
- `YAPC::is_yet`は、引数として日付の文字列を受け取るのではなく、｢プログラムを実行した現在の時間｣を利用して実装することもできます
    - 日付を操作するには`Time::Piece`というモジュールを使うと良いでしょう
    - テスト内の時間を操作する場合は、`Test::MockTime`を使ってみましょう

---
# 質問タイム

---
# お疲れさまでした

---
# 付録: 後置if, 後置for

___
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

___
## 後置 if
if文は以下のように1行で書くことができます（「ワンライナー」と言います）

    print "Find Perl\n" if $lang eq "perl";

___
## 後置 if
この際、このように書くことはできません

    print "Find Perl\n" if $lang eq "perl";
    print "Find Ruby\n" elsif $lang eq "ruby";
    print "Find Python\n" elsif $lang eq "python";

- `elsif` を使った行は `syntax error` になります

___
## 後置for
for文を1行で書く場合、リスト内の要素は `$_` に格納されます

    print $_ for (1 .. 100);

___
## 後置for
この際、このようなコードを書くことはできません

    print $foo for my $foo (1 .. 100);

