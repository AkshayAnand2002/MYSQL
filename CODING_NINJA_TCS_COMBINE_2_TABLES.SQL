//https://www.codingninjas.com/codestudio/problems/combine-two-tables_2110759?topList=top-100-sql-problems&leftPanelTab=0
SELECT FirstName,LastName,City,State
FROM
Person LEFT JOIN Address
ON Person.PersonId=Address.PersonId;
