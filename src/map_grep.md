# map と grep

## map

- 配列内の値を、一括で変換する関数です

### 例題
- `1 2 3 4 5`の配列の中身をそれぞれ2倍にして`2 4 6 8 10`にする

## for で作成
    my @array1 = ( 1 .. 5 );
    my @array2 = ();
    for my $val (@array1) {
      push @array2, $val * 2;
    }
    print "@array2"; # => 2 4 6 8 10

- `1 2 3 4 5`の配列を作成し、各要素を2倍して`2, 4, 6, 8, 10` という配列を作成します

## map で作成
    my @array1 = ( 1 .. 5 );
    my @array2 = map { $_ * 2 } @array1;
    print "@array2"; # => 2 4 6 8 10

- 上記のように、一行で処理することができます

## map の構文
    map BLOCK LIST

- `BLOCK` は `{}` で囲まれた式の集合です
- `LIST` には変換の元となる配列を置きます
- `BLOCK` 内の `$_` は `LIST` における一つ一つの要素を指します
- 返り値は変換後の配列です

## grep

- 配列内から条件が真となる値を抽出する関数です

### 例題
- 1〜10の配列から、2で割り切れる数だけを取り出す

## for で作成
    my @array1 = ( 1 .. 10 );
    my @array2 = ();
    for my $val (@array1) {
      if ($val % 2 == 0) {
        push @array2, $val;
      }
    }
    print "@array2"; # => 2 4 6 8 10

- `@array1`のうち、2で割り切れる数を抽出しています

## grep を使う
    my @array1 = ( 1 .. 10 );
    my @array2 = grep { $_ % 2 == 0; } @array1;
    print "@array2"; # => 2 4 6 8 10

- 上記のように一行で処理することができます

## grep の構文
    grep BLOCK LIST

- 構文は `map` と同様です

## 練習問題
    my @files = qw/foo.pl bar.pm baz.rb qux.py/;

上記の配列を引数にして、拡張子の後ろに `.bak` を付け足す `map_bak` 関数と、末尾(拡張子)が `pl`、`pm` であるものを抜き出す `grep_pl_and_pm` を作成してください
