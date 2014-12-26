<!-- このファイルは直接編集せずに src ディレクトリ内のファイルを編集し build.pl を実行してください。 -->
# Perl入学式
### 第5回 モジュール/テスト編

___
## 本日の講師

___
## 本日の内容
- 前回の復習
- Mojoliciousのインストール
- mapとgrep
- while
- next, last
- 後置if, 後置for
- package / 名前空間
- モジュール
- テスト
- テストを使った開発

___
## 皆さんで自己紹介

---
# 前回の復習

- [前回の復習問題](https://github.com/perl-entrance-org/workshop-2013-04/blob/master/practice.md)の｢calc.pl｣の一部を解きながら、サブルーチンを復習しましょう。

---
# Mojoliciousのインストール

___
## Mojoliciousのインストール
- 第6回の｢Webサービス開発｣で利用するWAF、Mojoliciousをインストールしてみましょう
    - あらかじめ plenv 等でシステム以外のPerlを用意しておいてください
    - 詳しくは、#1-Bの資料で解説しています

___
## Mojoliciousのインストール

    $ cpanm Mojolicious

- 以上です
    - 多少時間がかかります。しばらく待ちましょう
    - `1 distribution installed`と表示されていれば成功です

___
## 動作確認

    $ mojo generate lite_app
      [exist] /Users/hoge/sandbox
      [write] /Users/hoge/sandbox/myapp.pl
      [chmod] /Users/hoge/sandbox/myapp.pl 744

- Mojoliciousのテンプレート(雛形)を作ってみます
    - `mojo`はMojoliciousが提供するコマンドです

___
## 動作確認

    $ morbo myapp.pl
    [Sun Dec  8 09:38:11 2013] [info] Listening at "http://*:3000".
    Server available at http://127.0.0.1:3000.

- `mojo generate lite_app`コマンドが生成する`myapp.pl`を`morbo`コマンドで実行します
    - ブラウザに、URLとして｢localhost:3000｣と入力した際、｢Welcome to the Mojolicious real-time web framework!｣と表示されていればOKです!
- 次に、`myapp.pl`のコードを見てみましょう

___
## コード(1)
    #!/usr/bin/env perl
    use Mojolicious::Lite;

    # Documentation browser under "/perldoc"
    plugin 'PODRenderer';

    get '/' => sub {
      my $c = shift;
      $c->render('index');
    };

    app->start;
    __DATA__

___
## コード(2)
    @@ index.html.ep
    % layout 'default';
    % title 'Welcome';
    Welcome to the Mojolicious real-time web framework!

    @@ layouts/default.html.ep
    <!DOCTYPE html>
    <html>
      <head><title><%= title %></title></head>
      <body><%= content %></body>
    </html>

___
## コントローラとテンプレート
- コード(1)では、接続したURLに対する処理が書かれています
- コード(2)では、HTMLのテンプレートが書かれています
    - Webアプリケーションを開発する際は、このように｢見た目の部分｣と｢処理の部分｣を分けて書くことが多いです
- 今は1枚のスクリプトに全て書いていますが、通常これらは別ファイルに分けて記述します

___
## そして第6回へ……
- 第6回では、いよいよMojoliciousを利用したWebサービスの開発に挑戦します!
- ……が、その前に、第5回まで紹介できなかったPerlの便利な機能と、テストについて紹介していきたいと思います

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
    for my $val (@array1) {
      push @array2, $val * 2;
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
    for my $val (@array1) {
      if ($val % 2 == 0) {
        push @array2, $val;
      }
    }
    print "@array2"; # => 2 4 6 8 10

- `@array1`のうち、2で割り切れる数を抽出しています

___
## grep を使う
    my @array1 = ( 1 .. 10 );
    my @array2 = grep { $_ % 2 == 0; } @array1;
    print "@array2"; # => 2 4 6 8 10

- 上記のように一行で処理することができます

___
## grep の構文
    grep BLOCK LIST

- 構文は `map` と同様です

___
## 練習問題
    my @files = qw/foo.pl bar.pm baz.rb qux.py/;

上記の配列を引数にして、拡張子の後ろに `.bak` を付け足す `map_bak` 関数と、末尾(拡張子)が `pl`、`pm` であるものを抜き出す `grep_pl_and_pm` を作成してください

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
- 今回は使用頻度の高い `next`, `last` に関して紹介します

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
    - これは、`next` に到達すると残りの処理を行わず、次のループ（ここでは`$lang[4]`）を開始するためです

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

- `$lang[3]` の `perl` という文字列が `if` 文の条件式と一致し、 `last` に到達した時点で `for` ループを抜けます。これにより、その後のループで表示されるはずだった `python`, `java`, `c++` という文字列が表示されません

---
# 後置if, 後置for

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
この際、このように書くことはできますが、

    print "FizzBuzz\n" if $var % 15;

このように書くことはできません

    print "Fizz\n" elsif $var % 3;
    print "Buzz\n" elsif $var % 15;

- `syntax error` となります

___
## 後置for
for文を1行で書く場合、リスト内の要素は `$_` に格納されます

    print $_ for (1 .. 100);

___
## 後置for
この際、このようなコードを書くことはできません

    print $val for my $val (1 .. 100);

___
## 練習問題

- 引数として与えられた文字列が、`数値A 演算子 数値B`という文字列であれば、その式を計算して結果を返す関数`calc_string`を書いてみましょう
    - 「数値A」「演算子」「数値B」の間にはそれぞれ半角スペースが入っています
    - 数値は正･負の整数とし、演算子は`+-*/%`が使えるものとします
    - 引数が与えられなかった場合（空の文字列の場合)は、undefを返すこととます
    - 引数が `数値A 演算子 数値B` というフォーマットに一致しない場合もundefを返すこととします
- 関数`calc_string`とwhile文を使って、`Ctrl`キーと`d`キーを押すまでの間、標準入力から文字列を受け取り、文字列に書かれた式を計算するようなコードを書いてみましょう


---
# package / 名前空間

___
## packageとは?
- ある処理を行う`output`サブルーチンがあるとします
- それとは別に、`output`と同種の機能を持った、でも少しだけ処理の異なるサブルーチンを作りたくなったとします
- package とは、｢XXの`output`｣のように（XXが数種類ある）、サブルーチンのグループを作る機能です

___
## packageの宣言

    package Foo {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }

- 渡した文字列に改行を付けて表示してくれる`output`という関数を、`Foo`というpackageの中に作ってみます
  - ここで出てきた`Foo`は、意味のない「仮の名前」（メタ構文変数）です。このように、プログラミングで変数や関数に名前を付ける際、どのような名前でも良い場合には `foo, bar, baz, qux...` がよく使われます（順番も左記の通り）
  - 日本では `hoge, piyo, fuga` なども使われますが、特別の理由がなければ `foo, bar...`で良いでしょう

___
## packageの宣言

    package Foo {
        ...
    }

- packageを定義するためには、`paclage package名 { ... }`と書きます

___
## packageの宣言

古いPerl（OSに入っているPerlなど）では、以下のように書きます

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

- packageの外は別のpackageなので、中のサブルーチン`output`をそのまま使うことは出来ません
  - ちなみに、何もpackageを宣言していない時は、`main`というpackageに属しています

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
## モジュールの話

    use Acme::Nyaa;
    use Acme::FizzBuzz;

- 上記は、2013年の「Perl入学式 in YAPC::Asia」で使ったモジュールです
- このように、処理をひとまとめにして別の場所に置き、`use モジュール名;`で呼び出すものをモジュールと呼びます
- モジュールに分けると、ファイルが長くなって見通しが悪くなることを防ぐことができます
    - それでは、自作モジュールを作っていきましょう

___
## モジュールの構成

    作業ディレクトリ
     |- plactice.pl # モジュールを実行するスクリプト
     |- lib
        |- PerlEntrance.pm # モジュール本体

- このような構成でフォルダとファイルを作ります
- Perlのスクリプトの拡張子は`*.pl`ですが、モジュールの場合は`*.pm`にします
- PerlEntrance.pm の中に、先ほどの練習問題で書いたコードから、実行する部分を取り除いたものを書いておきます
- PerlEntrance.pm のコードの一番下に、`1;`とだけ書いた行を追加してください

___
## モジュールを使う

    #!/usr/bin/env perl
    use strict;
    use warnings;
    use PerlEntrance;

    print PerlEntrance::tokyo(); # => papix!!!
    print PerlEntrance::osaka(); # => boolfool!!!

- `practice.pl`をこのように書くと、PerlEntrance.pm に書いたサブルーチンを使えるようになります
- ただし、`perl -Ilib practice.pl`のように実行してください
- モジュール名（ファイル名）と package名は、同じ名前にすることが多いです

___
## 練習問題

- `PerlBeginners`というモジュール/packageを作って、その中に`perllevel`というサブルーチンを作りましょう
- `perllevel`は1から10の整数の引数を取ります

___
## 練習問題

    use PerlBeginners;
    print PerlBeginners::perllevel(1);
    # =>
    # レベル1: Perl 関係の書籍や資料を何も読んでいない。(中略)この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して、上記のように使います
- Perlレベルは以下のブログに掲載されています。何らかの形でモジュール内に保持しましょう
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)

---
# テスト

___
## テストを書く

`practice.pl`が置いてあるディレクトリに `plactice.t`という名前で以下のようなコードを書きます

    use Test::More;
    use PerlEntrance;

    is PerlEntrance::tokyo(), 'Fukuoka!';

    done_testing();

- そのディレクトリで、`prove -Ilib practice.t`と実行してみましょう
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

- テストはテストコードから書くこともあれば、対象のコードを書いて手で動作を確認した後に、その手動の内容をテストコードに落とすこともあります
- テストは無理をして書くものではありません。自分がわかりやすい方法、楽な方法で書いていきましょう
- たとえば、ブラウザがなければ確認が難しい検証項目をテストコードに落とすことは困難です。そのような場合には手動で行うなど、適材適所の使い分けが重要です

___
## 最終問題（初級編）
隣の人とペアを組み、ペアプログラミングをしましょう。ペアプログラミングでは、1台のPCで作業を行います

- 以下の機能がある`YAPC`モジュールを実装してください
    + 次回の YAPC::Asia は、2015年8月20日から22日に開催予定です。日付を教えてくれるモジュールを2人で作りましょう
    + `YAPC::year()`で年を4桁の整数で返します（テストをAの人が、コードをBの人が書きましょう）
    + `YAPC::month()`で月を2桁の整数で返します（テストをBの人が、コードをAの人が書きましょう）
    + `YAPC::day()`で日付を2桁の整数で返します（テストをAの人が、コードをBの人が書きましょう）

___
## 最終問題（上級編）
- 以下の機能がある`YAPC`モジュールを実装してください
    + `YAPC::is_yet(<日付の文字列>)`で、開催前か開催後かを真か偽で返します（テストをBの人が、コードをAの人が書きましょう）
    + ｢8月28日以前｣ならば開催前（真）、それ以降であれば開催後（偽）として扱うことにします
        + 日付のフォーマットは、｢4桁の年/2桁の月/2桁の日｣という形にします
        + たとえば、2015年1月1日は、｢2015/01/01｣です
- この上級編はテストもコードも結構難しいです! わからないことがあれば、サポーターに｢どうすればXXXXが出来る？｣と聞いてみましょう

___
## 最終問題のヒント
- `prove -l`と`prove -Ilib`は実は同じです
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
