https://www.hackerrank.com/challenges/average-population-of-each-continent/problem?isFullScreen=true
SELECT COUNTRY.Continent,FLOOR(AVG(CITY.Population))
FROM CITY JOIN COUNTRY
ON CITY.COUNTRYCODE=COUNTRY.CODE
GROUP BY COUNTRY.Continent;
