# モジュール

## モジュールとは

    use Text::Truncate;

    my $long_string = "This is a very long string";
    print truncstr( $long_string, 10); # => This is...

- モジュールとは、ある処理をひとまとめにして別の場所に置き、必要に応じて呼び出して使うものです
- モジュールは `use モジュール名;` で呼び出します
- モジュールはCPANと呼ばれる場所に集積されているものを利用したり、自分で作ったりして使います
- 一定の処理をモジュールに分けると、コードの見通しが悪くなることを防ぐことができます

## モジュールのインストール

- CPANに公開されているモジュールをインストールするには`cpanm`コマンドを利用します
- cpanmはPerl入学式第1回でインストールしています。まだの方は資料を参照してください
  - [第1回資料: モジュールとCPAN](https://github.com/perl-entrance-org/workshop-2014-01/blob/master/slide2.md#user-content-%E3%83%A2%E3%82%B8%E3%83%A5%E3%83%BC%E3%83%AB%E3%81%A8cpan)
- 今回はモジュールの例として、`Text::Truncate` をインストールしてみましょう

    $ cpanm Text::Truncate

## モジュールのドキュメントを読む

### perldocを使う

    $ perldoc Text::Truncate

- perldocコマンドを使って、インストールしたモジュールのドキュメントを読むことができます

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

- このような構成でディレクトリ（フォルダ）とファイルを作ります
- Perlのスクリプトの拡張子は`*.pl`ですが、モジュールの場合は`*.pm`にします
- package の練習問題で書いたコードから、実行する部分を取り除いたものを PerlEntrance.pm に書いておきます
- PerlEntrance.pm のコードの一番下に、`1;` とだけ書いた行を追加してください

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

## 練習問題

- `PerlBeginners`というモジュールを作って、その中に`perllevel`というサブルーチンを作りましょう
- `perllevel`は、1から10の整数を引数に取ることとします

## 練習問題

    use PerlBeginners;
    print PerlBeginners::perllevel(1);
    # => レベル1: Perl 関係の書籍や資料を何も読んでいない。(中略)この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して、上記のように使います
- Perlレベルは以下のブログに掲載されています。何らかの形でモジュール内に保持しましょう
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)
