//https://leetcode.com/problems/department-highest-salary/description/
/*
first identify highest salary by
SELECT departmentId,MAX(salary) FROM Employee GROUP BY departmentId

Then JOIN both table by
SELECT Department.name AS Department ,Employee.name AS Employee, Employee.salary FROM Department JOIN Employee ON Employee.departmentId=Department.id

Then put Condition by
WHERE(departmentId, salary) IN (SELECT departmentId,MAX(salary) FROM Employee GROUP BY departmentId) ;
*/
SELECT Department.name AS Department ,Employee.name AS Employee, Employee.salary
FROM Department  JOIN Employee  ON Employee.departmentId=Department.id 
WHERE(departmentId, salary) IN
(SELECT departmentId,MAX(salary) FROM Employee GROUP BY departmentId) ;
