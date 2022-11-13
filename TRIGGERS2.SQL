The questions are based on the following schema:
Database Scheme
Highschooler ( ID, name, grade )
English: There is a high school student with unique ID and a given first name in a certain grade.
Friend ( ID1, ID2 )
English: The student with ID1 is friends with the student with ID2. Friendship is mutual, so if (123,
456) is in the Friend table, so is (456, 123).
Likes ( ID1, ID2 )
English: The student with ID1 likes the student with ID2. Liking someone is not necessarily mutual,
so if (123, 456) is in the Likes table, there is no guarantee that (456, 123) is also present.
Create a database and run the social1.sql file to create the schema. Use the following commands:
create database social_rollno;
use social_rollno;
source social1.sql
Execute the following triggers
1) Write one or more triggers to maintain symmetry in friend relationships. Specifically, if (A,B) is
deleted from Friend, then (B,A) and (A,B) should be deleted from Friend_1. If (A,B) is inserted
into Friend then (B,A) and (A,B) should be inserted to Friend_1. Don't worry about updates to the
Friend table. Now, check the following things
a) insert the following tuple (100, 200) in Friend to check the insert trigger and verify the result
from Friend_1 table.
b) delete (1304,1934) from Friend to test the delete trigger and verify the result from Friend_1
table.
--------------------------------------------------------------------------------------------------------
mysql> delimiter $
mysql> create trigger trig1 after insert on Friend for each row begin insert into Friend_1 values(new.ID1,new.ID2),(new.ID2,new.ID1); END $
Query OK, 0 rows affected (0.19 sec)
CREATE TRIGGER T1DEL AFTER DELETE ON Friend FOR EACH ROW DELETE FROM Friend_1 where (ID1 = old.ID2 and ID2 = old.ID1) and (ID1 = old.ID1 and ID2 = old.ID2);
mysql> create trigger trig2 after delete on Friend for each row begin delete from Friend_1 where (Friend_1.ID1=old.ID1 && Friend_1.ID2=old.ID2) OR (Friend_1.ID1=old.ID2 && Friend_1.ID2=old.ID1); END $
Query OK, 0 rows affected, 2 warnings (0.17 sec)
DELETE FROM Friend where ID1 = 1304 and ID2 = 1934;
INSERT INTO Friend VALUES(100,200);
----------------------------------------------------------------------------------------------------------
2) Write one or more triggers to manage the grade attribute of new Highschoolers. If the inserted
tuple has a value less than 9 or greater than 12, Insert the row in Highschooler_1 having grade as
NULL. On the other hand, if the inserted tuple in Highschooler has a null value for grade, insert
the same row in Highschoolar_1 having grade 9.
------------------------------------------------------------------------------------------------------------
mysql> create trigger trig4 after insert on Highschooler for each row begin if new.grade<9 or new.grade>12 then insert into Highschooler_1 values(new.ID,new.name,NULL); elseif new.grade IS NULL then  insert into Highschooler_1 VALUES(new.ID,new.name,9); end if; end;$
Query OK, 0 rows affected (0.10 sec)
delimiter $ 
CREATE TRIGGER T2HS AFTER INSERT ON Highschooler FOR EACH ROW 
    -> begin 
    -> if(new.grade > 12 or new.grade < 9) then 
    -> INSERT INTO Highschooler_1 VALUES(new.ID,new.name,NULL); 
    -> elseif (new.grade is NULL) then 
    -> INSERT INTO Highschooler_1 VALUES(new.ID,new.name,9);
    -> else 
    -> INSERT INTO Highschooler_1 VALUES(new.ID,new.name,new.grade); 
    -> end if; 
    -> end $
INSERT INTO Highschooler VALUES(100,'harsh',13)$
INSERT INTO Highschooler VALUES(101,'HT',NULL)$
-------------------------------------------------------------------------------------------------------------
3) Write a trigger that automatically deletes students from Highschooler_1 when they graduate, i.e.,
when their grade is updated to exceed 12 . In addition, write a trigger so when a student of
Highschooler is moved ahead one grade , then update grade by one in Highschooler_1 of same
student and all of his or her friends. Check your trigger by incrementing the grade of student id
1501.
--------------------------------------------------------------------------------------------------------------
CREATE TRIGGER T2 AFTER UPDATE ON Highschooler FOR EACH ROW 
begin 
if( new.grade > 12 ) then 
	DELETE FROM Highschooler_1 where ID = old.ID;
end if; 
end$

CREATE TRIGGER T3 AFTER UPDATE ON Highschooler FOR EACH ROW 
begin 
if( new.grade = old.grade + 1 ) then 
	UPDATE Highschooler_1 SET grade = new.grade WHERE ID = new.ID and ID in (
	select ID2 FROM Friend WHERE ID1 = new.ID);
end if; 
end$

UPDATE Highschooler SET grade = grade+1 WHERE ID = 1501$

CREATE TRIGGER NEW AFTER UPDATE ON Highschooler FOR EACH ROW
    -> begin
    -> if( new.grade = old.grade + 1) then
    -> UPDATE Highschooler_1 SET grade = new.grade WHERE ID = new.ID;
    -> UPDATE Highschooler_1 SET grade = grade + 1 WHERE ID in( SELECT ID2 FROM Friend_1 WHERE ID1 = new.ID);
    -> end if;
    -> end$
---------------------------------------------------------------------------------------------------------------
