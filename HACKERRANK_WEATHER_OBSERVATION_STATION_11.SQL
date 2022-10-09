https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=true
Select Distinct CITY from STATION 
Where left(lower(CITY),1) not in ('a','e','i','o','u') or right(lower(CITY),1) not in ('a','e','i','o','u');
-- SELECT DISTINCT CITY FROM STATION WHERE LEFT(CITY,1) NOT IN ('A','E','I','O','U') OR RIGHT(CITY,1) NOT IN ('A','E','I','O','U');
-- Select Distinct CITY from STATION 
-- Where left(lower(CITY),1) not in ('a','e','i','o','u') 
--       or right(lower(CITY),1) not in ('a','e','i','o','u');
SELECT DISTINCT CITY FROM STATION
WHERE NOT (CITY LIKE 'A%'OR CITY LIKE 'E%'OR CITY LIKE 'I%'OR CITY LIKE 'O%'OR CITY LIKE 'U%') OR NOT (CITY LIKE '%a'OR CITY LIKE '%e'OR CITY LIKE '%i' OR CITY LIKE '%o'OR CITY LIKE '%u' );
