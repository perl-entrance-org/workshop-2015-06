use Test::More;
use Test::MockTime;
use YAPC;


is YAPC::year(),  2015, 'year';
is YAPC::month(), 8,    'month';
is YAPC::day(),   20,   'day';

ok YAPC::is_yet('2014/12/31'),  '2014/12/31';
ok YAPC::is_yet('2015/08/19'),  '2015/08/19';
ok !YAPC::is_yet('2015/08/20'), '2015/08/20';
ok !YAPC::is_yet('2015/08/21'), '2015/08/21';
ok !YAPC::is_yet('2016/01/01'), '2016/01/01';

Test::MockTime::set_fixed_time('2014-12-31T00:00:00Z');
ok YAPC::is_yet_now, '2014/12/31';
Test::MockTime::set_fixed_time('2015-08-19T00:00:00Z');
ok YAPC::is_yet_now, '2015/08/19';
Test::MockTime::set_fixed_time('2015-08-20T00:00:00Z');
ok !YAPC::is_yet_now, '2015/08/20';
Test::MockTime::set_fixed_time('2015-08-21T00:00:00Z');
ok !YAPC::is_yet_now, '2015/08/21';
Test::MockTime::set_fixed_time('2016-01-01T00:00:00Z');
ok !YAPC::is_yet_now, '2016/01/01';

done_testing();
