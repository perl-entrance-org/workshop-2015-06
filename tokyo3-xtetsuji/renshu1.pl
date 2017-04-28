#!/usr/bin/perl

use strict;
use warnings;

my @files = qw/foo.pl bar.pm baz.rb qux.py/;

my @bak_files = map_bak(@files);
my @perl_files = grep_pl_and_pm(@files);

print "@perl_files\n";

sub grep_pl_and_pm {
    my @given_files = @_;
    my @answer_files = grep { $_ =~ /\.p[lm]$/ } @given_files;

    # for my $file (@given_files) {
    #     if ( $file =~ /\.p[lm]$/ ) {
    #         push @answer_files, $file;
    #     }
    # }
    return @answer_files;
}

sub map_bak {
    my @given_files = @_;
    my @mapped_files = map { "$_.bak" } @given_files;
    #my @mapped_files = map { $_ . ".bak" } @given_files;
    return @mapped_files;
}

