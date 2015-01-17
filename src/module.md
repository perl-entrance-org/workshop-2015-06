# モジュール

## モジュールの話

    use Text::Truncate;

    my $long_string = "This is a very long string";
    print truncstr( $long_string, 10); # => This is...

- このように、処理をひとまとめにして別の場所に置き、`use モジュール名;`で呼び出すものをモジュールと呼びます
- モジュールはCPANと呼ばれるアーカイブに集積されているものを利用したり、自分で作ることも出来ます
- モジュールに分けると、ファイルが長くなって見通しが悪くなることを防ぐことができます

## モジュールのインストール

- CPANに公開されているモジュールのインストールには`cpanm`コマンドを利用します
- cpanm自体のインストールはPerl入学式第１回[モジュールとCPAN](https://github.com/perl-entrance-org/workshop-2014-01/blob/master/slide2.md#user-content-%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%A8cpan)を参照してください
- それでは`Text::Truncate`をインストールしてみましょう

    $ cpanm Text::Truncate

## perldocを使う

### ドキュメントを読む

    $ perldoc Text::Truncate

- cpanmでインストールしたモジュールはperldocコマンドでドキュメントを読むことができます

### ソースコードを読む

    $ perldoc -m Text::Truncate

- `perldoc -m`オプションをつけると、ソースコードを表示することができます

## 練習問題

- 実際にText::Truncateを使って、長い文字列を詰めてみましょう

## 自作モジュールを作る

### モジュールの構成

    作業ディレクトリ
     |- plactice.pl # モジュールを実行するスクリプト
     |- lib
        |- PerlEntrance.pm # モジュール本体

- このような構成でフォルダとファイルを作ります
- Perlのスクリプトの拡張子は`*.pl`ですが、モジュールの場合は`*.pm`にします
- PerlEntrance.pm の中に、先ほどの練習問題で書いたコードから、実行する部分を取り除いたものを書いておきます
- PerlEntrance.pm のコードの一番下に、`1;`とだけ書いた行を追加してください

## 自作モジュールを使う

    #!/usr/bin/env perl
    use strict;
    use warnings;
    use PerlEntrance;

    print PerlEntrance::tokyo(); # => Tokyo!
    print PerlEntrance::osaka(); # => Osaka!

- `practice.pl`をこのように書くと、PerlEntrance.pm に書いたサブルーチンを使えるようになります
- ただし、`perl -Ilib practice.pl`のように実行してください
- モジュール名（ファイル名）と package名は、同じ名前にすることが多いです

## 練習問題

- `PerlBeginners`というモジュールを作って、その中に`perllevel`というサブルーチンを作りましょう
- `perllevel`は1から10の整数の引数を取ります

## 練習問題

    use PerlBeginners;
    print PerlBeginners::perllevel(1);
    # =>
    # レベル1: Perl 関係の書籍や資料を何も読んでいない。(中略)この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して、上記のように使います
- Perlレベルは以下のブログに掲載されています。何らかの形でモジュール内に保持しましょう
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)
