# while
`for` 文で繰り返し処理について学びましたが, `while` というものもあります

## whileの例
    while(my $input = <STDIN>) {
        chomp $input;
        print "$input\n";
    }

- `()` 内の処理(*EXPR*)が `真` である間, `{}` 内の処理(*BLOCK*) を繰り返す
    - 今回の場合, 標準入力に `<C-d>`(`Ctrl`キーを押しながら`d`キー) が入力されるまで, 標準入力に入力された文字列を出力します
