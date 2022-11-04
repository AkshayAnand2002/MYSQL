create table t1(
id int primary key,
name varchar(5));
create table t2(
id int,
name varchar(5));
-- 1.Create a trigger that inserts two duplicate records in t2(t1.id, t1.name), when a record is inserted
-- in table t1(id, name).
delimiter $
create trigger trig1 
after insert on t1
for each row 
begin
insert into t2
values(new.id,new.name),(new.id,new.name);
end
$
-- insert into t1 values(1,"a");
-- select * from t1;$
-- select * from t2;$
-- for dropping trigger drop trigger trig1;$
-- 2. Create a trigger to implement ON DELETE CASCADE i.e when a record is deleted from t1, then
-- the records with same id must be deleted from t2.
delimiter $
create trigger trig2 
after delete on t1
for each row 
begin 
delete from t2 
where t2.id=old.id;
end
$
-- 3.Create a new table log(id int, name varchar(5), event varchar(9)). Create a trigger to maintain the
-- log of all activities on t1. The values of event are either ‘insert’ or ‘delete’ or ‘update’ or
-- ‘oUpdate’. oUpdate implies values before update of a record.
delimiter $
create trigger trig3  after insert on t1 for each row begin insert into log values(new.id,new.name,"INSERT"); end $
delimiter $
create trigger trig4
after delete
on t1
for each row
begin
insert into log values(old.id,old.name,"DELETE");
END
$
delimiter $
CREATE TRIGGER trig5
AFTER UPDATE
ON T1
FOR EACH ROW
BEGIN
INSERT INTO LOG VALUES(old.id,old.name,"OUPDATE");
END
$
delimiter $
CREATE TRIGGER trig6 AFTER UPDATE ON T1 FOR EACH ROW BEGIN INSERT INTO LOG VALUES(new.id,new.name,"UPDATE"); END$
-- ALL DONE FOR 3RD QUESTION.
