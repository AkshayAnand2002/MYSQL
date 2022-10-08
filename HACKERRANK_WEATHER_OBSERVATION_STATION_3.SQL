//https://www.hackerrank.com/challenges/weather-observation-station-3/problem?isFullScreen=true
select distinct city 
from station 
where mod (id, 2) = 0 
order by city;
