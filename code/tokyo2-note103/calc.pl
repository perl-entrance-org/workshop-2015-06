#!/usr/bin/env perl
use strict;
use warnings;
use Data::Dumper;

# 短縮版
sub calc {
    my ($l, $r) = @_;
    if ($l =~ /^\d+$/ && $r =~ /^\d+$/) {
        my $ref = {
            add => $l + $r,
            sub => $l - $r,
            mul => $l * $r,
            div => $l / $r,
            mod => $l % $r,
        };
        return $ref;
    } else {
        return undef;
    }
}
print Dumper calc(4, 17);
print Dumper calc(5, 'Hi!');

__END__

# 2段階版
sub calc {
    my ($l, $r) = @_;
    if ($l =~ /^\d+$/ && $r =~ /^\d+$/) {
        my $add = $l + $r;
        my $sub = $l - $r;
        my $mul = $l * $r;
        my $div = $l / $r;
        my $mod = $l % $r;
        my $ref = {
            add => $add,
            sub => $sub,
            mul => $mul,
            div => $div,
            mod => $mod,
        };
        return $ref;
    } else {
        return undef;
    }
}
print Dumper calc(4, 17);
print Dumper calc(5, 'Hi!');

__END__
