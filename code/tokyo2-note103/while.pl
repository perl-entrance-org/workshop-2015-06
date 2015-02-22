#!/usr/bin/env perl
use strict;
use warnings;

# while + subroutine
print '>>> ';
while (my $foo = <STDIN>) {
    print calc_string($foo)."\n";
    print '>>> ';
}

sub calc_string {
    my $str = shift @_;
    if ($str =~ /^(\d+) ([\+\-\*\/\%]) (\d+)$/) {
        my $l = $1;
        my $o = $2;
        my $r = $3;
        if ($o eq '+') { return $l + $r;
        } elsif ($o eq '-') {
            return $l - $r;
        } elsif ($o eq '*') {
            return $l * $r;
        } elsif ($o eq '/') {
            if ($r == 0) {
                return 'Illegal division by zero!';
            } else {
                return $l / $r;
            }
        } elsif ($o eq '%') {
            return $l % $r;
        }
    } else {
        return 'ERROR!';
    }
}
__END__

# only subroutine
sub calc_string {
    my $str = shift @_;
    if ($str =~ /^(\d+) ([\+\-\*\/\%]) (\d+)$/) {
        my $l = $1;
        my $o = $2;
        my $r = $3;
        if ($o eq '+') { return $l + $r;
        } elsif ($o eq '-') {
            return $l - $r;
        } elsif ($o eq '*') {
            return $l * $r;
        } elsif ($o eq '/') {
            if ($r == 0) {
                return 'Illegal division by zero!';
            } else {
                return $l / $r;
            }
        } elsif ($o eq '%') {
            return $l % $r;
        }
    } else {
        return 'ERROR!';
    }
}

print calc_string('5 * 19')."\n";
print calc_string('perl % 19')."\n";
__END__

