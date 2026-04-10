mysql> create database university;
Query OK, 1 row affected (0.00 sec)

mysql> use university
Database changed
mysql> create table instructor(id integer primary key,name varchar(20),dept_name varchar(100),salary integer);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into instructor values(22222,'einstein','physics',95000);
Query OK, 1 row affected (0.00 sec)

mysql> insert into instructor values(33333,'korth','computer science',75000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into instructor values(45454,'mozart','music',60000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into instructor values(55555,'navathe','computer science',100000);
Query OK, 1 row affected (0.01 sec)
mysql> select*from instructor;
+-------+----------+------------------+--------+
| id    | name     | dept_name        | salary |
+-------+----------+------------------+--------+
| 22222 | einstein | physics          |  95000 |
| 33333 | korth    | computer science |  75000 |
| 45454 | mozart   | music            |  60000 |
| 55555 | navathe  | computer science | 100000 |
+-------+----------+------------------+--------+
4 rows in set (0.00 sec)

mysql> create table department(dept_name varchar(50) primary key,buil
ding varchar(10),budget integer);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into department values('physics','AB-1',100000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into department values('computer science','AB-2',150000);
Query OK, 1 row affected (0.01 sec)

mysql> insert into department values('maths','AB-3',80000);
Query OK, 1 row affected (0.01 sec)

mysql> select*from department;
+------------------+----------+--------+
| dept_name        | building | budget |
+------------------+----------+--------+
| computer science | AB-2     | 150000 |
| maths            | AB-3     |  80000 |
| physics          | AB-1     | 100000 |
+------------------+----------+--------+
3 rows in set (0.00 sec)
mysql> insert into section values('CS-2201','CS-21',1,'E2','AB-2',112);
Query OK, 1 row affected (0.01 sec)

mysql> insert into section values('ph-101','PUC-11',1,'P1','AB-1',111);
Query OK, 1 row affected (0.01 sec)

mysql> insert into section values('MA-201','CS-21',1,'E2','AB-2',112);
Query OK, 1 row affected (0.01 sec)

mysql> insert into section values('CS-3201','CS-31',1,'E3','AB-2',101);
Query OK, 1 row affected (0.01 sec)

mysql> select*from section;
+-----------+--------+----------+------+----------+-------------+
| course_id | sec_id | semester | year | building | room_number |
+-----------+--------+----------+------+----------+-------------+
| CS-2201   | CS-21  |        1 | E2   | AB-2     |         112 |
| ph-101    | PUC-11 |        1 | P1   | AB-1     |         111 |
| MA-201    | CS-21  |        1 | E2   | AB-2     |         112 |
| CS-3201   | CS-31  |        1 | E3   | AB-2     |         101 |
+-----------+--------+----------+------+----------+-------------+
4 rows in set (0.00 sec)
mysql> create table teaches(id integer,course_id varchar(20),sec_id varchar(10),semester integer,year varchar(10));
Query OK, 0 rows affected (0.02 sec)

mysql> insert into teaches values(22222,'CS-2201','CS-21',1,'E2');
Query OK, 1 row affected (0.01 sec)

mysql> insert into teaches values(22222,'CS-3201','CS-31',1,'E3');
Query OK, 1 row affected (0.00 sec)

mysql> insert into teaches values(45454,'MA-201','CS-21',1,'E2');
Query OK, 1 row affected (0.01 sec)

mysql> select*from teaches;
+-------+-----------+--------+----------+------+
| id    | course_id | sec_id | semester | year |
+-------+-----------+--------+----------+------+
| 22222 | CS-2201   | CS-21  |        1 | E2   |
| 22222 | CS-3201   | CS-31  |        1 | E3   |
| 45454 | MA-201    | CS-21  |        1 | E2   |
+-------+-----------+--------+----------+------+
3 rows in set (0.01 sec)
mysql> create table student(id integer primary key,name varchar(20),d
ept_name varchar(50),tot_cred integer);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into student values(1000,'kshitiz','computer science',80);
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values(1001,'mike','computer science',70); 
Query OK, 1 row affected (0.01 sec)

mysql> insert into student values(2000,'virtuos','maths',60);
Query OK, 1 row affected (0.00 sec)

mysql> create table takes(id integer,course_id varchar(20),sec_id varchar(10),semester integer,year varchar(10),grade char);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into takes values(1000,'CS2201','CS-21',1,'E2','A');
Query OK, 1 row affected (0.01 sec)

mysql> insert into takes values(1001,'CS3201','CS-31',1,'E3','A');
Query OK, 1 row affected (0.01 sec)

mysql> insert into takes values(1000,'MA-201','CS-21',1,'E2','B');
Query OK, 1 row affected (0.01 sec)

mysql> insert into takes values(1001,'CS2201','CS-21',1,'E2','A');
Query OK, 1 row affected (0.00 sec)

mysql> create table course(course_id varchar(20),title varchar(20),dept_name varchar(50),credits integer);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into course values('CS-2201','DBMS','computer science',4);
Query OK, 1 row affected (0.01 sec)

mysql> insert into course values('CS-3201','OS','computer science',4)
;
Query OK, 1 row affected (0.01 sec)

mysql> insert into course values('MA-201','PS','Maths',3);
Query OK, 1 row affected (0.01 sec)

mysql> insert into course values('ph-101','physics-1','physics',3);
Query OK, 1 row affected (0.01 sec)

mysql> create table classroom(building varchar(10),room_no integer,capacity integer);
Query OK, 0 rows affected (0.02 sec)

mysql> insert into classroom values('AB-2',112,100);
Query OK, 1 row affected (0.01 sec)

mysql> insert into classroom values('AB-1',111,80);
Query OK, 1 row affected (0.00 sec)

mysql> insert into classroom values('AB-2',101,70);
Query OK, 1 row affected (0.00 sec)

mysql> alter table classroom add primary key(building,room_no,capacity);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table course add primary key(course_id);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table takes add primary key(id,course_id,sec_id,semester,year);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table student add primary key(id);
ERROR 1068 (42000): Multiple primary key defined
mysql> alter table teaches add primary key(id,course_id,sec_id,semester,year);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table section add primary key(course_id,sec_id,semester,year);
Query OK, 0 rows affected (0.03 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> alter table instructor add foreign key(dept_name)references department(dept_name);
Query OK, 4 rows affected (0.03 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> alter table takes add foreign key(course_id,sec_id,semester,year)references section(course_id,sec_id,semester,year);
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> alter table section add constraint foreign key(building,room_no) references classroom(building,room_no);
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

mysql> alter table teaches add foreign key(course_id,sec_id,semester,year)references section(course_id,sec_id,semester,year);
Query OK, 3 rows affected (0.03 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> alter table student add foreign key(dept_name)references department(dept_name);
Query OK, 3 rows affected (0.02 sec)
Records: 3  Duplicates: 0  Warnings: 0

mysql> alter table course add foreign key(dept_name)references department(dept_name);
Query OK, 4 rows affected (0.04 sec)
Records: 4  Duplicates: 0  Warnings: 0

1. Find the names of the instructors(other than computer science) whose salary is greater than at least one instructor in the computer science department.

mysql> select name from instructor where salary > any (select salary
from instructor) and salary not in(select salary from instructor wher
e dept_name='computer science');
+----------+
| name     |
+----------+
| einstein |
+----------+
1 row in set (0.00 sec)

2. Increase the salary of instructors by 3% whose salary is less than average salary of their departments.

mysql> select salary+(0.03*salary) from instructor i where salary < (select avg(salary)from instructor where dept_name=i.dept_name) ;
+----------------------+
| salary+(0.03*salary) |
+----------------------+
|             77250.00 |
+----------------------+
1 row in set (0.00 sec)

3. Display the course titles and instructor names taken by the student named ‘kshitiz’.

mysql> select c.title,i.name from course c,instructor i,student s,takes t,teaches tc,section se where c.course_id=se.course_id and se.course_id=t.course_id and i.id=tc.id and s.id=t.id and tc.course_id=se.course_id and se.course_id=t.course_id and s.name='kshitiz';
+-------+----------+
| title | name     |
+-------+----------+
| DBMS  | einstein |
| PS    | mozart   |
+-------+----------+
2 rows in set (0.01 sec)


4. Display the course titles and department name conducted in building ‘AB-II’ class room ‘112’.

mysql> select title,dept_name from course c,section s where c.course_id=s.course_id and building='AB-2' and room_no=112;
+-------+------------------+
| title | dept_name        |
+-------+------------------+
| DBMS  | computer science |
| PS    | Maths            |
+-------+------------------+
2 rows in set (0.00 sec)

5. Display the student name who have taken all the courses in Computer Science department.

mysql> select name from student s,takes t,course c ,section se where s.id=t.id and t.course_id=se.course_id and se.course_id=c.course_id and  c.dept_name='computer science' group by t.id having count(t.id)=(select count(course_id)from course where dept_name='computer science');
+------+
| name |
+------+
| mike |
+------+
1 row in set (0.00 sec)


6. Display the highest credit subjects in each year-semester

7.  Display ids and titles of courses which are offered in computer science department in either       semester1 or semester 2 of ‘E2’.

mysql> select s.course_id,title from course c,section s where c.course_id=s.course_id  and dept_name='computer science'and s.year='E2' and s.semester=1 or s.semester=2;
+-----------+-------+
| course_id | title |
+-----------+-------+
| CS-2201   | DBMS  |
+-----------+-------+
1 row in set (0.00 sec)

8. Find the number of students who have taken course sections taught by instructor ‘Korth’.

mysql> select count(id)from takes where course_id in(select course_id from teaches where id in(select id from instructor where name='korth'));
+-----------+
| count(id) |
+-----------+
|         0 |
+-----------+
1 row in set (0.00 sec)
mysql> select count(id)from takes where course_id in(select course_id from teaches where id in(select id from instructor where name='einstein'));
+-----------+
| count(id) |
+-----------+                       //reference purpose
|         3 |
+-----------+
1 row in set (0.00 sec)

9. Display the details of the students  who got ‘A’ grade in all the courses he has taken.

mysql> select name from student where id in(select id from takes t where not exists((select course_id from takes where id=t.id)except(select
 course_id from takes where grade='A' and id=t.id)));
+------+
| name |
+------+
| mike |
+------+
1 row in set (0.00 sec)







