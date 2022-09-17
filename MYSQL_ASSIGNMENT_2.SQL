mysql> show databases;
+--------------------+
| Database           |
+--------------------+
| ds_salaries        |
| information_schema |
| learn              |
| mavenmovies        |
| mysql              |
| performance_schema |
| sys                |
| university         |
+--------------------+
8 rows in set (0.04 sec)

mysql> use university;
Database changed
mysql> show tables;
Empty set (0.07 sec)

mysql> create table Instructor(
    -> ID int,
    -> name varchar(20),
    -> dept_name varchar(25),
    -> salary int);
Query OK, 0 rows affected (0.15 sec)

mysql> create table Department(
    -> dept_name varchar(20),
    -> building varchar(20),
    -> budget int);
Query OK, 0 rows affected (0.13 sec)

mysql> create table Course(
    -> course_id int,
    -> title varchar(20),
    -> dept_name varchar(20),
    -> credits int);
Query OK, 0 rows affected (0.03 sec)

mysql> ALTER TABLE Instructor CHANGE COLUMN ID instructor_ID int;
mysql> ALTER TABLE Instructor ADD PRIMARY KEY(instructor_ID);
mysql> ALTER TABLE Instructor DROP PRIMARY KEY;
mysql> ALTER TABLE Department ADD PRIMARY KEY(dept_name);
mysql> ALTER TABLE Course ADD PRIMARY KEY(course_id);
mysql> ALTER TABLE Department ADD CHECK(dept_name IN ('CCE','MME','CSE','ECE','PHY','BIO'));
mysql> ALTER TABLE Instructor ADD CONSTRAINT FOREIGN KEY(dept_name) REFERENCES Department(dept_name) ON DELETE CASCADE;
mysql> ALTER TABLE Course ADD CONSTRAINT FOREIGN KEY(dept_name) REFERENCES Department(dept_name) ON DELETE CASCADE;

mysql> DESC Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_name | varchar(20) | NO   | PRI | NULL    |       |
| building  | varchar(20) | YES  |     | NULL    |       |
| budget    | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.05 sec)

mysql> desc Instructor;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| instructor_ID | int         | NO   |     | NULL    |       |
| name          | varchar(20) | YES  |     | NULL    |       |
| dept_name     | varchar(25) | YES  | MUL | NULL    |       |
| salary        | int         | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc Course;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| course_id | int         | NO   | PRI | NULL    |       |
| title     | varchar(20) | YES  |     | NULL    |       |
| dept_name | varchar(20) | YES  | MUL | NULL    |       |
| credits   | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> ALTER TABLE Instructor ADD email_id varchar(24);
Query OK, 0 rows affected (0.04 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Instructor;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| instructor_ID | int         | NO   |     | NULL    |       |
| name          | varchar(20) | YES  |     | NULL    |       |
| dept_name     | varchar(25) | YES  | MUL | NULL    |       |
| salary        | int         | YES  |     | NULL    |       |
| email_id      | varchar(24) | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
5 rows in set (0.01 sec)

mysql> ALTER TABLE Instructor ADD CONSTRAINT UNIQUE(email_id);
mysql> ALTER TABLE Instructor ADD dob DATE;
mysql> ALTER TABLE Department ALTER budget SET DEFAULT 0;
mysql> ALTER TABLE Department ADD CONSTRAINT CHECK(budget>0);
mysql> desc Department;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| dept_name | varchar(20) | NO   | PRI | NULL    |       |
| building  | varchar(20) | YES  |     | NULL    |       |
| budget    | int         | YES  |     | 0       |       |
+-----------+-------------+------+-----+---------+-------+
3 rows in set (0.03 sec)

mysql> desc Course;
+-----------+-------------+------+-----+---------+-------+
| Field     | Type        | Null | Key | Default | Extra |
+-----------+-------------+------+-----+---------+-------+
| course_id | int         | NO   | PRI | NULL    |       |
| title     | varchar(20) | YES  |     | NULL    |       |
| dept_name | varchar(20) | YES  | MUL | NULL    |       |
| credits   | int         | YES  |     | NULL    |       |
+-----------+-------------+------+-----+---------+-------+
4 rows in set (0.00 sec)

mysql> desc Instructor;
+---------------+-------------+------+-----+---------+-------+
| Field         | Type        | Null | Key | Default | Extra |
+---------------+-------------+------+-----+---------+-------+
| instructor_ID | int         | NO   |     | NULL    |       |
| name          | varchar(20) | YES  |     | NULL    |       |
| dept_name     | varchar(25) | YES  | MUL | NULL    |       |
| salary        | int         | YES  |     | NULL    |       |
| email_id      | varchar(24) | YES  | UNI | NULL    |       |
| dob           | date        | YES  |     | NULL    |       |
+---------------+-------------+------+-----+---------+-------+
6 rows in set (0.02 sec)

mysql> INSERT INTO Department VALUES('CSE','A',300000);
Query OK, 1 row affected (0.09 sec)

mysql> INSERT INTO Department VALUES('CCE','B',300000);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Department VALUES('ECE','C',295000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Department VALUES('MME','D',195000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Department VALUES('PHY','E',155000);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Department VALUES('BIO','F',105000);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Instructor VALUES(1,'abc','CCE',100000,'abc@gmail.com','1990-01-12');
Query OK, 1 row affected (0.03 sec)

mysql> INSERT INTO Instructor VALUES(2,'def','CSE',100000,'def@gmail.com','1980-01-18');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Instructor VALUES(3,'ghi','ECE',100000,'ghi@gmail.com','1980-07-20');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Instructor VALUES(4,'mno','PHY',50000,'mno@gmail.com','1980-01-20');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Instructor VALUES(5,'pqr','BIO',45000,'pqr@gmail.com','1987-08-26');
Query OK, 1 row affected (0.01 sec)

mysql> Insert INTO Course VALUES(1,'AP','CSE',3);
Query OK, 1 row affected (0.01 sec)

mysql> Insert INTO Course VALUES(2,'SNS','ECE',3);
Query OK, 1 row affected (0.07 sec)

mysql> Insert INTO Course VALUES(3,'DCS','CCE',3);
Query OK, 1 row affected (0.01 sec)

mysql> Insert INTO Course VALUES(4,'QM','PHY',4);
Query OK, 1 row affected (0.00 sec)

mysql> Insert INTO Course VALUES(5,'PB','BIO',2);
Query OK, 1 row affected (0.00 sec)

mysql> SELECT name,email_id FROM Instructor;
mysql> UPDATE Department SET budget=8000000 WHERE dept_name='CSE';
mysql> ALTER TABLE Instructor MODIFY COLUMN dob varchar(30);
mysql> DELETE FROM Department WHERE dept_name='BIO';

mysql> UPDATE department SET dept_name='CHE' WHERE dept_name='PHY';
ERROR 1451 (23000): Cannot delete or update a parent row: a foreign key constraint 
fails (`university4`.`Instructor`, CONSTRAINT `Instructor_ibfk_1` FOREIGN KEY 
(`dept_name`) REFERENCES `department` (`dept_name`) ON DELETE CASCADE)

mysql> ALTER TABLE Instructor DROP foreign key Instructor_ibfk_1;
Query OK, 0 rows affected (0.07 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> ALTER TABLE course DROP foreign key course_ibfk_1;

mysql> UPDATE department SET dept_name='CHE' WHERE dept_name='PHY';

mysql> DROP TABLE Course;


