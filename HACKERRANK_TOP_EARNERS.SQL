https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
SELECT MAX(MONTHS*SALARY),
COUNT(*) FROM EMPLOYEE
WHERE
MONTHS*SALARY IN 
(SELECT MAX(MONTHS*SALARY) FROM EMPLOYEE);
--------------------------------------------------------------------------------------
SELECT (MONTHS * SALARY), COUNT(MONTHS * SALARY)
FROM EMPLOYEE
GROUP BY (MONTHS * SALARY)
ORDER BY (MONTHS * SALARY) DESC
LIMIT 1;
