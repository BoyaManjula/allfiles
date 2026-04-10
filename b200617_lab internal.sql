1.mysql> select bid,count(*)from reserves  where bid in(select bid from boats where color='red')group by bid;
+-----+----------+
| bid | count(*) |
+-----+----------+
| 102 |        3 |
| 104 |        2 |
+-----+----------+
2 rows in set (0.01 sec)

2.find the names of sailors who have never reserved a green boat.
mysql> select sname from sailors where sid not in(select sid from reserves where bid in(select bid from boats where color='green'));
+---------+
| sname   |
+---------+
| brutus  |
| andy    |
| rusty   |
| horatio |
| zorba   |
| art     |
| bob     |
+---------+
7 rows in set (0.00 sec)
3.find the boat names which are reserved by both dustin and lubber.
mysql> select bname from boats where bid in(select bid from reserves where sid in(select sid from sailors where sname='lubber')intersect(sel
ect bid from reserves where sid in(select sid from sailors where sname='dustin')));
+-----------+
| bname     |
+-----------+
| interlate |
| clipper   |
| marine    |
+-----------+
3 rows in set (0.00 sec)

4.display the sailors names with highest rating but have reserved only two boats.
mysql> select sname from sailors where rating =(select max(rating)from sailors where sid in(select sid from reserves group by sid having count(*)>=2));
+--------+
| sname  |
+--------+
| lubber |
| andy   |
+--------+
2 rows in set (0.01 sec)

1.display project name,controlling department name and number of employees working under that project;
mysql> select pname,dnum,count(essn) from works_on w,project p where pno=pnumber group by pno;
+-----------------+------+-------------+
| pname           | dnum | count(essn) |
+-----------------+------+-------------+
| ProductX        |    5 |           2 |
| ProductY        |    5 |           3 |
| ProductZ        |    5 |           2 |
| Computarization |    4 |           3 |
| Reorganization  |    1 |           3 |
| Newbenefits     |    4 |           3 |
+-----------------+------+-------------+
6 rows in set (0.01 sec)

2.add an attribute budget to the department table and set the value of that budget to total salaries of employee of that department for department 1;
mysql> alter table department add budget integer;
Query OK, 0 rows affected (0.02 sec)
Records: 0  Duplicates: 0  Warnings: 0
mysql> update department set budget=(select sum(salary) from employee) where dnumber=1;
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

3.display names of employees in department 5 who work more than 10 hours on productx on project.
mysql> select fname from employee e,works_on w,project p where e.ssn=w.essn and w.pno=p.pnumber and dnum=5 and pname='productx' and hours>10;
+-------+
| fname |
+-------+
| John  |
| Joyce |
+-------+
2 rows in set (0.00 sec)
4.display the ssn,address of the employee who work in the same department as the employee who earn highest among all.
4.mysql> select ssn,address from employee where dno in(select dno from employee where salary in(select max(salary) from employee));
+-----------+-----------------------+
| ssn       | address               |
+-----------+-----------------------+
| 888665555 | 450 Stone, Houston,TX |
+-----------+-----------------------+
1 row in set (0.00 sec)


