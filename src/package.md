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
