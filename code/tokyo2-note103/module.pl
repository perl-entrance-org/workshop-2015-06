#!/usr/bin/env perl
use strict;
use warnings;
use Text::Truncate;

# 英語
# via: http://www.ted.com/talks/sheena_iyengar_on_the_art_of_choosing/transcript?language=en
my $text_en = "Today, I'm going to take you around the world in 18 minutes. My base of operations is in the U.S., but let's start at the other end of the map, in Kyoto, Japan, where I was living with a Japanese family while I was doing part of my dissertational research 15 years ago. I knew even then that I would encounter cultural differences and misunderstandings, but they popped up when I least expected it.";
print truncstr($text_en, 50)."\n";

# 日本語
use utf8;
use open OUT => qw/:utf8 :std/;

my $text_ja = "ある処理をひとまとめにして別の場所に置き、必要に応じて呼び出して使うものです";
print truncstr($text_ja, 20)."\n";

