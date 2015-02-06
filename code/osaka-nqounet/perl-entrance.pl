#!/usr/bin/env perl
use utf8;
use v5.12;
use open qw/:encoding(utf-8) :std/;

use DDP {deparse => 1};

package PerlEntrance {

    sub tokyo {
        return 'Tokyo!';
    }

    sub osaka {
        return 'Osaka!';
    }

    sub fukuoka {
        return 'Fukuoka!';
    }
}

say PerlEntrance::tokyo();
say PerlEntrance::osaka();
say PerlEntrance::fukuoka();
