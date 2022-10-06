https://www.hackerrank.com/challenges/earnings-of-employees/problem?isFullScreen=true
/*
Enter your query here.
*/
SELECT MAX(MONTHS*SALARY),
COUNT(*) FROM EMPLOYEE
WHERE
MONTHS*SALARY IN 
(SELECT MAX(MONTHS*SALARY) FROM EMPLOYEE);
