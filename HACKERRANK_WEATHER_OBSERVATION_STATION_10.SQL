https://www.hackerrank.com/challenges/weather-observation-station-10/problem?isFullScreen=true
SELECT DISTINCT CITY FROM STATION WHERE right(CITY,1) not in ('a', 'e', 'i', 'o', 'u');
