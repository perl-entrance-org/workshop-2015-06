# テスト

## さらりとテストを書く

    use Test::More;
    use PerlEntrance;

    is PerlEntrance::tokyo(), 'moznion!!!';

    done_testing();

- `practice.pl`が置いてあるディレクトリに `plactice.t`という名前で以下の様な内容でコードを書きます
- そのディレクトリで`prove -Ilib practice.t`と実行してみましょう
    - どうなりましたか？

## Test::More

- 今回のテストでは、Test::More というモジュールを使います
- 上のテストでは、`is`という Test::More のサブルーチンを使いました
    - `is <テストしたいサブルーチン> <返ってくるのが期待される値>`のように使います
    - `papix!!!`と返ってくるのが正解ですが、今回はあえて失敗させるために別の文字列（`moznion!!!`）を使っています

## prove

    practice.t .. 1/?
    #   Failed test at practice.t line 5.
    #          got: 'papix!!!'
    #     expected: 'moznion!!!'
    # Looks like you failed 1 test of 1.
    practice.t .. Dubious, test returned 1 (wstat 256, 0x100)
    Failed 1/1 subtests

- Test::More を使ったテストコードを`prove`というコマンドで実行すると、テストの状況を分かりやすく表示できます
- 上記の表示は、「テストのコードでは`moznion!!!`という文字列が返ってくることを期待（`expected`）しているのに、`papix!!!`という文字が返ってきた（`got`）ので、テストが失敗した（`Failed`）」という意味です

## 練習問題
- テストコードは直さずに、コードを直してテストを通るようにしてください
    - ｢エッ!? テストを直すんじゃないの!?｣と思うかもしれません
    - テストとコード、どちらが正しいかでどちらを直すかを決めますが、今回はテストが正しいという方針で進めます
    - `All tests successful.`と出たら、テストは通っています！
