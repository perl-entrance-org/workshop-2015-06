#!/usr/bin/env perl
use utf8;
use strict;
use warnings;
use feature 'say';
use open qw/:encoding(utf8) :std/;
use Data::Printer {deparse => 1};
use Data::Dumper;

package PerlEntrance {
    sub tokyo {
        return 'Tokyo!';
    }
    sub osaka {
        return 'Osaka!';
    }
}

package PerlNabe {
    sub tokyo {
        return '東京!';
    }
    sub osaka {
        return '大阪!';
    }
}

say PerlEntrance::tokyo();
say PerlEntrance::osaka();
say PerlNabe::tokyo();
say PerlNabe::osaka();
