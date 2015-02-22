use strict;
use warnings;
package YAPC;

sub year {
    return 2015;
}
sub month {
    return 8;
}
sub day {
    return 20;
}
 
# xtetsuji_2
sub is_yet {
    my $date = shift @_;
    return "ERROR!" if $date !~ m{^\d{4}/\d{2}/\d{2}$};
    return $date lt "2015/08/20" ? "true" : "false";
}
1;

__END__
# xtetsuji_1
sub is_yet {
    my $date = shift @_;

    return "ERROR!" if $date !~ m{^\d{4}/\d{2}/\d{2}$};

    #  $date  は YYYY/MM/DD
    if ( $date lt "2015/08/20" ) {
        return "true";
    } else {
        return "false";
    }
}
1;

__END__

# note103
sub is_yet {
    my $foo = shift @_;
    if ($foo =~ m|^(\d{4})/(\d{2})/(\d{2})$|) {
        my $year = $1;
        my $month = $2;
        my $day = $3;
        if ($year < 2015) {
            return 'true';
        } elsif ($year == 2015 && $month < 8) {
            return 'true';
        } elsif ($year == 2015 && $month == 8 && $day < 20) {
            return 'true';
        } else {
            return 'false';
        }
    } else {
        return 'ERROR!';
    }
}
1;

__END__
