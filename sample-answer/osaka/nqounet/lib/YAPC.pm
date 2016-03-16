package YAPC;
use utf8;
use strict;
use warnings;

sub year {2015}

sub month {8}

sub day {20}


sub is_yet {
    my $date = shift;

    my ($year, $month, $day) = split '/', $date;

    # 年を確認
    if ($year > year()) {
        return;
    }
    if ($year < year()) {
        return 1;
    }

    # 月を確認
    if ($month > month()) {
        return;
    }
    if ($month < month()) {
        return 1;
    }

    # 日を確認
    if ($day < day()) {
        return 1;
    }
    return;
}

1;
