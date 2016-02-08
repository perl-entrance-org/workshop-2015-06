# package / 名前空間

## packageとは?
- ある処理を行うサブルーチンと、それと同種の機能を持った、でも少しだけ処理の異なるサブルーチンを作りたくなったとします
- package とは、そのような似た機能を持つサブルーチンをグループ化する方法です

## packageの宣言

    package Foo {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }

- 渡した文字列に改行を付けて表示してくれる`output`という関数を、`Foo`というpackageの中に作ってみます

## packageの宣言

    package Foo {
        ...
    }

- packageを定義するためには、`package package名 { ... }`と書きます

## packageの宣言

以下のように書くこともできます。

    package Foo;
    ...

- この場合、packageの範囲は次のpackage宣言までです

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

## package 内のサブルーチンを使う

    package Foo {
        sub output {
            my $str = shift @_;
            print "$str\n";
        }
    }
    Foo::output("hello, world!"); # => hello, world![改行]

- package内のサブルーチンを使いたい時は、`package名::サブルーチン名`で呼び出します

## 練習問題

- `PerlEntrance`というpackageの中に、`tokyo`, `osaka`という名前の、それぞれ引数を持たないサブルーチンを作りましょう
- `tokyo`には`Tokyo!`, `osaka`には`Osaka!`という文字列を返す機能を持たせましょう
