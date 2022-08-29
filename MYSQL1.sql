show databases;-- to get to know the databases already present.
create database learn;-- to create database of name learn
use learn;-- to get into database.
drop database learn;-- to delete database learn.
-- after making use ... we can create tables and do other commands on table.
create table user(id int(11) primary key,name varchar(100) not null,city varchar(50));
-- in () the column names their datatype,constraints etc are written.
show tables;-- to show tables in database selected.
desc user;-- to describe table user i.e. columns, datatypes,null,keys etc.
drop table user;-- to delete table user.
alter table user rename to student;-- rename table name user to student
-- user table now renamed to student
truncate table student;-- to delete data from table and schema is retained.
insert into student(id,name,city) values(12,'durgesh','delhi');-- to insert data into table.
insert into student values(13,'akshay','jaipur');-- to insert data in the order inwhich they are present in the table.
select * from student; -- to get all data present in student table.
alter table student add country varchar(50);-- to add a new column country. 
alter table student CHANGE country mobileno int(10);-- to change a column's name and type
alter table student CHANGE mobileno country varchar(50);
update student set country='india' where name='durgesh';-- setting country for a name.
update student set city='delhi',country='ind' where id=13;-- setting city and country for an id.
insert into student values(14,'durgesh','mumbai','ind');
insert into student values(15,'munnalal','mumbai','ind');
insert into student values(16,'popatlal','bhopal','ind');
select * from student where city='mumbai';-- students corresponding to a particular city
select * from student where country='ind';-- students corresponding to a particular country
select name,city from student where country='ind';-- selecting particular columns.
select name as "USERNAME",city as "CITYNAME" from student;-- assigning different names of columns also called as alias.
insert into student values(17,'joseph','wisconsin','us');
insert into student values(18,'robert','tokyo','jp');
select distinct(country) from student;-- selects all distinct countries from student table.
select * from student where country='ind' and city='mumbai';-- selecting record satisfying conditions
select * from student where country='ind' or city='mumbai';-- selecting record satisfying conditions
select * from student where id >=13 and id<=15;-- selected records where condition is satisfied.
select * from student where id between 13 and 15;-- selected records where condition is satisfied.
select * from student where id in (13,15,17);-- selecting required ids
select * from student limit 4;-- selects top 4 records from table
select * from student limit 2 offset 2;-- offset 2 means don't take top 2 records and limit 2 takes the next 2 records
select * from student order by id;-- ascending order
select * from student order by id desc;-- descending order
select * from student order by id desc limit 2;-- to get last 2 records of table
select * from student where name like 'a%';
select * from student where name like '_o%';-- selecting names whose 2nd letter is o.
select * from student where city like '%o___';
select SUM(id) from student;-- summing id nos.
select SUM(id) as "SUM OF IDS"from student;-- summing id nos.
select AVG(id) from student;-- averaging id nos.
select count(id) from student;-- counting no. of ids
select MIN(id) from student;-- min of ids
select name from student where id=(select MIN(id) from student);-- name with min id.
select name from student where id=(select MAX(id) from student);-- name with max id.
create table laptops(lid int primary key,lmodel varchar(200),studentid int,foreign key(studentid) references student(id));
-- above table has studentid as foreign key referencing the id of student table.
insert into laptops values(1200,'DELL',14);
insert into laptops values(1205,'LENOVO',13);
insert into laptops values(1240,'DELL',13);
select student.name,student.city,laptops.lmodel from student,laptops where student.id=laptops.studentid;
-- gives selected data if a student has 1 or more laptops.
select student.name,student.city,laptops.lmodel from student,laptops where student.id=laptops.studentid and student.name='durgesh';
-- selects required data if it exists for durgesh
-- in above we used equijoin.
select student.name,laptops.lmodel from student inner join laptops on student.id=laptops.studentid;
-- performing the same operation as above by using left join.
