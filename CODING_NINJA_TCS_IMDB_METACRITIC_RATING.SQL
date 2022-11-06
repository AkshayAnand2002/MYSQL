//https://www.codingninjas.com/codestudio/problems/imdb_1755910?topList=top-100-sql-problems&leftPanelTab=0
-- Schema::
-- IMDB:     Movie_id, Title, Rating, MetaCritic, Budget, Runtime,..so on
-- earning:     Movie_id, Domestic, Worldwide
-- genre:     Movie_id, genre
SELECT
IMDB.Title,IMDB.Rating
FROM
IMDB
INNER JOIN earning
ON IMDB.Movie_id=earning.Movie_id
WHERE
Title LIKE '%(2012)%'
AND
Domestic> POWER(10,8)
AND 
Metacritic>60;
