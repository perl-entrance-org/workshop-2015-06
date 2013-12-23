# Perl入学式 #5

## 今日の内容
- 前回の復習
- Mojoliciousのインストール
- mapとgrep
- while
- next, last
- 後置if, 後置for
- 前回の復習
- package / 名前空間
- モジュール
- テスト
- テストを使った開発

# 前回の復習

- [前回の復習問題](https://github.com/perl-entrance-org/workshop-2013-04/blob/master/practice.md)の｢calc.pl｣の一部のを解きながら, サブルーチンを復習しましょう.

# Mojoliciousのインストール

## Mojoliciousのインストール
- 第6回の｢Webサービス開発｣で利用するWAF, Mojoliciousをインストールしてみましょう
    - 予め, plenv等でシステム以外のPerlを用意しておいてください
    - 詳しくは, #1-Bの資料で解説しています

## Mojoliciousのインストール

    $ cpanm Mojolicious

- ...で, 終わりです
    - 多少時間がかかります. 暫く待ちましょう
    - `1 distribution installed`と表示されていれば成功です

## 動作確認

    $ mojo generate lite_app Sample
      [exist] /home/fukumoto/sandbox
      [write] /home/fukumoto/sandbox/Hoge
      [chmod] Hoge 744

- Mojoliciousのテンプレート(雛形)を作ってみます
    - `mojo`はMojoliciousが提供するコマンドです

## 動作確認

    $ morbo Hoge
    [Sun Dec  8 09:38:11 2013] [info] Listening at "http://*:3000".
    Server available at http://127.0.0.1:3000.

- `mojo create`コマンドが生成する`Hoge`を`morbo`コマンドで実行します
    - ブラウザに, URLとして｢localhost:3000｣と入力した際, ｢Welcome to the Mojolicious real-time web framework!｣と表示されていればOKです!
- 次に, `Hoge`のコードを見てみましょう

## コード(1)
    #!/usr/bin/env perl
    use Mojolicious::Lite;
    
    # Documentation browser under "/perldoc"
    plugin 'PODRenderer';
    
    get '/' => sub {
      my $self = shift;
      $self->render('index');
    };
    
    app->start;

    __DATA__

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

## コントローラとテンプレート
- コード(1)では, 接続したURLに対する処理が書かれています
- コード(2)では, HTMLのテンプレートが書かれています
    - Webアプリケーションを開発する際は, このように｢見た目の部分｣と｢処理の部分｣を分けて書くことが多いです
- 今は1枚のスクリプトに全て書いていますが, 通常これらは別ファイルに分けて記述します

## そして第6回へ...
- 第6回では, いよいよMojoliciousを利用したWebサービスの開発に挑戦します!
- ...が, その前に, 第5回まで紹介できなかったPerlの便利な機能と, テストについて紹介していきたいと思います

# map と grep

## map

- 配列内の値を, 一括で変換する関数です

## mapの例
    my @array1 = ( 1 .. 5 );
    my @array2 = ();
    for my $val (@array1) {
      push @array2, $val * 2;
    }
    print "@array2" # => 2 4 6 8 10

- `2, 4, 6, 8, 10` という配列を作成するならば, このような手順を踏む必要があります

## map を使う
    my @array1 = ( 1 .. 5 );
    my @array2 = map { $_ * 2; } @array1;
       @array2 = map $_ * 2, @array1;

- 上記のように, 一行で処理することができます

## map
    map BLOCK LIST
    map { $_ * 2; } @array1;
    map EXPR, LIST
    map $_ * 2, @array1;

-  `BLOCK` は `{}` で囲まれた式の集合
- `}` の後には変換の元となる配列を置きます
  - `BLOCK` 内における `$_` は `LIST` における一つ一つの要素を指します
- 返り値は変換後の配列です

## grep

- 配列内から条件が真となる値を抽出する関数です

## grepの例
    my @array1 = ( 1 .. 10 );
    my @array2 = ();
    for my $val (@array1) {
      if ($val % 2 == 0) {
        push @array2, $val; # => 2, 4, 6, 8, 10
      }
    }

- `@array1`のうち, 2で割り切れる数を抽出しています

## grep を使う
    my @array1 = ( 1 .. 10 );
    my @array2 = grep { $_ % 2 == 0; } @array1;
       @array2 = grep $_ % 2 == 0, @array1;

- 上記のように一行で処理することができます

## grep
    grep BLOCK LIST
    grep { $_ % 2 == 0; } @array1;
    grep EXPR, LIST
    grep $_ % 2 == 0, @array1;

- 構文は `map` と同様です

## 練習問題
    my @files = qw/papix.pl moznion.pm macopy.py boolfool.vim/;

上記の配列を引数にして, 拡張子の後ろに `.bak` を付け足す `map_bak` 関数と, 末尾(拡張子)が `pl`, `pm` であるものを抜き出す `grep_pl_and_pm` を作成してください

# while
`for` 文で繰り返し処理について学びましたが, `while` というものもあります

## whileの例
    while(my $input = <STDIN>) {
        chomp $input;
        print "$input\n";
    }

- `()` 内の処理(*EXPR*)が `真` である間, `{}` 内の処理(*BLOCK*) を繰り返す
    - 今回の場合, 標準入力に `<C-d>`(`Ctrl`キーを押しながら`d`キー) が入力されるまで, 標準入力に入力された文字列を出力します

# next, last
- 今回は使用頻度の高い `next`, `last` に関して紹介します

## next
    my @languages = qw/c ruby papix perl python java c++/;
    for my $lang (@languages) {
        if ($lang eq "perl") {
            print "Find Perl\n";
            next;
        }
        print "$lang\n";
    }

- 試しに上記のコードを実行してみましょう

## 実行結果 (next)
    c
    ruby
    papix
    Find Perl
    python
    java
    c++

- "Find Perl" という文字列は出力されますが, `perl` という文字列は出力されません
    - これは `next` に到達すると, 残りの処理を行わず, 次のループ `($lang[4])` を開始するためです

## last
    my @languages = qw/c ruby papix perl python java c++/;
    for my $lang (@languages) {
        if ($lang eq "perl") {
            print "Find Perl\n";
            last;
        }
        print "$lang\n";
    }

- 試しに上記のコードを実行してみましょう
    - `next` を `last` に書き換えるのみです

## 実行結果 (last)
    c
    ruby
    papix
    Find Perl

- `$lang[3]` の `perl` という文字列が一致して `if` 文内の `last` に到達した時点で `for` ループを抜けます. そのため `python`, `java`, `c++` という文字列が表示されません

# 後置if/for

## 後置if/for
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

# package / 名前空間

## packageとは?
- ある処理を行う`output`サブルーチンがあるとします
- でも別の`output`サブルーチンを作りたくなったとします
    - 処理が少し違うけれど使い方は一緒とか, 互換性を保ちたいとか...
- そこで｢XXXXの`output`｣, のように, サブルーチンのグループを作る機能です

## packageの宣言

    package Hoge {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }

- それでは, packageを使っていきましょう
- 渡した文字列に改行を付けて表示してくれる`output`という関数を`Hoge`というpackageの中に作ってみます


## packageの宣言

    package Hoge {
        ...
    }

- packageを定義する為には, `sub package名 { ... }`と書きます

## packageの宣言

- 古いPerl(OSに入っているPerlなど)は以下のように書きます

    package Hoge;
    ...

- この場合, packageの範囲は次のpackage宣言までです

## サブルーチンを使う

    package Hoge {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }
    output('hello, world!'); # packageが違うので使えない!!!!

- packageの外は別のpackageなので, 中のサブルーチン`output`をそのまま使うことは出来ません.
- ちなみに何もpackageを宣言していない時は, `main`というpackageに属しています

## サブルーチンを使う

    package Hoge {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }
    Hoge::output("hello, world!"); # => hello, world![改行]

- packageの中のサブルーチンを使いたい時は, `package名::サブルーチン名`で呼び出します

## 練習問題

- `PerlEntrance`というpackageの中に`tokyo`と`osaka`という名前の, 引数を持たないサブルーチンを作りましょう
- tokyoは`papix!!!`, osakaは`boolfool!!!`という文字列を返す機能を持たせましょう

# モジュール

## モジュールの話

    use Acme::Nyaa;
    use Acme::FizzBuzz;

- 入学式の第1回や, Perl入学式 in YAPCで使いました
- このように処理をひとまとめにして別のところに置いて, `use モジュール名;`で呼び出すものをモジュールと呼びます
- モジュールに分けるとファイルが長くなって見通しが悪くなるのを防ぐことが出来ます
    - それでは, 自作モジュールを作っていきましょう

## モジュールの置き場所 

    作業ディレクトリ
     |- plactice.pl # モジュールを実行するスクリプト
     |- lib
        |- PerlEntrance.pm # モジュール本体     

- このような構成でフォルダとファイルを作ります
- Perlのスクリプトの拡張子は`*.pl`ですが, モジュールの場合は`*.pm`にします
- PerlEntrance.pmの中に, 先ほどの練習問題で書いたコードから, 実行する部分を取り除いたものを書いておきます
- さらにPerlEntrance.pmの末尾に`1;`とだけ書かれた行を追加してください

## モジュールを使う

    #!/usr/bin/env perl
    use strict;
    use warnings;

    use PerlEntrance;

    print PerlEntrance::tokyo(); # => papix!!!
    print PerlEntrance::osaka(); # => boolfool!!!

- `practice.pl`をこのように書くと, PerlEntrance.pmに書いたサブルーチンを使えるようになります
- ただし, 実行時は`perl -Ilib practice.pl`のように起動してください
- package名とモジュール名(ファイル名)は, 同じ名前にすることが多いです

## 練習問題

- `PerlBeginners`というモジュール/packageを作ってその中に`perllevel`というサブルーチンを作りましょう
- `perllevel`は1から10の整数の引数を取ります.

## 練習問題

    use PerlBeginners;
    print PerlBeginners::perllevel(1);
    # =>
    # レベル1: Perl 関係の書籍や資料を何も読んでいない。Perl がプログラミング言語だということは知っているが、それ以外のことは何も知らない。他人の書いたPerl プログラムを実行できるので、プログラムの一部を編集することでプログラムの動作の一部（出力される文字列の内容など）を変更できることを知っている。プログラムのほかの部分に変更を加えてもなぜうまくいかないのか理解していない。この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して, 上記のように使います.
- Perlレベルは以下のブログに掲載されているので何らかの形でモジュール内に保持しましょう.
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)

# テスト

## さらりとテストを書く

    use Test::More;
    use PerlEntrance;
    
    is PerlEntrance::tokyo(), 'moznion!!!';
    
    done_testing();

- `practice.pl`が置いてあるディレクトリに. `plactice.t`という名前で以下の様な内容でコードを書きます
- そのディレクトリで`prove -Ilib practice.t`と実行してみましょう
    - どうなりましたか？

## Test::More

- 今回のテストではTest::Moreというモジュールを使います
- 上のテストでは`is`というTest::Moreのサブルーチンを使いました
    - `is <テストしたいサブルーチン> <返ってくるのが期待される値>`のように使います
    - `papix!!!`と返ってくるのが正解ですが, 今回はあえて失敗させるために別の文字列を使っています

## prove

    practice.t .. 1/?
    #   Failed test at practice.t line 5.
    #          got: 'papix!!!'
    #     expected: 'moznion!!!'
    # Looks like you failed 1 test of 1.
    practice.t .. Dubious, test returned 1 (wstat 256, 0x100)
    Failed 1/1 subtests

- Test::Moreを使ったテストコードを`prove`というコマンドで分かりやすくテストの状況を表示できます
    - `papix!!!`という文字が返ってきたが, 正しくは`moznion!!!`なので, テストが失敗した, という意味です

## コードの修正

- ｢エッ!? テストを直すんじゃないの!?｣と思うかもしれません
    - テストとコード, どちらが正しいかでどちらを直すかを決めますが, 今回はテストが正しいという方針で進めます

## 練習問題
- テストコードは直さずに, コードを直してテストを通るようにしてください
    - `All tests successful.`と出たらテストは通っています!

# テストを使った開発
    
## テストを使った開発

- テストコードから書くこともあれば, コードを書いて手で動作を確認した後に, その手動の確認をテストコードに落とすこともあります
    - 自分がわかりやすい方法, 楽な方法でテストは書いていきましょう. 無理して書くものではありません
- 例えばブラウザがないと確認が難しい検証項目をテストコードに落とすのは難しいです. そういうのは手動でやっていくなど使い分けが重要です
    - ただし, 人間はミスをするものだし, コストがかかるものです. 自動化できれば助かることは多いはずです.

## 最終問題
- 隣の人とペアを作ってぶつかり稽古(ペアプログラミング)をしましょう. 1台のPCで作業を行います
- 以下の機能がある`YAPC`モジュールを実装してください
    + 来年のYAPC::Asiaは2014年8月28日から30日に開催予定です. 日付を教えてくれるモジュールを2人で作りましょう
    + `YAPC::year()`で年を4桁の整数で返します(テストをAの人が, コードをBの人が書きましょう)
    + `YAPC::month()`で月を2桁の整数で返します(テストをBの人が, コードをAの人が書きましょう)
    + `YAPC::day()`で日付を2桁の整数で返します(テストをAの人が, コードをBの人が書きましょう)
    + `YAPC::is_yet()`で開催前か開催後かを真か偽で返します(テストをBの人が, コードをAの人が書きましょう)

- 最後の項目はテストもコードも結構難しいです! サポーターの人に｢どうすればXXXXが出来る?｣と聞きましょう

## 最終問題のヒント

- `prove -l`と`prove -Ilib`は実は同じです
- `ok YAPC::is_yet();`でちゃんと真が返ってきているかをテストできます
    - 偽を調べたい時は`ok !YAPC::is_yet();`と書きます
- 日付をうまく操作するには`Time::Piece`というモジュールを使います
- もっとテストしたい方は時間を進めて本当に開催後に`is_yet()`が真になるか調べたいかと思います
    - テスト内の時間を操作するには`Test::MockTime`を使ってみてください
