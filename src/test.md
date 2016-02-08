# テスト

## テストを書く

`PerlEntrance`のモジュールに戻って、`practice.pl`と同じディレクトリに `practice.t`という名前で以下のコードを書きます

    use Test::More;
    use PerlEntrance;

    is PerlEntrance::tokyo(), 'Fukuoka!';

    done_testing();

- そのディレクトリで、`prove -Ilib practice.t` と実行してみましょう
    - どうなりましたか？

## Test::More

- 今回のテストでは、Test::More というモジュールを使います
- 上のテストでは、`is`という Test::More のサブルーチンを使いました
    - `is <テストしたいサブルーチン> <期待される返り値>`のように使います
    - `Tokyo!`と返ってくれば「成功」ですが、今回はあえて「失敗」させるために別の文字列`Fukuoka!`を使っています

## prove

    practice.t .. 1/?
    #   Failed test at practice.t line 5.
    #          got: 'Tokyo!'
    #     expected: 'Fukuoka!'
    # Looks like you failed 1 test of 1.
    practice.t .. Dubious, test returned 1 (wstat 256, 0x100)
    Failed 1/1 subtests

- Test::More を使ったテストコードを`prove`というコマンドで実行すると、テストの状況を分かりやすく表示できます
- 上記の表示は、「テストでは`Fukuoka!`という文字列が返ってくることを期待（`expected`）しているのに、実際のコードでは`Tokyo!`という文字が返ってきた（`got`）ので、テストが失敗した（`Failed`）」という意味です

## 練習問題
- テストコードは直さずに、元のコードを直してテストを通るようにしてください
    - ｢テストコードの方を直すんじゃないの？｣と思うかもしれません
    - 実際の開発では、テストと元のコードのどちらが正しいかという前提状況によって、どちらのコードを直すかを決めます。今回は、テストの方が正しいと仮定して進めます
    - `All tests successful.`と出たら、テストは通っています！

