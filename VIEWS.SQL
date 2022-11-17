------------------------------------------------------------------------------------------------------------------------
1. Execute arena.sql
The tables created have the following schemas (with the primary keys underlined):
Activities (ActivityID, ActivityName)
Performers (PerformerID, PerformerName, Street, City, State, Zip, ActivityID)
Arenas (ArenaID, ArenaName, City, ArenaCapacity)
Concerts (PerformerID, ArenaID, ConcertDate, TicketPrice)
2. Write SQL queries to accomplish the following tasks.
a) Write a SQL query to list all the performers’ name and the name of the activity the
performer is involved in.
b) Write a SQL statement to create a view called Act_perf based on the query in Exercise 1.
c) Unlike a query, a virtual table or view can be used as if it is a table in the database. Now
write a SQL query against the view as if it was a table: select everything from the view.
NOTE: The view does not store any data. The data is stored just in the tables used in the
definition of view. When a query that uses Act_perf is executed, the system first evaluates the
query that defines Act_perf, and then performs further evaluation of the query that uses
Act_perf.
3. To demonstrate this, do the following:
a) Insert a row in Performers table (use INSERT INTO ... VALUES ...).
b) Execute SELECT * FROM Act_perf again.
Did the results change? Why?
4. Updates on views
a) Run the following query:
UPDATE Act_perf
SET PerformerName = 'Harry Chapinn'
WHERE PerformerName = 'Harry Chapin'
b) Does the query succeed? Why?
c) Execute “SELECT * FROM Performers” and check whether the name of Harry Chapin
was changed to Harry Chapinn.
NOTE: One reason to use the views: Hide complexity and simplify queries when frequently
using the results of a complex query.
5. Create a view called Perf_Income to show the name of the performer, the arena name, the
date of the concert, and total_income. total_income represents the total payment received by
a performer for a concert and is based on the fraction of ticket price that goes to the
performer, and the total number of tickets sold. We assume that the artist receives 10% of
the face value of each ticket and the number of tickets sold is always considered to be 80%
of the arena capacity.
SQL has a keyword “LIMIT n” that allows you to display only the first n rows in the result
of a select query. For example “SELECT * FROM Performers LIMIT 5” will display the
first 5 rows from Performers table.

6. Write the SQL query on the Perf_Income view to show the top 8 concerts based on total
income in order of highest income to lowest income.
7. Write the SQL query to achieve the same result as above, but without using the Perf_Income
view (you can still use TOP n). This query should look more complicated than the query in
the previous exercise.
8. Write the SQL query to find the total money made by all of the artists during all the concerts
(use the view).
9. Write the SQL statement (use the view) to update the total_income for ‘Jimmy Buffett’ to be
$100,000. Run the query.
Does the query succeed? Why?
------------------------------------------------------------------------------------------------------------------------
mysql> create database arena;
Query OK, 1 row affected (0.12 sec)

mysql> use arena
Database changed
mysql> source /home/b4/Desktop/arena.sql
Query OK, 0 rows affected (0.49 sec)

Query OK, 1 row affected (0.11 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.09 sec)

Query OK, 1 row affected (0.18 sec)

Query OK, 1 row affected (0.21 sec)

Query OK, 1 row affected (0.17 sec)

Query OK, 0 rows affected (1.24 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.16 sec)

Query OK, 1 row affected (0.16 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 0 rows affected (0.55 sec)

Query OK, 1 row affected (0.07 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.12 sec)

Query OK, 1 row affected (0.06 sec)

Query OK, 1 row affected (0.06 sec)

Query OK, 1 row affected (0.09 sec)

Query OK, 1 row affected (0.07 sec)

Query OK, 1 row affected (0.14 sec)

Query OK, 0 rows affected (0.60 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.07 sec)

Query OK, 1 row affected (0.11 sec)

Query OK, 1 row affected (0.14 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.14 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.08 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

Query OK, 1 row affected (0.10 sec)

mysql>
mysql> select Performers.PerformerName,Activities.ActivityName FROM Activities j
oin Performers on Activities.ActivityID=Performers.ActivityID;
+---------------+-------------------------+
| PerformerName | ActivityName            |
+---------------+-------------------------+
| Harry Chapin  | Doctors without Borders |
| Billy Joel    | Greenpeace              |
| James Taylor  | Music in Schools        |
| Harry Connick | Save the Whales         |
| Tony Bennett  | USO for Troops          |
| Jimmy Buffett | Doctors without Borders |
+---------------+-------------------------+
6 rows in set (0.00 sec)
mysql> create view Act_perf as select Performers.PerformerName,Activities.Activi
tyName FROM Activities join Performers on Activities.ActivityID=Performers.Activ
ityID;
Query OK, 0 rows affected (0.14 sec)

mysql> select * from Act_perf;
+---------------+-------------------------+
| PerformerName | ActivityName            |
+---------------+-------------------------+
| Harry Chapin  | Doctors without Borders |
| Billy Joel    | Greenpeace              |
| James Taylor  | Music in Schools        |
| Harry Connick | Save the Whales         |
| Tony Bennett  | USO for Troops          |
| Jimmy Buffett | Doctors without Borders |
+---------------+-------------------------+
6 rows in set (0.00 sec)
mysql> insert into Performers values(11,"abc","def","jaipur","jp","12345",7);
Query OK, 1 row affected (0.08 sec)

mysql> select * from Act_perf;
+---------------+-------------------------+
| PerformerName | ActivityName            |
+---------------+-------------------------+
| Harry Chapin  | Doctors without Borders |
| Billy Joel    | Greenpeace              |
| James Taylor  | Music in Schools        |
| Harry Connick | Save the Whales         |
| Tony Bennett  | USO for Troops          |
| Jimmy Buffett | Doctors without Borders |
| abc           | USO for Troops          |
+---------------+-------------------------+
7 rows in set (0.00 sec)
mysql> update Act_perf set PerformerName='Harry Chapnin' where PerformerName='Harry Chapin';
Query OK, 1 row affected (0.07 sec)
Rows matched: 1  Changed: 1  Warnings: 0

mysql> select * from Act_perf;
+---------------+-------------------------+
| PerformerName | ActivityName            |
+---------------+-------------------------+
| Harry Chapnin | Doctors without Borders |
| Billy Joel    | Greenpeace              |
| James Taylor  | Music in Schools        |
| Harry Connick | Save the Whales         |
| Tony Bennett  | USO for Troops          |
| Jimmy Buffett | Doctors without Borders |
| abc           | USO for Troops          |
+---------------+-------------------------+
7 rows in set (0.00 sec)
mysql> create view Perf_Income as select PerformerName,ArenaName,ConcertDate,0.1*TicketPrice*0.8*ArenaCapacity as total_income from Performers join Arenas join Concerts on Performers.PerformerID=Concerts.PerformerID and Concerts.ArenaID=Arenas.ArenaID;
Query OK, 0 rows affected (0.12 sec)

mysql> select * from Perf_Income;
+---------------+---------------------+-------------+--------------+
| PerformerName | ArenaName           | ConcertDate | total_income |
+---------------+---------------------+-------------+--------------+
| Harry Chapnin | Civic Arena         | 2005-09-17  |     46592.00 |
| Harry Chapnin | Radio City Music    | 2005-06-12  |      8800.00 |
| Harry Chapnin | Charlotte Coliseum  | 2005-09-11  |     48000.00 |
| Harry Chapnin | Roanoke Pavillion   | 2005-09-21  |     16376.00 |
| Billy Joel    | Carolina Coliseum   | 2005-08-11  |     20160.00 |
| Billy Joel    | Radio City Music    | 2005-09-18  |      9152.00 |
| Billy Joel    | Riverfront Coliseum | 2005-09-21  |     36960.00 |
| Billy Joel    | Roanoke Pavillion   | 2005-09-11  |     22072.00 |
| James Taylor  | Civic Arena         | 2005-09-11  |     32032.00 |
| James Taylor  | Carolina Coliseum   | 2005-09-16  |     20160.00 |
| James Taylor  | Radio City Music    | 2005-09-01  |     10208.00 |
| Harry Connick | Radio City Music    | 2005-09-11  |     10912.00 |
| Harry Connick | Riverfront Coliseum | 2005-09-17  |     40320.00 |
| Harry Connick | Charlotte Coliseum  | 2005-09-18  |     32640.00 |
| Tony Bennett  | Carolina Coliseum   | 2005-09-11  |     21120.00 |
| Tony Bennett  | Radio City Music    | 2005-09-18  |     10912.00 |
| Tony Bennett  | Charlotte Coliseum  | 2005-09-01  |     48000.00 |
| Jimmy Buffett | Carolina Coliseum   | 2005-09-11  |     20160.00 |
| Jimmy Buffett | Radio City Music    | 2005-09-18  |     10912.00 |
| Jimmy Buffett | Charlotte Coliseum  | 2005-09-16  |     48000.00 |
| Jimmy Buffett | Roanoke Pavillion   | 2005-09-01  |     19936.00 |
+---------------+---------------------+-------------+--------------+
21 rows in set (0.00 sec)
mysql> select * from Perf_Income order by total_income limit 8;
+---------------+-------------------+-------------+--------------+
| PerformerName | ArenaName         | ConcertDate | total_income |
+---------------+-------------------+-------------+--------------+
| Harry Chapnin | Radio City Music  | 2005-06-12  |      8800.00 |
| Billy Joel    | Radio City Music  | 2005-09-18  |      9152.00 |
| James Taylor  | Radio City Music  | 2005-09-01  |     10208.00 |
| Jimmy Buffett | Radio City Music  | 2005-09-18  |     10912.00 |
| Harry Connick | Radio City Music  | 2005-09-11  |     10912.00 |
| Tony Bennett  | Radio City Music  | 2005-09-18  |     10912.00 |
| Harry Chapnin | Roanoke Pavillion | 2005-09-21  |     16376.00 |
| Jimmy Buffett | Roanoke Pavillion | 2005-09-01  |     19936.00 |
+---------------+-------------------+-------------+--------------+
8 rows in set (0.00 sec)

mysql> select * from Perf_Income order by total_income desc limit 8;
+---------------+---------------------+-------------+--------------+
| PerformerName | ArenaName           | ConcertDate | total_income |
+---------------+---------------------+-------------+--------------+
| Harry Chapnin | Charlotte Coliseum  | 2005-09-11  |     48000.00 |
| Tony Bennett  | Charlotte Coliseum  | 2005-09-01  |     48000.00 |
| Jimmy Buffett | Charlotte Coliseum  | 2005-09-16  |     48000.00 |
| Harry Chapnin | Civic Arena         | 2005-09-17  |     46592.00 |
| Harry Connick | Riverfront Coliseum | 2005-09-17  |     40320.00 |
| Billy Joel    | Riverfront Coliseum | 2005-09-21  |     36960.00 |
| Harry Connick | Charlotte Coliseum  | 2005-09-18  |     32640.00 |
| James Taylor  | Civic Arena         | 2005-09-11  |     32032.00 |
+---------------+---------------------+-------------+--------------+
8 rows in set (0.00 sec)
mysql> select PerformerName,ArenaName,ConcertDate,0.1*TicketPrice*0.8*ArenaCapacity as total_income from Performers join Arenas join Concerts on Performers.PerformerID=Concerts.PerformerID and Concerts.ArenaID=Arenas.ArenaID order by total_income desc limit 8;
+---------------+---------------------+-------------+--------------+
| PerformerName | ArenaName           | ConcertDate | total_income |
+---------------+---------------------+-------------+--------------+
| Harry Chapnin | Charlotte Coliseum  | 2005-09-11  |     48000.00 |
| Tony Bennett  | Charlotte Coliseum  | 2005-09-01  |     48000.00 |
| Jimmy Buffett | Charlotte Coliseum  | 2005-09-16  |     48000.00 |
| Harry Chapnin | Civic Arena         | 2005-09-17  |     46592.00 |
| Harry Connick | Riverfront Coliseum | 2005-09-17  |     40320.00 |
| Billy Joel    | Riverfront Coliseum | 2005-09-21  |     36960.00 |
| Harry Connick | Charlotte Coliseum  | 2005-09-18  |     32640.00 |
| James Taylor  | Civic Arena         | 2005-09-11  |     32032.00 |
+---------------+---------------------+-------------+--------------+
8 rows in set (0.00 sec)
mysql> select PerformerName,sum(total_income) from Perf_Income group by PerformerName;
+---------------+-------------------+
| PerformerName | sum(total_income) |
+---------------+-------------------+
| Harry Chapnin |         119768.00 |
| Billy Joel    |          88344.00 |
| James Taylor  |          62400.00 |
| Harry Connick |          83872.00 |
| Tony Bennett  |          80032.00 |
| Jimmy Buffett |          99008.00 |
+---------------+-------------------+
6 rows in set (0.00 sec)
mysql> update Perf_Income set total_income=100000 where PerformerName="Jimmy Buffet";
ERROR 1348 (HY000): Column 'total_income' is not updatable
