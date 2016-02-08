#!/usr/bin/env perl
use strict;
use warnings;

package Foo {
    sub output {
        my $str = shift @_;
        print "$str\n";
    }
}
#output("hello, world!"); # packageが異なるので使えない
Foo::output("hello, world!"); # => hello, world![改行]
