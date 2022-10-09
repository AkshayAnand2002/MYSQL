//https://www.hackerrank.com/challenges/the-pads/problem?isFullScreen=true
SELECT CONCAT
(NAME,"(",LEFT(OCCUPATION,1),")") FROM OCCUPATIONS
ORDER BY NAME ASC;
SELECT CONCAT
("There are a total of ",COUNT(occupation)," ",LOWER(occupation),"s.")
FROM OCCUPATIONS
GROUP BY OCCUPATION
ORDER BY COUNT(occupation),occupation;
