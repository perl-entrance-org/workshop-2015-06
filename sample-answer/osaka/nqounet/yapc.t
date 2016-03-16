use Test::More;
use YAPC;

is YAPC::year(),  2015, 'year';
is YAPC::month(), 8,    'month';
is YAPC::day(),   20,   'day';

ok YAPC::is_yet('2014/12/31'),  '2014/12/31';
ok YAPC::is_yet('2015/08/19'),  '2015/08/19';
ok !YAPC::is_yet('2015/08/20'), '2015/08/20';
ok !YAPC::is_yet('2015/08/21'), '2015/08/21';
ok !YAPC::is_yet('2016/01/01'), '2016/01/01';

done_testing();
