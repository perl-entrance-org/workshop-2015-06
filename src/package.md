# package / 名前空間

## packageとは?
- ある処理を行う`output`サブルーチンがあるとします
- それとは別に、`output`と同種の機能を持った、でも少しだけ処理の異なるサブルーチンを作りたくなったとします
- package とは、｢XXの`output`｣のように（XXが数種類ある）、サブルーチンのグループを作る機能です

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

## packageの宣言

    package Foo {
        ...
    }

- packageを定義するためには、`paclage package名 { ... }`と書きます

## packageの宣言

古いPerl（OSに入っているPerlなど）では、以下のように書きます

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

- packageの外は別のpackageなので、中のサブルーチン`output`をそのまま使うことは出来ません
  - ちなみに、何もpackageを宣言していない時は、`main`というpackageに属しています

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
