https://www.hackerrank.com/challenges/what-type-of-triangle/problem?isFullScreen=true
Select 
Case
    When  A=B and B=C AND C=A THEN 'Equilateral'
    when  A+B<=C OR B+C<=A OR A+C<=B THEN 'Not A Triangle'
    When  A != B and B!=C and C!=A THEN 'Scalene'
    When  A=B or B=C or C=A THEN 'Isosceles'
end
from TRIANGLES;
