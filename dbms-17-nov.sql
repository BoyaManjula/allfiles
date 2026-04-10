mysql> select*from sailors;
+------+---------+--------+------+
| sid  | sname   | rating | age  |
+------+---------+--------+------+
|   22 | dustin  |      7 |   45 |
|   29 | brutus  |      1 |   33 |
|   31 | lubber  |      8 | 55.5 |
|   32 | andy    |      8 | 25.5 |
|   58 | rusty   |     10 |   35 |
|   64 | horatio |      7 |   35 |
|   71 | zorba   |     10 |   16 |
|   74 | horatio |      9 |   40 |
|   85 | art     |      3 | 25.5 |
|   95 | bob     |      3 | 63.5 |
+------+---------+--------+------+
mysql> select*from reserves;
+------+------+------------+
| sid  | bid  | day        |
+------+------+------------+
|   22 |  101 | 1998-10-10 |
|   22 |  102 | 1998-10-10 |
|   22 |  103 | 1998-10-08 |
|   22 |  104 | 1998-10-07 |
|   31 |  102 | 1998-11-10 |
|   31 |  103 | 1998-11-06 |
|   31 |  104 | 1998-11-12 |
|   64 |  101 | 1998-09-05 |
|   64 |  102 | 1998-09-08 |
|   74 |  103 | 1998-09-08 |
+------+------+------------+
mysql> select*from boats;
+------+-----------+-------+
| bid  | bname     | color |
+------+-----------+-------+
|  101 | interlate | blue  |
|  102 | interlate | red   |
|  103 | clipper   | green |
|  104 | marine    | red   |
+------+-----------+-------+

1.display names of all the sailors.
mysql> select sname from sailors;
+---------+
| sname   |
+---------+
| dustin  |
| brutus  |
| lubber  |
| andy    |
| rusty   |
| horatio |
| zorba   |
| horatio |
| art     |
| bob     |
+---------+

2.display count of the no.of all the sailors.
mysql> select count(sid)from reserves;
+------------+
| count(sid) |
+------------+
|         10 |
+------------+

3.display colors of the boats.
mysql> select color from boats;
+-------+
| color |
+-------+
| blue  |
| red   |
| green |
| red   |
+-------+

4.display color of the boat named interlate.
mysql> select color from boats where bname='interlate';
+-------+
| color |
+-------+
| blue  |
| red   |
+-------+

5.display rating of the sailors whose age above 40.
mysql> select rating from sailors where age>40;
+--------+
| rating |
+--------+
|      7 |
|      8 |
|      3 |
+--------+

6.display ids &names of sailors whose rating is 8.
mysql> select sid,sname from sailors where rating=8;
+------+--------+
| sid  | sname  |
+------+--------+
|   31 | lubber |
|   32 | andy   |
+------+--------+

7.display details of the sailors by their rating wise(low to high).
mysql> select*from sailors order by rating asc;
+------+---------+--------+------+
| sid  | sname   | rating | age  |
+------+---------+--------+------+
|   29 | brutus  |      1 |   33 |
|   85 | art     |      3 | 25.5 |
|   95 | bob     |      3 | 63.5 |
|   22 | dustin  |      7 |   45 |
|   64 | horatio |      7 |   35 |
|   31 | lubber  |      8 | 55.5 |
|   32 | andy    |      8 | 25.5 |
|   74 | horatio |      9 |   40 |
|   58 | rusty   |     10 |   35 |
|   71 | zorba   |     10 |   16 |
+------+---------+--------+------+

8.display names of the sailors whose has high rating.
mysql> select sname from sailors where rating=(select max(rating)from sailors);
+-------+
| sname |
+-------+
| rusty |
| zorba |
+-------+

9.display boat ids reserved by sailors with id 22.
mysql> select bid from reserves where sid=22;
+------+
| bid  |
+------+
|  101 |
|  102 |
|  103 |
|  104 |
+------+

10.display name of the oldest sailor.
mysql> select sname from sailors where age=(select max(age)from sailors);
+-------+
| sname |
+-------+
| bob   |
+-------+

11.display boat ids reserved by dustin.
mysql> select bid from reserves where sid=(select sid from sailors where sname='dustin');
+------+
| bid  |
+------+
|  101 |
|  102 |
|  103 |
|  104 |
+------+

12.display no.of boats reserved by 22.
mysql> select count(bid) from reserves where sid=22;
+------------+
| count(bid) |
+------------+
|          4 |
+------------+

13.display colors of boats reserved by 31.
mysql> select color from boats where bid in(select bid from reserves where sid=31);
+-------+
| color |
+-------+
| red   |
| green |
| red   |
+-------+






