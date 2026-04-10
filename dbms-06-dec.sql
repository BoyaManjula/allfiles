1.display names and rating of the youngest sailors.

mysql> select sname,rating from sailors where age=(select  min(age) from sailors);
+-------+--------+
| sname | rating |
+-------+--------+
| zorba |     10 |
+-------+--------+


2.display names of the sailors who have rating better than some sailor called horatio.

mysql> select sname from sailors where rating>any(select rating from sailors where sname='horatio');
+---------+
| sname   |
+---------+
| lubber  |
| andy    |
| rusty   |
| zorba   |
| horatio |
+---------+


3.display names of the sailors who have rating better than that of all sailor name is horatio.

mysql> select sname from sailors where rating>all(select rating from sailors where sname='horatio');
+-------+
| sname |
+-------+
| rusty |
| zorba |
+-------+


4.display names of the sailors who is older than oldest sailor with rating 10.

mysql> select sname from sailors where age>(select max(age) from sailors where rating=10);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
| bob     |
+---------+


5.display sid and count of the boats reserved by each sailor.

mysql> select sid, count(bid)from reserves group by sid;
+-----+------------+
| sid | count(bid) |
+-----+------------+
|  22 |          4 |
|  31 |          3 |
|  64 |          2 |
|  74 |          1 |
+-----+------------+


6.display color  and count of the boats for each color.

mysql> select color, count(bid)from boats group by color;
+-------+------------+
| color | count(bid) |
+-------+------------+
| blue  |          1 |
| red   |          2 |
| green |          1 |
+-------+------------+


7.display ids of the sailors who have reserved boat number 103.

mysql> select sid from reserves where bid=103;
+-----+
| sid |
+-----+
|  22 |
|  31 |
|  74 |
+-----+


8.display names of the sailors who have reserved boat number 103.

mysql> select sname from sailors where sid in(select sid from reserves where bid=103);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
+---------+


9.display ids of the sailors who have reserved red boat.

mysql> select sid from reserves where bid in(select bid from boats where color='red');
+-----+
| sid |
+-----+
|  22 |
|  31 |
|  64 |
|  22 |
|  31 |
+-----+
//for the above question,for distinction
mysql> select distinct(sid) from reserves where bid in(select bid from boats where color='red');
+-----+
| sid |
+-----+
|  22 |
|  31 |
|  64 |
+-----+


10.display names of the sailors who have reserved red boat.

mysql> select sname from sailors where sid in(select sid from reserves where bid in(select bid from boats where color='red'));
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
+---------+


11.display names of the sailors who have reserved atleast one boat.

mysql> select sname from sailors where sid in(select sid from reserves);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
| horatio |
+---------+
mysql> select sname from sailors s where exists (select * from reserves r where r.sid=s.sid);
+---------+
| sname   |
+---------+
| dustin  |
| lubber  |
| horatio |
| horatio |
+---------+


12.display names of the sailors who have not reserved any boat.

mysql> select sname from sailors where sid not in(select sid from reserves);
+--------+
| sname  |
+--------+
| brutus |
| andy   |
| rusty  |
| zorba  |
| art    |
| bob    |
+--------+


13.display names of the sailors with age below 50 and reserved green color boat.

mysql> select sname from sailors where age<50 and sid in(select sid from reserves where bid in(select bid from boats where color='green'));
+---------+
| sname   |
+---------+
| dustin  |
| horatio |
+---------+


14.display color of the boats reserved by lubber.

mysql> select color from boats where bid in(select bid from reserves where sid in(select sid from sailors where sname='lubber'));
+-------+
| color |
+-------+
| red   |
| green |
| red   |
+-------+


15.display ids of the boats which are not reserved by lubber.

mysql> select bid from boats where bid not in(select bid from reserves where sid in(select sid from sailors where sname='lubber'));
+-----+
| bid |
+-----+
| 101 |
+-----+


16.display names of the sailors who have reserved either red or green color boats.

mysql> select sname,sid from sailors where sid in(select sid from reserves where bid in(select bid from boats where color='red' or color='green));
+---------+-----+
| sname   | sid |
+---------+-----+
| dustin  |  22 |
| lubber  |  31 |
| horatio |  64 |
| horatio |  74 |
+---------+-----+
mysql> select sname,sid from sailors where sid in(select sid from reserves where bid in(select bid from boats where color='red')union all(select sid from reserves where bid in(select bid from boats where color='green')));
+---------+-----+
| sname   | sid |
+---------+-----+
| dustin  |  22 |
| lubber  |  31 |
| horatio |  64 |
| horatio |  74 |
+---------+-----+


17.display names of the sailors who have reserved red and green color boats.
mysql> select sname,sid from sailors where sid in(select sid from reserves where bid in(select bid from boats where color='red')intersect(select sid from reserves where bid in(select bid from boats where color='green')));
+--------+-----+
| sname  | sid |
+--------+-----+
| dustin |  22 |
| lubber |  31 |
+--------+-----+
mysql> select sname,sid from sailors where sid in(select sid from reserves where bid in(select bid from boats where color='red')) and sid in(select sid from reserves where bid in(select bid from boats where color='green'));
+--------+-----+
| sname  | sid |
+--------+-----+
| dustin |  22 |
| lubber |  31 |
+--------+-----+


18.display names of the sailors who have reserved red but not green color boats.

mysql> select sname,sid from sailors where sid in(select sid from reserves where bid in(select bid from boats where color='red')) and sid not in(select sid from reserves where bid in(select bid from boats where color='green'));
+---------+-----+
| sname   | sid |
+---------+-----+
| horatio |  64 |
+---------+-----+

19.display name and age of the oldest person without using max aggrigate.

mysql> select sname,age from sailors where age =(select age from sailors order b
y age desc limit 1);
+-------+------+
| sname | age  |
+-------+------+
| bob   | 63.5 |
+-------+------+







