mysql> alter table salesperson add constraint primary key(sid);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table sales add constraint primary key(sid,pid,day);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table products add constraint primary key(pid);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table sales add constraint foreign key(sid)references salesperson(sid);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> alter table sales add constraint foreign key(pid)references products(pid);
Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0

1.Count the no. of each product sales by salesperson with name “ramana”.

mysql> select pid,count(*)from sales where sid in(select sid from salesperson where sname='ramana')group by pid;
+-----+----------+
| pid | count(*) |
+-----+----------+
| 111 |        2 |
| 121 |        1 |
+-----+----------+
2 rows in set (0.00 sec)


2.Find the no. of products which are not listed in sales relation.

mysql> select pid,count(pid)from products where pid not in(select pid
 from sales) group by pid;
+-----+------------+
| pid | count(pid) |
+-----+------------+
| 101 |          1 |
+-----+------------+
1 row in set (0.00 sec)



3.Find the name and age of the salespersons who have done sales of all different products.
mysql> select sname,age from salesperson where sid in(select pid from sales group by pid having count(*)=(select count(*) from products));
Empty set (0.00 sec)

mysql> select sname,age from salesperson s where not exists((select pid from products)except(select pid from sales where sid=s.sid));
Empty set (0.01 sec)

4.Display  the product details which are better in rating than product named “yippie” in category “noodles.
mysql> select * from products where rating>(select rating from products where pname="yippie") and category="noodles";
+-----+--------+--------+----------+
| pid | pname  | rating | category |
+-----+--------+--------+----------+
| 111 | maggie |      8 | noodles  |
+-----+--------+--------+----------+
1 row in set (0.00 sec)

5.Find the name of salesperson who have done sales of both products “Maggie” and "good day".
mysql> select sname from salesperson where sid in(select sid from sales where pid in(select pid from products where pname="maggie")intersect(select sid from sales where pid in(select pid from products where pname="good day")));
+--------+
| sname  |            //doubt
+--------+
| ramana |
+--------+
1 row in set (0.00 sec)

mysql> select sname from sales s,salesperson sp,products p where sp.sid=s.sid and s.pid=p.pid and pname='maggie' and pname='good day';
Empty set (0.01 sec)


mysql> alter table player add constraint primary key(pname);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table format add constraint primary key(fname);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table rankings add constraint primary key(fname,pname);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table rankings add constraint foreign key(pname)references player(pname);
Query OK, 6 rows affected (0.02 sec)
Records: 6  Duplicates: 0  Warnings: 0

mysql> alter table rankings add constraint foreign key(fname)references format(fname);
Query OK, 6 rows affected (0.03 sec)
Records: 6  Duplicates: 0  Warnings: 0

1.Find the player name who are listed for all formats in Rankings table.
mysql> select pname from player where pname in(select pname from rankings group by pname having count(*)=(select count(*)from format));
+--------+
| pname  |
+--------+
| ashwin |
+--------+
1 row in set (0.00 sec)

2.Display  the name and category of player who has highest rank for each format.

mysql> select pname ,category from player where pname in(select pname from rankings where ranks=(select max(ranks)from rankings)group by pname);
+--------+----------+
| pname  | category |
+--------+----------+
| ashwin | bowler   |
+--------+----------+
1 row in set (0.01 sec)

3.Find the player names who are listed in rankings table only for “ODI” format but NOT for “Test” format.
mysql> select distinct(pname) from rankings where pname in(select pname from rankings where fname="odi") and pname not in(select pname from
rankings where fname="test");
+------------+
| pname      |
+------------+
| Devilliers |
| kohli      |
+------------+
2 rows in set (0.00 sec)

4.Add an attribute age to players table and put age of player named “kohli” to 27.
mysql> alter table player add(age integer);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> update player set age=27 where pname="kohli";
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

5.Count the no. of players in each country.
mysql> select country,count(country)from player group by country;
+---------------+----------------+
| country       | count(country) |
+---------------+----------------+
| india         |              2 |
| sounth Africa |              1 |
+---------------+----------------+
2 rows in set (0.00 sec)



mysql> alter table faculty add constraint primary key(fid);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table teaches add constraint primary key(fid,cid);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table course add constraint primary key(cid);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table teaches add constraint foreign key(fid) references faculty(fid);
Query OK, 5 rows affected (0.03 sec)
Records: 5  Duplicates: 0  Warnings: 0

mysql> alter table teaches add constraint foreign key(cid) references course(cid);
Query OK, 5 rows affected (0.04 sec)
Records: 5  Duplicates: 0  Warnings: 0

1.Find faculty names whose qualification is "M.Tech" and teaches at least two different courses.
 
mysql> select fname from faculty where qualification='m.tech' and fid
 in(select fid from teaches group by fid having count(fid)>=2);
+---------+
| fname   |
+---------+
| kavitha |
+---------+
1 row in set (0.00 sec)
 

2.Find faculty names whose age is below 30 and teaches all the courses.

mysql> select fname from faculty where age<30 and fid in (select fid from teaches group by fid having count(fid)=(select count(*) from course));
Empty set (0.00 sec)

mysql> select fname from faculty f where age>30 and not exists((select cid from course)except(select cid from teaches where fid=f.fid));
Empty set (0.00 sec)

3.Find course name and textbooks of the courses taught by either “kavitha” or “venu”.
mysql> select cname,textbook from course where cid in(select cid from teaches where fid in(select fid from faculty where fname="kavitha" or fname="venu"));
+-------+-------------------------+
| cname | textbook                |
+-------+-------------------------+
| DBMS  | Database concepts       |
| COA   | Computer architecture   |
| JAVA  | Complete reference JAVA |
+-------+-------------------------+
3 rows in set (0.01 sec)

mysql> select cname,textbook from course c,teaches t,faculty f where c.cid=t.cid and f.fid=t.fid and (fname='kavitha' or fname='venu');
+-------+-------------------------+
| cname | textbook                |
+-------+-------------------------+
| DBMS  | Database concepts       |
| COA   | Computer architecture   |
| JAVA  | Complete reference JAVA |
+-------+-------------------------+
3 rows in set (0.00 sec)

4.Count the no. of courses for each “year-sem”.
mysql> select year_sem,count(cid)from teaches group by year_sem;
+----------+------------+
| year_sem | count(cid) |
+----------+------------+
| 2-1      |          1 |
| 3-1      |          3 |
| 4-1      |          1 |
+----------+------------+
3 rows in set (0.00 sec)

5.Alter the table courses to add a new attribute “credits” and update the credits to 4 for the courses taught by faculty with fid 10 .
mysql> alter table course add( credits integer);
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select*from course;
+-------+-------+-------------------------+---------+
| cid   | cname | textbook                | credits |
+-------+-------+-------------------------+---------+
| CS201 | DBMS  | Database concepts       |    NULL |
| CS301 | COA   | Computer architecture   |    NULL |
| CS302 | FLAT  | Formal languages        |    NULL |
| CS401 | JAVA  | Complete reference JAVA |    NULL |
+-------+-------+-------------------------+---------+
4 rows in set (0.00 sec)

mysql> update course  set credits=4 where cid in(select cid from teaches where fid=10);
Query OK, 2 rows affected (0.01 sec)
Rows matched: 2  Changed: 2  Warnings: 0

mysql> select*from course;
+-------+-------+-------------------------+---------+
| cid   | cname | textbook                | credits |
+-------+-------+-------------------------+---------+
| CS201 | DBMS  | Database concepts       |       4 |
| CS301 | COA   | Computer architecture   |       4 |
| CS302 | FLAT  | Formal languages        |    NULL |
| CS401 | JAVA  | Complete reference JAVA |    NULL |
+-------+-------+-------------------------+---------+
4 rows in set (0.00 sec)









