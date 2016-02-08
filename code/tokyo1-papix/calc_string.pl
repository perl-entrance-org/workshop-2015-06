use strict;
use warnings;
use utf8;

while (my $input = <STDIN>) {
    chomp $input;
    my $ret = calc_string($input);

    if (defined $ret) {
        print "answer: $ret\n";
    } else {
        print "...\n";
    }
}

sub calc_string {
    my ($input) = @_;

    if ($input =~ /^(-?\d+)\s+([\+\-\*\/\%])\s+(-?\d+)$/) {
        my ($left, $calc, $right) = ($1, $2, $3);
        if ($calc eq '+') { return $left + $right };
        if ($calc eq '-') { return $left - $right };
        if ($calc eq '*') { return $left * $right };
        if ($calc eq '/') {
            if ($right == 0) { return undef }
            return $left / $right
        };
        if ($calc eq '%') { return $left % $right };
    }
    return undef;
}
