package PerlBeginners {
    sub perllevel {
        my $level = shift;
        if ( $level == 1 ) {
            return "Perl 関係の書籍や資料を何も読んでいない。Perl がプログラミング言語だということは知っているが、それ以外のことは何も知らない。他人の書いたPerl プログラムを実行できるので、プログラムの一部を編集することでプログラムの動作の一部（出力される文字列の内容など）を変更できることを知っている。プログラムのほかの部分に変更を加えてもなぜうまくいかないのか理解していない。この言語に合うメンタルモデルを持っていないので、Perl の構文をCOBOL とC++ のような他の言語のものとは区別できていない。";
        } elsif ( $level == 2 ) {
            return "基本ブロック構造の構文を理解しているが、JavaScript のような言語に似ているという程度の認識にとどまっている。ブロックがある種のスコープ効果を生じさせるという理解はあるものの、レキシカル変数のことは知らないし、use strict や use warnings に出会ったこともない。条件の意味を変更することができ、基本的な算術演算子と論理演算子条件を使用できる。必要とするすべてのことを、他人の書いたプログラムに若干の変更を加えることで達成できると思っている。";
        } elsif ( $level == 3 ) {
            return "";
        } elsif ( $level == 4 ) {
            return "";
        } elsif ( $level == 5 ) {
            return "";
        } elsif ( $level == 6 ) {
            return "";
        } elsif ( $level == 7 ) {
            return "";
        } elsif ( $level == 8 ) {
            return "";
        } elsif ( $level == 9 ) {
            return "";
        } elsif ( $level == 10 ) {
            return "";
        }
    }
}

1;
