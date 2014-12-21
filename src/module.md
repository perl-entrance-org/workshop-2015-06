# モジュール

## モジュールの話

    use Acme::Nyaa;
    use Acme::FizzBuzz;

- 上記は、2013年のPerl入学式 in YAPC::Asia で使ったモジュールです
- このように、処理をひとまとめにして別の場所に置き、`use モジュール名;`で呼び出すものをモジュールと呼びます
- モジュールに分けると、ファイルが長くなって見通しが悪くなることを防ぐことが出来ます
    - それでは、自作モジュールを作っていきましょう

## モジュールの構成

    作業ディレクトリ
     |- plactice.pl # モジュールを実行するスクリプト
     |- lib
        |- PerlEntrance.pm # モジュール本体

- このような構成でフォルダとファイルを作ります
- Perlのスクリプトの拡張子は`*.pl`ですが、モジュールの場合は`*.pm`にします
- PerlEntrance.pm の中に、先ほどの練習問題で書いたコードから、実行する部分を取り除いたものを書いておきます
- PerlEntrance.pm のコードの一番下に、`1;`とだけ書いた行を追加してください

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

## 練習問題

- `PerlBeginners`というモジュール/packageを作って、その中に`perllevel`というサブルーチンを作りましょう
- `perllevel`は1から10の整数の引数を取ります

## 練習問題

    use PerlBeginners;
    print PerlBeginners::perllevel(1);
    # =>
    # レベル1: Perl 関係の書籍や資料を何も読んでいない。(中略)この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して、上記のように使います
- Perlレベルは以下のブログに掲載されています。何らかの形でモジュール内に保持しましょう
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)
