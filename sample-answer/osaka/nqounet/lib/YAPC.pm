package YAPC;
use utf8;
use strict;
use warnings;
use Time::Piece;


sub year {2015}

sub month {8}

sub day {20}


sub is_yet {
    my $date = shift;

    my $target_time = Time::Piece->strptime($date, '%Y/%m/%d');

    my $yapc_date = sprintf '%04d/%02d/%02d', year(), month(), day();
    my $yapc_time = Time::Piece->strptime($yapc_date, '%Y/%m/%d');

    return $target_time < $yapc_time;
}

sub is_yet_now {
    my $now = localtime;
    is_yet($now->strftime('%Y/%m/%d'));
}

1;
