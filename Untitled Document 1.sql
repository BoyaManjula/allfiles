
mysql> select fname from faculty where  fid in(select fid from teaches group by fid having count(*)=(select count(*) from course)) and age<30;
Empty set (0.00 sec)

mysql> select sid from reserves group by sid having count(sid)=(select count(*) from boats);
+-----+
| sid |
+-----+
|  22 |
+-----+
1 row in set (0.01 sec)

mysql> select sname from  sailors s where NOT EXISTS((select bid from boats)except(select bid from  reserves WHERE sid=s.sid));
+--------+
| sname  |
+--------+
| dustin |
+--------+
1 row in set (0.01 sec)


mysql> select sname from  sailors s where NOT EXISTS((select bid from boats)except(select bid from  reserves where sid=s.sid));
+--------+
| sname  |
+--------+
| dustin |
+--------+
1 row in set (0.00 sec)

mysql> select * from student s where not exists((select course_id from takes where grade='A')except(select course_id from takes where id=s.id));
+------+------+------------------+----------+
| id   | name | dept_name        | tot_cred |
+------+------+------------------+----------+
| 1001 | mike | computer science |       70 |
+------+------+------------------+----------+
1 row in set (0.00 sec)

mysql> select * from student s where not exists((select course_id from takes where grade='B')except(select course_id from takes where id=s.id));
+------+---------+------------------+----------+
| id   | name    | dept_name        | tot_cred |
+------+---------+------------------+----------+
| 1000 | kshitiz | computer science |       80 |
+------+---------+------------------+----------+
1 row in set (0.00 sec)

mysql> select * from student s where not exists((select course_id from takes where grade='B')except(select course_id from takes where id=s.id));
+------+---------+------------------+----------+
| id   | name    | dept_name        | tot_cred |
+------+---------+------------------+----------+
| 1000 | kshitiz | computer science |       80 |
+------+---------+------------------+----------+
1 row in set (0.00 sec)
mysql> select * from student s where not exists((select course_id from takes where grade='A')except(select course_id from takes where id=s.id));l> select * from student s where not exists((select course_id from takes where grade='B')except(select course_id from takes where id=s.i+------+------+------------------+----------+
| id   | name | dept_name        | tot_cred |
+------+------+------------------+----------+
| 1001 | mike | computer science |       70 |
+------+------+------------------+----------+
1 row in set (0.00 sec)

mysql> select course_id from takes where id=1000;
+-----------+
| course_id |
+-----------+
| CS-2201   |
| MA-201    |
+-----------+
2 rows in set (0.00 sec)

mysql> select course_id from takes where id=1001;
+-----------+
| course_id |
+-----------+
| CS-2201   |
| CS-3201   |
+-----------+
2 rows in set (0.00 sec)

mysql> select course_id from takes where id=1001 and grade='A';
+-----------+
| course_id |
+-----------+
| CS-2201   |
| CS-3201   |
+-----------+
2 rows in set (0.00 sec)

mysql> select course_id from takes where id=1000 and grade='A';
+-----------+
| course_id |
+-----------+
| CS-2201   |
+-----------+
1 row in set (0.00 sec)

mysql> select course_id from takes where id=1000 except(select course_id from takes where grade='A');
+-----------+
| course_id |
+-----------+
| MA-201    |
+-----------+
1 row in set (0.00 sec)

mysql> select course_id from takes where id=1001 except(select course_id from takes where grade='A');
Empty set (0.00 sec)

mysql> select name from student s  where not exists((select course_id from takes where id=s.id)except(select course_id from takes where grade='A'));
+---------+
| name    |
+---------+
| mike    |
| virtuos |
+---------+
2 rows in set (0.00 sec)

mysql> select id from takes s  where not exists((select course_id from takes where id=s.id)except(select course_id from takes where grade='A'));
+------+
| id   |
+------+
| 1001 |
| 1001 |
+------+
2 rows in set (0.00 sec)

mysql> select id from takes s  where not exists((select course_id from takes where id=s.id)except(select course_id from takes where grade='A' and id=s.id));
+------+
| id   |
+------+
| 1001 |
| 1001 |
+------+
2 rows in set (0.00 sec)

mysql> select name from student where id in(select id from takes s  where not exists((select course_id from takes where id=s.id)except(selec
t course_id from takes where grade='A' and id=s.id)));
+------+
| name |
+------+
| mike |
+------+
1 row in set (0.00 sec)

mysql> select name from student where id in(select id from takes s  where not exists((select course_id from takes where id=s.id)except(select course_id from takes where grade='b' and id=s.id)));
Empty set (0.00 sec)

mysql> select name from student where id in(select id from takes t where not exists((select course_id from takes where id=t.id)except(select course_id from takes where grade='A' and id=t.id)));
+------+
| name |
+------+
| mike |
+------+
1 row in set (0.00 sec)





