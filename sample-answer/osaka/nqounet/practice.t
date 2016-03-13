use Test::More;
use PerlEntrance;

is PerlEntrance::tokyo(), 'Tokyo!';
is PerlEntrance::osaka(), 'Osaka!';

done_testing();
