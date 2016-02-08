use strict;
use warnings;
use utf8;

my @files = qw/foo.pl bar.pm baz.rb qux.py /;
# 上記の配列を引数にして、拡張子の後ろに .bak を付け足す map_bak 関数と、末尾(拡張子)が pl、pm であるものを抜き出す grep_pl_and_pm を作成してください

my @backups = map_bak(@files);
my @pl_and_pm = grep_pl_and_pm(@files);

use Data::Dumper;
warn Dumper \@backups;
warn Dumper \@pl_and_pm;

sub map_bak {
    my (@files) = @_;
    return map { $_ . '.bak' } @files;
}

sub grep_pl_and_pm {
    my (@files) = @_;
    return grep { $_ =~ /\.p[lm]$/ } @files;
}

