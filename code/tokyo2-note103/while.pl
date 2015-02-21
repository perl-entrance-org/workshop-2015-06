#!/usr/bin/env perl
use strict;
use warnings;

print '>>>'."\n";
sub calc_string {
    my $str = shift @_;
    my $answer;
    if ($str =~ /^(\d+) ([\+\-\*\/\%]) (\d+)$/) {
        my $r = $1;
        my $o = $2;
        my $l = $3;
        if ($o eq '+') {
            $answer = $r + $l;
        } elsif ($o eq '-') {
            $answer = $r - $l;
        } elsif ($o eq '*') {
            $answer = $r * $l;
        } elsif ($o eq '/') {
            $answer = $r / $l;
        } elsif ($o eq '%') {
            $answer = $r % $l;
        }
    } else {
        return 'ERROR!';
    }
}
while (my $foo = <STDIN>) {
    print calc_string($foo)."\n";
}
__END__
    print calc_string('5 * 19')."\n";
    print calc_string('perl % 19')."\n";

