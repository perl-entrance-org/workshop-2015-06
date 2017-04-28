package YAPC {
    sub year {
        return 2015;
    }
    sub month {
        return 8;
    }
    sub day {
        return 20;
    }

    sub is_yet {
        my $date = shift; # "2015/02/01"
        # 正規表現
        #my ($year, $month, $day) = $date =~ m{^(\d\d\d\d)/(\d\d)/(\d\d)};

        # split
        my ($year, $month, $day) = split m{/}, $date;
        if ( $year < 2015 ) {
            return 1;
        } elsif ( $year > 2015 ) {
            return 0;
        } elsif ( $month < 8 ) {
            return 1;
        } elsif ( $month > 8 ) {
            return 0;
        } elsif ( $day < 20 ) {
            return 1;
        } else {
            return 0;
        }
    }
}

1;
