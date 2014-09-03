# Mojoliciousのインストール

## Mojoliciousのインストール
- 第6回の｢Webサービス開発｣で利用するWAF, Mojoliciousをインストールしてみましょう
    - 予め, plenv等でシステム以外のPerlを用意しておいてください
    - 詳しくは, #1-Bの資料で解説しています

## Mojoliciousのインストール

    $ cpanm Mojolicious

- ...で, 終わりです
    - 多少時間がかかります. 暫く待ちましょう
    - `1 distribution installed`と表示されていれば成功です

## 動作確認

    $ mojo generate lite_app Sample
      [exist] /home/fukumoto/sandbox
      [write] /home/fukumoto/sandbox/Hoge
      [chmod] Hoge 744

- Mojoliciousのテンプレート(雛形)を作ってみます
    - `mojo`はMojoliciousが提供するコマンドです

## 動作確認

    $ morbo Hoge
    [Sun Dec  8 09:38:11 2013] [info] Listening at "http://*:3000".
    Server available at http://127.0.0.1:3000.

- `mojo create`コマンドが生成する`Hoge`を`morbo`コマンドで実行します
    - ブラウザに, URLとして｢localhost:3000｣と入力した際, ｢Welcome to the Mojolicious real-time web framework!｣と表示されていればOKです!
- 次に, `Hoge`のコードを見てみましょう

## コード(1)
    #!/usr/bin/env perl
    use Mojolicious::Lite;

    # Documentation browser under "/perldoc"
    plugin 'PODRenderer';

    get '/' => sub {
      my $self = shift;
      $self->render('index');
    };

    app->start;

    __DATA__

## コード(2)

    @@ index.html.ep
    % layout 'default';
    % title 'Welcome';
    Welcome to the Mojolicious real-time web framework!

    @@ layouts/default.html.ep
    <!DOCTYPE html>
    <html>
      <head><title><%= title %></title></head>
      <body><%= content %></body>
    </html>

## コントローラとテンプレート
- コード(1)では, 接続したURLに対する処理が書かれています
- コード(2)では, HTMLのテンプレートが書かれています
    - Webアプリケーションを開発する際は, このように｢見た目の部分｣と｢処理の部分｣を分けて書くことが多いです
- 今は1枚のスクリプトに全て書いていますが, 通常これらは別ファイルに分けて記述します

## そして第6回へ...
- 第6回では, いよいよMojoliciousを利用したWebサービスの開発に挑戦します!
- ...が, その前に, 第5回まで紹介できなかったPerlの便利な機能と, テストについて紹介していきたいと思います
