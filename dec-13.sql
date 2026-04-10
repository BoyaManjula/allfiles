1.display names of the sailors and the day on which the sailors has reserved boats for all the sailors.
mysql> select sname,day from sailors s,reserves r where s.sid=r.sid;
+---------+------------+
| sname   | day        |
+---------+------------+
| dustin  | 1998-10-10 |
| dustin  | 1998-10-10 |
| dustin  | 1998-10-08 |
| dustin  | 1998-10-07 |
| lubber  | 1998-11-10 |
| lubber  | 1998-11-06 |
| lubber  | 1998-11-12 |
| horatio | 1998-09-05 |
| horatio | 1998-09-08 |
| horatio | 1998-09-08 |
+---------+------------+

2.display names of the sailors and the day on which they reserved boats for the name 103.
mysql> select sname,day from sailors s,reserves r where s.sid=r.sid and bid=103;
+---------+------------+
| sname   | day        |
+---------+------------+
| dustin  | 1998-10-08 |
| lubber  | 1998-11-06 |
| horatio | 1998-09-08 |
+---------+------------+

3.display names of the sailors who have reserved atleast two boats.
mysql> select sname,sid from sailors where sid in(select sid from reserves group
 by sid having count(*)>=2);
+---------+-----+
| sname   | sid |
+---------+-----+
| dustin  |  22 |
| lubber  |  31 |
| horatio |  64 |
+---------+-----+

4.display names of the sailors who have reserved exactly two boats.
mysql> select sname,sid from sailors where sid in(select sid from reserves group by sid having count(*)=2);
+---------+-----+
| sname   | sid |
+---------+-----+
| horatio |  64 |
+---------+-----+


4.names of the sailors who have reserved all the boats.
mysql> select sname,sid from sailors where sid in(select sid from reserves group by sid having count(*)=(select count(*)from boats));
+--------+-----+
| sname  | sid |
+--------+-----+
| dustin |  22 |
+--------+-----+

mysql> select sname from  sailors s where NOT EXISTS((select bid from boats)except(select bid from  reserves where sid=s.sid));
+--------+
| sname  |
+--------+
| dustin |
+--------+
1 row in set (0.00 sec)








mysql> select sname from sailors s,reserves r1,reserves r2 where s.sid=r1.sid and r1.sid=r2.sid and r1.bid!=r2.bid;
+---------+
| sname   |
+---------+
| dustin  |
| dustin  |
| dustin  |
| horatio |
| dustin  |
| dustin  |
| dustin  |
| lubber  |
| lubber  |
| horatio |
| dustin  |
| dustin  |
| dustin  |
| lubber  |
| lubber  |
| dustin  |
| dustin  |
| dustin  |
| lubber  |
| lubber  |
+---------+
