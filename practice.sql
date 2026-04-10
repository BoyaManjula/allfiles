Q.write query to find the names of sailors who reserves all non blue boats.
mysql> (select distinct sid from reserves)except(select sid from reserves where bid in(select bid from boats where color='blue')) ;
+-----+
| sid |
+-----+
|  31 |
|  74 |
+-----+
2 rows in set (0.00 sec)

Q.display second highest rating from sailors;
mysql> select max(rating) from sailors where rating in((select rating from sailors)except(select
max(rating) from sailors));
+-------------+
| max(rating) |
+-------------+
|           9 |
+-------------+
1 row in set (0.01 sec)

mysql> (select sid from reserves r,boats b where r.bid=b.bid and color='red')except(select sid from reserves r,boats b where r.bid=b.bid and
 color='green');
+-----+
| sid |
+-----+
|  64 |
+-----+
1 row in set (0.00 sec)


