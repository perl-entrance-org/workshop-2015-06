use strict;
use warnings;

use Text::Truncate;

my $long_string = 'Perl Entrance! Perl Entrance!';

print truncstr($long_string, 8);

