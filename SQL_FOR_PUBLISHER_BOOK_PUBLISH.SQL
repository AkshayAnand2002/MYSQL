mysql> create database company;
Query OK, 1 row affected (0.06 sec)

mysql> use company;
Database changed

mysql> create table Publisher(
    -> pid int NOT NULL,
    -> name varchar(20),
    -> location varchar(20),
    -> PRIMARY KEY(pid));
Query OK, 0 rows affected (0.03 sec)

mysql> create table Book(
    -> bid int NOT NULL,
    -> title varchar(20),
    -> author varchar(20),
    -> page int NOT NULL,
    -> price int ,
    -> PRIMARY KEY(bid));
Query OK, 0 rows affected (0.10 sec)

mysql> create table Publish(
    -> bid int NOT NULL,
    -> pid int NOT NULL,
    -> publish_date DATE,
    -> FOREIGN KEY(bid) REFERENCES BOOK(bid),
    -> FOREIGN KEY(pid) REFERENCES Publisher(pid));
Query OK, 0 rows affected (0.06 sec)

mysql> INSERT INTO Publisher VALUES(1,'abc','mumbai');
Query OK, 1 row affected (0.04 sec)

mysql> INSERT INTO Publisher VALUES(2,'def','delhi');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Publisher VALUES(3,'ghi','kolkata');
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Book VALUES(1,'ncert','cbse',250,120);
Query OK, 1 row affected (0.02 sec)

mysql> INSERT INTO Book VALUES(2,'cambridge','cie',150,570);
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Book VALUES(3,'ics','icse',250,450);
Query OK, 1 row affected (0.00 sec)

mysql> INSERT INTO Publish VALUES(1,1,'2020-12-08');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Publish VALUES(1,2,'2020-02-08');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Publish VALUES(2,3,'2021-02-14');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Publish VALUES(3,3,'2022-05-10');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Publish VALUES(2,2,'2017-05-07');
Query OK, 1 row affected (0.01 sec)

mysql> INSERT INTO Publisher VALUES(4,'klm','chennai');
Query OK, 1 row affected (0.01 sec)

# Find the name of the publisher which hasn't published any book.
 
mysql> SELECT Publisher.name
    -> FROM Publisher
    -> LEFT OUTER JOIN Publish
    -> ON Publisher.pid = Publish.pid
    -> WHERE Publish.bid IS NULL;
+------+
| name |
+------+
| klm  |
+------+
1 row in set (0.03 sec)
mysql> SELECT Publisher.name
    -> FROM Publisher
    -> WHERE NOT EXISTS( SELECT *
    -> FROM Publish WHERE Publish.pid=Publisher.pid);
+------+
| name |
+------+
| klm  |
+------+
1 row in set (0.02 sec)

# Find the name of the publisher whose name contains at most 7 characters.
mysql> SELECT name
    -> FROM Publisher
    -> WHERE LENGTH(name)<=7;
+------+
| name |
+------+
| abc  |
| def  |
| ghi  |
| klm  |
+------+
4 rows in set (0.02 sec)

mysql> SELECT name
    -> FROM Publisher
    -> WHERE CHAR_LENGTH(name)<=7;
+------+
| name |
+------+
| abc  |
| def  |
| ghi  |
| klm  |
+------+
4 rows in set (0.01 sec)

# Delete the attribute location from the publisher table.
mysql> ALTER TABLE Publisher
    -> DROP COLUMN location;
Query OK, 0 rows affected (0.12 sec)
Records: 0  Duplicates: 0  Warnings: 0

mysql> desc Publisher;
+-------+-------------+------+-----+---------+-------+
| Field | Type        | Null | Key | Default | Extra |
+-------+-------------+------+-----+---------+-------+
| pid   | int         | NO   | PRI | NULL    |       |
| name  | varchar(20) | YES  |     | NULL    |       |
+-------+-------------+------+-----+---------+-------+
2 rows in set (0.04 sec)

mysql> select * from Publisher;
+-----+------+
| pid | name |
+-----+------+
|   1 | abc  |
|   2 | def  |
|   3 | ghi  |
|   4 | klm  |
+-----+------+
4 rows in set (0.00 sec)

# Find the name of the publisher which has published the most expensive book.
mysql> SELECT Publisher.name
    -> FROM Publisher
    -> JOIN Publish
    -> ON Publisher.pid=Publish.pid
    -> JOIN Book
    -> ON Publish.bid=Book.bid
    -> WHERE price = (SELECT MAX(price) FROM Book);
+------+
| name |
+------+
| ghi  |
| def  |
+------+
2 rows in set (0.03 sec)

# FOR MIN COST OF BOOK ->
mysql> SELECT Publisher.name
    -> FROM Publisher
    -> JOIN Publish
    -> ON Publisher.pid=Publish.pid
    -> JOIN Book
    -> ON Publish.bid = Book.bid
    -> ORDER BY Book.price
    -> LIMIT 1;
+------+
| name |
+------+
| abc  |
+------+
1 row in set (0.09 sec)
# FOR MAX COST ->
mysql> SELECT Publisher.name
    -> FROM Publisher
    -> JOIN Publish
    -> ON Publisher.pid=Publish.pid
    -> JOIN Book
    -> ON Publish.bid = Book.bid
    -> ORDER BY Book.price DESC
    -> LIMIT 1;
+------+
| name |
+------+
| ghi  |
+------+
1 row in set (0.01 sec)

# Update page number of all books to 600 whose price is greater than 500.
mysql> SELECT * FROM Book;
+-----+-----------+--------+------+-------+
| bid | title     | author | page | price |
+-----+-----------+--------+------+-------+
|   1 | ncert     | cbse   |  250 |   120 |
|   2 | cambridge | cie    |  150 |   570 |
|   3 | ics       | icse   |  250 |   450 |
+-----+-----------+--------+------+-------+
3 rows in set (0.01 sec)

mysql> UPDATE Book
    -> SET page=600
    -> WHERE price>500;
Query OK, 1 row affected (0.05 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> SELECT * FROM Book;
+-----+-----------+--------+------+-------+
| bid | title     | author | page | price |
+-----+-----------+--------+------+-------+
|   1 | ncert     | cbse   |  250 |   120 |
|   2 | cambridge | cie    |  600 |   570 |
|   3 | ics       | icse   |  250 |   450 |
+-----+-----------+--------+------+-------+
3 rows in set (0.00 sec)
