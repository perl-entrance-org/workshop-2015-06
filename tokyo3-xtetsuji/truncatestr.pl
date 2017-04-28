#!/usr/bin/perl

use strict;
use warnings;

use Text::Truncate;

my $string = "I am Tetsuji OGATA. I was born in Hokkaido.";

print truncstr($string, 15);

