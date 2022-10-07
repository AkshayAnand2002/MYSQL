https://www.hackerrank.com/challenges/the-blunder/problem?isFullScreen=true
SELECT ROUND(AVG(SALARY))-ROUND(AVG(REPLACE(SALARY,"0",""))) FROM EMPLOYEES; 
