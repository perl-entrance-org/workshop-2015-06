use strict;
use warnings;
use YAPC;
use Test::More;

is YAPC::year(), 2015;
is YAPC::month(), 8;
is YAPC::day(), 20;

is YAPC::is_yet("2015/02/20"), 'true';
is YAPC::is_yet("2015/08/20"), 'false';
is YAPC::is_yet("2015/12/24"), 'false';
done_testing;

