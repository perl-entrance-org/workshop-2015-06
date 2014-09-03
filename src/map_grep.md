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
