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
    # レベル1: Perl 関係の書籍や資料を何も読んでいない。(中略)この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。

- 引数をレベルと解釈して, 上記のように使います.
- Perlレベルは以下のブログに掲載されているので何らかの形でモジュール内に保持しましょう.
    - [Perlプログラマのレベル10 - Perlプログラミング救命病棟より](http://d.hatena.ne.jp/naoya/20050809/)
