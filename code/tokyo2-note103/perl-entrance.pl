#!/usr/bin/env perl
use strict;
use warnings;

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
    #print tokyo()."\n";
    #print osaka()."\n";
    #print fukuoka()."\n";
}
print PerlEntrance::tokyo()."\n";
print PerlEntrance::osaka()."\n";
print PerlEntrance::fukuoka()."\n";
