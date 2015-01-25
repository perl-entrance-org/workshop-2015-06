use strict;
use warnings;
use utf8;

my $hash_ref = calc(1, 2);

sub calc {
    my ($left, $right) = @_;
    return {
        add => $left + $right,
        sub => $left - $right,
        mul => $left * $right,
        div => $left / $right,
        mod => $left % $right,
    };
}

use Data::Dumper;
warn Dumper $hash_ref;

use DDP { deparse => 1 };
DDP::p $hash_ref;

