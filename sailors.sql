mysql> select sname from sailors where sid in(select sid from reserves group by sid having count(*)>=3);
+--------+
| sname  |
+--------+
| dustin |
| lubber |
+--------+

mysql> select rating,min(age) from sailors group by rating;
+--------+----------+
| rating | min(age) |
+--------+----------+
|      7 |       35 |
|      1 |       33 |      //////////doubt
|      8 |     25.5 |
|     10 |       16 |
|      9 |       40 |
|      3 |     25.5 |
+--------+----------+
6 rows in set (0.00 sec)


mysql> select sname,r.bid from sailors s,reserves r,boats b where s.sid=r.sid and r.bid=b.bid and bname='interlate';
+---------+-----+
| sname   | bid |
+---------+-----+
| dustin  | 101 |
| horatio | 101 |
| dustin  | 102 |
| lubber  | 102 |
| horatio | 102 |
+---------+-----+


mysql> select distinct( sname),sid from sailors where sid in(select sid from reserves where bid not in(select bid from boats where color='blue'));
+---------+-----+
| sname   | sid |
+---------+-----+                  ////doubt
| dustin  |  22 |
| lubber  |  31 |
| horatio |  64 |
| horatio |  74 |
+---------+-----+
mysql> select sname,sid from sailors where sid in(select distinct(sid) from reserves where bid not in(select bid from boats where color!='blue'));
+---------+-----+
| sname   | sid |
+---------+-----+
| dustin  |  22 |
| horatio |  64 |
+---------+-----+

mysql> select sname from sailors where sid in(select sid from reserves where bid=103)and sid in(select sid from reserves where bid=104);
+--------+
| sname  |
+--------+
| dustin |
| lubber |
+--------+
mysql> select sname,age from sailors where age=(select max(age) from sailors);
+-------+------+
| sname | age  |
+-------+------+
| bob   | 63.5 |
+-------+------+
mysql> select sname,count(sname) from sailors group by sname;
+---------+--------------+
| sname   | count(sname) |
+---------+--------------+
| dustin  |            1 |
| brutus  |            1 |
| lubber  |            1 |
| andy    |            1 |
| rusty   |            1 |
| horatio |            2 |
| zorba   |            1 |
| art     |            1 |
| bob     |            1 |
+---------+--------------+

mysql> select color from boats b,reserves r,sailors s where b.bid=r.bid and r.sid=s.sid and sname='dustin';
+-------+
| color |
+-------+
| blue  |
| red   |
| green |
| red   |
+-------+
mysql> select sname,sid from sailors where rating=10 or sid in(select sid from reserves where bid=104);
+--------+-----+
| sname  | sid |
+--------+-----+
| dustin |  22 |
| lubber |  31 |
| rusty  |  58 |
| zorba  |  71 |
+--------+-----+


mysql> select sname,sid from sailors where sid in(select sid from reserves where
 sid not in (select sid from reserves where bid in(select bid from boats where color='blue')));
+---------+-----+
| sname   | sid |
+---------+-----+
| lubber  |  31 |
| horatio |  74 |
+---------+-----+

