mysql> select*from student;
+---------+-----------+-------+-------+
| ID      | NAME      | MARKS | GRADE |
+---------+-----------+-------+-------+
| b200617 | manjula   |    97 | X     |
| b200111 | mahi      |    80 | A     |
| b200017 | radha     |    50 | B     |
| b200123 | thimmappa |    45 | C     |
| b200231 | gayathri  |    23 | R     |
+---------+-----------+-------+-------+

1.display names of the students who got 'A' grade.
mysql> select name from student where grade='a';
+------+
| name |
+------+
| mahi |
+------+

2.display names of the students.
mysql> select name from student ;
+-----------+
| name      |
+-----------+
| manjula   |
| mahi      |
| radha     |
| thimmappa |
| gayathri  |
+-----------+

3.display ids and grades of all the students.
mysql> select id,grade from student ;
+---------+-------+
| id      | grade |
+---------+-------+
| b200617 | X     |
| b200111 | A     |
| b200017 | B     |
| b200123 | C     |
| b200231 | R     |
+---------+-------+

4.display ids and names of all the students who got either 'A' grade or whose name is manju.
mysql> select id,name from student where grade='a' or name='manju';
+---------+------+
| id      | name |
+---------+------+
| b200111 | mahi |
+---------+------+

5.display details of the student whose name consist of manju.
mysql> select * from student where  name='manju';
Empty set (0.00 sec)

mysql> select * from student where  name like'%manju%';
+---------+---------+-------+-------+
| ID      | NAME    | MARKS | GRADE |
+---------+---------+-------+-------+
| b200617 | manjula |    97 | X     |
+---------+---------+-------+-------+

6.display details of the student where name starting with 'S' and having with 5 letters.
mysql> select * from student where  name like's - - - -';
Empty set (0.00 sec)

7.display names of the students whose marks are between 50 and 100.
mysql> select name from student where marks>50 and marks<100;
+---------+
| name    |
+---------+
| manjula |
| mahi    |
+---------+

8.display ids and names with marks wise in increasing order.
mysql> select id,name from student order by marks asc;
+---------+-----------+
| id      | name      |
+---------+-----------+
| b200231 | gayathri  |
| b200123 | thimmappa |
| b200017 | radha     |
| b200111 | mahi      |
| b200617 | manjula   |
+---------+-----------+

9.display top marks of the students.
mysql> select max(marks)from student;
+------------+
| max(marks) |
+------------+
|         97 |
+------------+

10.display name of student who got highest marks. 
mysql> select name from student where marks=(select max(marks)from student);
+---------+
| name    |
+---------+
| manjula |
+---------+

11.display details of top 3 students based upon marks.
mysql> select * from student order by marks desc limit 3;
+---------+---------+-------+-------+
| ID      | NAME    | MARKS | GRADE |
+---------+---------+-------+-------+
| b200617 | manjula |    97 | X     |
| b200111 | mahi    |    80 | A     |
| b200017 | radha   |    50 | B     |
+---------+---------+-------+-------+

12.display no.of students.
mysql> select count(id)from student;
+-----------+
| count(id) |
+-----------+
|         5 |
+-----------+

13.display count of students who got remedials.
mysql> select count(id)from student where grade='r';
+-----------+
| count(id) |
+-----------+
|         1 |
+-----------+

14.add a GENDER attribute in student table.
mysql> alter table student add GENDER char;
Query OK, 0 rows affected (0.01 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> select *from student;
+---------+-----------+-------+-------+--------+
| ID      | NAME      | MARKS | GRADE | GENDER |
+---------+-----------+-------+-------+--------+
| b200617 | manjula   |    97 | X     | NULL   |
| b200111 | mahi      |    80 | A     | NULL   |
| b200017 | radha     |    50 | B     | NULL   |
| b200123 | thimmappa |    45 | C     | NULL   |
| b200231 | gayathri  |    23 | R     | NULL   |
+---------+-----------+-------+-------+--------+



mysql> update student set gender='female';
ERROR 1406 (22001): Data too long for column 'GENDER' at row 1

mysql> update student set gender='F';
Query OK, 5 rows affected (0.01 sec)
Rows matched: 5  Changed: 5  Warnings: 0

mysql> update student set gender='M'where id='b200123';
Query OK, 1 row affected (0.01 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select *from student;
+---------+-----------+-------+-------+--------+
| ID      | NAME      | MARKS | GRADE | GENDER |
+---------+-----------+-------+-------+--------+
| b200617 | manjula   |    97 | X     | F      |
| b200111 | mahi      |    80 | A     | F      |
| b200017 | radha     |    50 | B     | F      |
| b200123 | thimmappa |    45 | C     | M      |
| b200231 | gayathri  |    23 | R     | F      |
+---------+-----------+-------+-------+--------+










