1.retrieve the birth date and address of the employee whose name is "john B.smith".

mysql> select bdate,address from employee where fname='john' and mname='b'and lname='smith';
+------------+-------------------------+
| bdate      | address                 |
+------------+-------------------------+
| 1965-01-09 | 731 Fondren, Houston,TX |
+------------+-------------------------+
1 row in set (0.01 sec)
 

2.Retrieve the name and address of all employees who work for the
‘Research’ department.

mysql> select fname,address from employee where dno in(select dnumber from department where dname='research');
+----------+-------------------------+
| fname    | address                 |
+----------+-------------------------+
| John     | 731 Fondren, Houston,TX |
| Franklin | 638 Voss, Houston,TX    |
| Joyce    | 5631 Rice, Houston,TX   |
| Ramesh   | 975 Fire Oak, Humble,TX |
+----------+-------------------------+
4 rows in set (0.02 sec)


mysql> select year(bdate)from employee;
+-------------+
| year(bdate) |
+-------------+
|        1965 |
|        1955 |
|        1972 |
|        1962 |
|        1937 |
|        1941 |
|        1969 |
|        1968 |
+-------------+
8 rows in set (0.00 sec)

mysql> select salary+1000 from employee;
+-------------+
| salary+1000 |
+-------------+
|    31000.00 |
|    41000.00 |
|    26000.00 |
|    39000.00 |
|    56000.00 |
|    44000.00 |
|    26000.00 |
|    26000.00 |
+-------------+
8 rows in set (0.00 sec)



3.Query:  For every project located in ‘Stafford’, list the project number, the controlling department number, and the department manager’s last name, address, and birth date.

mysql> select pnumber,dnumber,lname,bdate,address from employee e,department d,project p where e.ssn=d.mgr_ssn and d.dnumber=p.dnum and p.plocation='stafford';
+---------+---------+---------+------------+------------------------+
| pnumber | dnumber | lname   | bdate      | address                |
+---------+---------+---------+------------+------------------------+
|      10 |       4 | Wallace | 1941-06-20 | 291 Berry, Bellaire,TX |
|      30 |       4 | Wallace | 1941-06-20 | 291 Berry, Bellaire,TX |
+---------+---------+---------+------------+------------------------+
2 rows in set (0.00 sec)

4.Query: For each employee, retrieve the employee’s first and last name and the first and last name of his or her immediate supervisor.

mysql> select e1.fname,e1.lname ,e2.fname,e2.lname from employee e1,employee e2 where e1.super_ssn=e2.ssn;
+----------+---------+----------+---------+
| fname    | lname   | fname    | lname   |
+----------+---------+----------+---------+
| Ramesh   | Narayan | Franklin | Wong    |
| Joyce    | English | Franklin | Wong    |
| John     | Smith   | Franklin | Wong    |
| Jennifer | Wallace | James    | Borg    |
| Franklin | Wong    | James    | Borg    |
| Alicia   | Zelaya  | Jennifer | Wallace |
| Ahmad    | Jabbar  | Jennifer | Wallace |
+----------+---------+----------+---------+
7 rows in set (0.01 sec)

5.Query: Write a query which is retrieves all the attribute values of any EMPLOYE who works in DEPARTMENT number 5.

mysql> select*from employee where dno=5;
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+
| Fname    | Mname | Lname   | Ssn       | Bdate      | Address                 | Sex  | Salary   | Super_ssn | Dno |
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Houston,TX | M    | 30000.00 | 333445555 |   5 |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Houston,TX    | F    | 40000.00 | 888665555 |   5 |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston,TX   | F    | 25000.00 | 333445555 |   5 |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble,TX | M    | 38000.00 | 333445555 |   5 |
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+
4 rows in set (0.00 sec)

6.Query: write a query which is retrieves all the attributes of an EMPLOYEE and attributes of the DEPARTMENT in which he or she works for every employee of the ‘Research’ department,

mysql> select e.*,d.*from employee e,department d where dno=dnumber and dname='research';
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+----------+---------+-----------+----------------+
| Fname    | Mname | Lname   | Ssn       | Bdate      | Address                 | Sex  | Salary   | Super_ssn | Dno | Dname    | Dnumber | mgr_ssn   | Mgr_start_date |
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+----------+---------+-----------+----------------+
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Houston,TX | M    | 30000.00 | 333445555 |   5 | Research |       5 | 333445555 | 1988-05-22     |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Houston,TX    | F    | 40000.00 | 888665555 |   5 | Research |       5 | 333445555 | 1988-05-22     |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston,TX   | F    | 25000.00 | 333445555 |   5 | Research |       5 | 333445555 | 1988-05-22     |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble,TX | M    | 38000.00 | 333445555 |   5 | Research |       5 | 333445555 | 1988-05-22     |
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+----------+---------+-----------+----------------+
4 rows in set (0.01 sec)

7.Query: write a query which is specifies the CROSS PRODUCT of the EMPLOYEE and DEPARTMENT relations.

mysql> select * from employee,department;
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+----------------+---------+-----------+----------------+
| Fname    | Mname | Lname   | Ssn       | Bdate      | Address                 | Sex  | Salary   | Super_ssn | Dno | Dname          | Dnumber | mgr_ssn   | Mgr_start_date |
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+----------------+---------+-----------+----------------+
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Houston,TX | M    | 30000.00 | 333445555 |   5 | Research       |       5 | 333445555 | 1988-05-22     |
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Houston,TX | M    | 30000.00 | 333445555 |   5 | Administration |       4 | 987654321 | 1995-01-01     |
| John     | B     | Smith   | 123456789 | 1965-01-09 | 731 Fondren, Houston,TX | M    | 30000.00 | 333445555 |   5 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Houston,TX    | F    | 40000.00 | 888665555 |   5 | Research       |       5 | 333445555 | 1988-05-22     |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Houston,TX    | F    | 40000.00 | 888665555 |   5 | Administration |       4 | 987654321 | 1995-01-01     |
| Franklin | T     | Wong    | 333445555 | 1955-12-08 | 638 Voss, Houston,TX    | F    | 40000.00 | 888665555 |   5 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston,TX   | F    | 25000.00 | 333445555 |   5 | Research       |       5 | 333445555 | 1988-05-22     |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston,TX   | F    | 25000.00 | 333445555 |   5 | Administration |       4 | 987654321 | 1995-01-01     |
| Joyce    | A     | English | 453453453 | 1972-07-31 | 5631 Rice, Houston,TX   | F    | 25000.00 | 333445555 |   5 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble,TX | M    | 38000.00 | 333445555 |   5 | Research       |       5 | 333445555 | 1988-05-22     |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble,TX | M    | 38000.00 | 333445555 |   5 | Administration |       4 | 987654321 | 1995-01-01     |
| Ramesh   | K     | Narayan | 666884444 | 1962-09-15 | 975 Fire Oak, Humble,TX | M    | 38000.00 | 333445555 |   5 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| James    | E     | Borg    | 888665555 | 1937-11-10 | 450 Stone, Houston,TX   | M    | 55000.00 | NULL      |   1 | Research       |       5 | 333445555 | 1988-05-22     |
| James    | E     | Borg    | 888665555 | 1937-11-10 | 450 Stone, Houston,TX   | M    | 55000.00 | NULL      |   1 | Administration |       4 | 987654321 | 1995-01-01     |
| James    | E     | Borg    | 888665555 | 1937-11-10 | 450 Stone, Houston,TX   | M    | 55000.00 | NULL      |   1 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| Jennifer | S     | Wallace | 987654321 | 1941-06-20 | 291 Berry, Bellaire,TX  | F    | 43000.00 | 888665555 |   4 | Research       |       5 | 333445555 | 1988-05-22     |
| Jennifer | S     | Wallace | 987654321 | 1941-06-20 | 291 Berry, Bellaire,TX  | F    | 43000.00 | 888665555 |   4 | Administration |       4 | 987654321 | 1995-01-01     |
| Jennifer | S     | Wallace | 987654321 | 1941-06-20 | 291 Berry, Bellaire,TX  | F    | 43000.00 | 888665555 |   4 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| Ahmad    | V     | Jabbar  | 987987987 | 1969-03-29 | 980 Dallas, Houston,TX  | M    | 25000.00 | 987654321 |   4 | Research       |       5 | 333445555 | 1988-05-22     |
| Ahmad    | V     | Jabbar  | 987987987 | 1969-03-29 | 980 Dallas, Houston,TX  | M    | 25000.00 | 987654321 |   4 | Administration |       4 | 987654321 | 1995-01-01     |
| Ahmad    | V     | Jabbar  | 987987987 | 1969-03-29 | 980 Dallas, Houston,TX  | M    | 25000.00 | 987654321 |   4 | Headquarters   |       1 | 888665555 | 1981-06-19     |
| Alicia   | J     | Zelaya  | 999887777 | 1968-01-19 | 3321 Castle, Spring,TX  | F    | 25000.00 | 987654321 |   4 | Research       |       5 | 333445555 | 1988-05-22     |
| Alicia   | J     | Zelaya  | 999887777 | 1968-01-19 | 3321 Castle, Spring,TX  | F    | 25000.00 | 987654321 |   4 | Administration |       4 | 987654321 | 1995-01-01     |
| Alicia   | J     | Zelaya  | 999887777 | 1968-01-19 | 3321 Castle, Spring,TX  | F    | 25000.00 | 987654321 |   4 | Headquarters   |       1 | 888665555 | 1981-06-19     |
+----------+-------+---------+-----------+------------+-------------------------+------+----------+-----------+-----+----------------+---------+-----------+----------------+
24 rows in set (0.00 sec)

8.Query: Select all EMPLOYEE  Ssns in the database.

mysql> select ssn from employee;
+-----------+
| ssn       |
+-----------+
| 888665555 |
| 987654321 |
| 987987987 |
| 999887777 |
| 123456789 |
| 333445555 |
| 453453453 |
| 666884444 |
+-----------+
9.Query: Select all EMPLOYEE  Ssns

10.Query: Retrieve the salary of every employee .

mysql> select salary from employee;
+----------+
| salary   |
+----------+
| 30000.00 |
| 40000.00 |
| 25000.00 |
| 38000.00 |
| 55000.00 |
| 43000.00 |
| 25000.00 |
| 25000.00 |
+----------+
8 rows in set (0.00 sec)

11.Query: Retrieve the all distinct salary value.

mysql> select distinct(salary) from employee;
+----------+
| salary   |
+----------+
| 30000.00 |
| 40000.00 |
| 25000.00 |
| 38000.00 |
| 55000.00 |
| 43000.00 |
+----------+
6 rows in set (0.01 sec)

12.Query: Make a list of all project numbers for projects that involve an employee whose last name is ‘Smith’, either as a worker or as a manager of the department that controls the project.

mysql> select distinct pno from employee e,department d ,works_on w  where e.lname='smith' and  (e.ssn=d.mgr_ssn or w.essn=e.ssn);
+-----+
| pno |
+-----+
|   1 |
|   2 |
+-----+
2 rows in set (0.00 sec)



mysql> select pnumber from project where dnum in(select dnumber from department where mgr_ssn in(select ssn from employee where fname='smith'));
Empty set (0.01 sec)


13.Query: Retrieve all employees whose address is in Houston, Texas.

mysql> select fname from employee where address like "%houston,tx%";
+----------+
| fname    |
+----------+
| John     |
| Franklin |
| Joyce    |
| James    |
| Ahmad    |
+----------+
5 rows in set (0.00 sec)
14.Query: Find all employees who were born during the 1950s.
mysql> select fname from employee where year(bdate) between 1950 and 1959;
+----------+
| fname    |
+----------+
| Franklin |
+----------+
1 row in set (0.00 sec)

15.Query: Show the resulting salaries if every employee working on the ‘ProductX’ project is given a 10 percent raise.

mysql> select salary*0.1+salary from employee where ssn in(select ess
n from works_on where pno in(select pnumber from project where pname='productx'));
+-------------------+
| salary*0.1+salary |
+-------------------+
|         33000.000 |
|         27500.000 |
+-------------------+
2 rows in set (0.00 sec)

mysql> select salary*0.1+salary from employee e,works_on w,project p where e.ssn=w.essn and w.pno=p.pnumber and pname='productx';
+-------------------+
| salary*0.1+salary |
+-------------------+
|         33000.000 |
|         27500.000 |
+-------------------+
2 rows in set (0.01 sec)

16.Query: Retrieve all employees in department 5 whose salary is between $30,000 and $40,000.

mysql> select fname from employee where dno=5 and salary between 30000 and 40000;
+----------+
| fname    |
+----------+
| John     |
| Franklin |
| Ramesh   |
+----------+
3 rows in set (0.00 sec)

17.Query: Retrieve a list of employees and the projects they are working on, ordered by department and within each department, ordered alphabetically by last name, then first name.

mysql> select fname,pname,dno from employee e,works_on w,project p where e.ssn=w.essn and p.pnumber=w.pno order by fname,dno;
+----------+-----------------+-----+
| fname    | pname           | dno |
+----------+-----------------+-----+
| Ahmad    | Computarization |   4 |
| Ahmad    | Newbenefits     |   4 |
| Alicia   | Computarization |   4 |
| Alicia   | Newbenefits     |   4 |
| Franklin | Computarization |   5 |
| Franklin | ProductY        |   5 |
| Franklin | ProductZ        |   5 |
| Franklin | Reorganization  |   5 |
| James    | Reorganization  |   1 |
| Jennifer | Newbenefits     |   4 |
| Jennifer | Reorganization  |   4 |
| John     | ProductX        |   5 |
| John     | ProductY        |   5 |
| Joyce    | ProductX        |   5 |
| Joyce    | ProductY        |   5 |
| Ramesh   | ProductZ        |   5 |
+----------+-----------------+-----+
16 rows in set (0.00 sec)



18.Query: Retrieve the name of all employees who do not have supervisors.
mysql> select fname from employee where super_ssn is null;
+-------+
| fname |
+-------+
| James |
+-------+
1 row in set (0.00 sec)

19.Query: Retrieve the name of each employee who has a dependent with the same first name and is the same sex as the employee.
mysql> select fname from employee e,dependent d where e.ssn=d.essn and fname=dependent_name and e.sex=d.sex;
Empty set (0.00 sec)


20.Query: write a query which is retrieve In general, a query written with nested select-from-where blocks and using the = or IN comparison operators can always be expressed as a single block query.

21.Query: Retrieve the names of employee who have no dependents.
mysql> select fname from employee where ssn not in(select essn from dependent);
+--------+
| fname  |
+--------+
| Joyce  |
| Ramesh |
| James  |
| Ahmad  |
| Alicia |
+--------+
5 rows in set (0.00 sec)

22.Query: List the name of managers who have at least one dependent.

mysql> select fname from employee where ssn in(select mgr_ssn from department where mgr_ssn in(select essn from dependent));
+----------+
| fname    |
+----------+
| Jennifer |
| Franklin |
+----------+
2 rows in set (0.00 sec)

mysql> select distinct fname from employee e,department d,dependent d
e where e.ssn=d.mgr_ssn and d.mgr_ssn=de.essn;
+----------+
| fname    |
+----------+
| Jennifer |
| Franklin |
+----------+
2 rows in set (0.00 sec)


23.Query: Retrieve the Social Security numbers of all employee who work on project numbers 1, 2, or 3.
mysql> select essn from works_on where pno=1 or pno=2 or pno=3;
+-----------+
| essn      |
+-----------+
| 123456789 |
| 453453453 |
| 123456789 |
| 333445555 |
| 453453453 |
| 333445555 |
| 666884444 |
+-----------+
7 rows in set (0.01 sec)

mysql> select essn from works_on where pno in(1,2,3);
+-----------+
| essn      |
+-----------+
| 123456789 |
| 453453453 |
| 123456789 |
| 333445555 |
| 453453453 |
| 333445555 |
| 666884444 |
+-----------+
7 rows in set (0.00 sec)

24.Query: Find the sum of the salaries of all employees, the maximum salary, the minimum salary, and the average salary.
mysql> select sum(salary),max(salary),min(salary),avg(salary) from employee;  
+-------------+-------------+-------------+--------------+
| sum(salary) | max(salary) | min(salary) | avg(salary)  |
+-------------+-------------+-------------+--------------+
|   281000.00 |    55000.00 |    25000.00 | 35125.000000 |
+-------------+-------------+-------------+--------------+
1 row in set (0.00 sec)
 
25.Query: Find the sum of the salaries of all employees of the ‘Research’ department, as well as the maximum salary, the minimum salary, and the average salary in this department. 
mysql> select sum(salary),max(salary),min(salary),avg(salary) from employee where dno in(select dnumber from  department where dname="research");
+-------------+-------------+-------------+--------------+
| sum(salary) | max(salary) | min(salary) | avg(salary)  |
+-------------+-------------+-------------+--------------+
|   133000.00 |    40000.00 |    25000.00 | 33250.000000 |
+-------------+-------------+-------------+--------------+
1 row in set (0.01 sec)

mysql> select sum(salary),max(salary),min(salary),avg(salary) from employee e,department d where dno=dnumber and dname='research';
+-------------+-------------+-------------+--------------+
| sum(salary) | max(salary) | min(salary) | avg(salary)  |
+-------------+-------------+-------------+--------------+
|   133000.00 |    40000.00 |    25000.00 | 33250.000000 |
+-------------+-------------+-------------+--------------+
1 row in set (0.01 sec)

26.Query: Retrieve the total number of employees in the company.
mysql> select count(ssn)from employee;
+------------+
| count(ssn) |
+------------+
|          8 |
+------------+
1 row in set (0.01 sec)

27.Query:  Retrieve the total number of employees in the company and the number of employees in the ‘Research’ department.

mysql> select count(*)as company,(select count(*)from employee where dno in (select dnumber from department where dname='research')) as department from employee;
+---------+------------+
| company | department |
+---------+------------+
|       8 |          4 |
+---------+------------+
1 row in set (0.00 sec)

28.Query: Count the number of distinct salary value in the database.
mysql> select count(distinct salary)from employee;
+------------------------+
| count(distinct salary) |
+------------------------+
|                      6 |
+------------------------+
1 row in set (0.00 sec)

29.Query: For each department, retrieve the department number, the number of employees in the department, and their average salary.
mysql> select count(dno),dno,avg(salary) from employee where dno in(select dnumber from department)group by dno;
+------------+-----+--------------+
| count(dno) | dno | avg(salary)  |
+------------+-----+--------------+
|          3 |   4 | 31000.000000 |
|          1 |   1 | 55000.000000 |
|          4 |   5 | 33250.000000 |
+------------+-----+--------------+

mysql> select dnumber,count(ssn),avg(salary) from employee e,department d where  dno=dnumber group by dnumber;
+---------+------------+--------------+
| dnumber | count(dno) | avg(salary)  |
+---------+------------+--------------+
|       4 |          3 | 31000.000000 |
|       1 |          1 | 55000.000000 |
|       5 |          4 | 33250.000000 |
+---------+------------+--------------+
3 rows in set (0.00 sec)


 30. Query: For each project, retrieve the project number, the project name, and
the number of employees who work on that project.

mysql> select pnumber,pname,count(essn) from works_on w ,project p where pno=pnumber group by pnumber;
+---------+-----------------+-------------+
| pnumber | pname           | count(essn) |
+---------+-----------------+-------------+
|       1 | ProductX        |           2 |
|       2 | ProductY        |           3 |
|       3 | ProductZ        |           2 |
|      10 | Computarization |           3 |
|      20 | Reorganization  |           3 |
|      30 | Newbenefits     |           3 |
+---------+-----------------+-------------+
6 rows in set (0.01 sec)

                 
 31. Query:  For each project on which more than two employees work, retrieve the project number, the project name, and the number of employees who work on the project.
 
 mysql> select pnumber,pname,count(essn) from works_on w ,project p where pno=pnumber group by pnumber having count(pnumber)>2;
+---------+-----------------+-------------+
| pnumber | pname           | count(essn) |
+---------+-----------------+-------------+
|       2 | ProductY        |           3 |
|      10 | Computarization |           3 |
|      20 | Reorganization  |           3 |
|      30 | Newbenefits     |           3 |
+---------+-----------------+-------------+
4 rows in set (0.00 sec)

32. Query:  For each project, retrieve the project number, the project name, and
the number of employees from department 5 who work on the project.
 
mysql> select pnumber,pname,count(essn) from works_on w ,project p where pno=pnumber and dnum=5 group by pnumber;
+---------+----------+-------------+
| pnumber | pname    | count(essn) |
+---------+----------+-------------+
|       1 | ProductX |           2 |
|       2 | ProductY |           3 |
|       3 | ProductZ |           2 |
+---------+----------+-------------+
3 rows in set (0.00 sec)
 
 33. Query: For each department that has more than five employees, retrieve the department number and the number of its employees who are making more than $40,000
 mysql> select dno,count(ssn)from employee where salary>40000 group by dno having count(dno)>5;
Empty set (0.01 sec)

mysql> select dno,count(ssn)from employee where salary>30000 group by dno;
+-----+----------+
| dno | count(ssn) |
+-----+----------+
|   1 |        1 |
|   4 |        1 |
|   5 |        2 |
+-----+----------+
3 rows in set (0.00 sec)

