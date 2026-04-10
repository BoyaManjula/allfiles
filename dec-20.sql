

mysql> select sid from reserves where bid in(select bid from boats where bname='interlate');
+-----+
| sid |
+-----+
|  22 |
|  64 |
|  22 |
|  31 |
|  64 |
+-----+
5 rows in set (0.02 sec)

mysql> select distinct( sid) from reserves where bid in(select bid from boats wh
ere bname='interlate');
+-----+
| sid |
+-----+
|  22 |
|  64 |
|  31 |
+-----+
3 rows in set (0.00 sec)

mysql> select sname from sailors where sid in(select sid from reserves where bid=103);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
+---------+
3 rows in set (0.01 sec)

mysql> select sname from sailors s where exists (select*from reserves r where r.bid=103 and r.sid=s.sid);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
+---------+
3 rows in set (0.00 sec)









mysql> select sname from sailors s where exists (select * from reserves r where r.sid=s.sid);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
| horatio |
+---------+
4 rows in set (0.00 sec)

mysql> select sid from reserves group by sid having count(*)=(select count(*)from boats);
+-----+
| sid |
+-----+
|  22 |
+-----+
1 row in set (0.00 sec)

mysql> select sid from reserves group by sid having count(*)=(select count(*)from boats where bname='interlate');
+-----+
| sid |
+-----+
|  64 |
+-----+

