https://www.hackerrank.com/challenges/weather-observation-station-11/problem?isFullScreen=true
Select Distinct CITY from STATION 
Where left(lower(CITY),1) not in ('a','e','i','o','u') or right(lower(CITY),1) not in ('a','e','i','o','u');
