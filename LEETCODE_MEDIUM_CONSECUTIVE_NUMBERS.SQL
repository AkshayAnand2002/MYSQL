//https://leetcode.com/problems/consecutive-numbers/description/
SELECT DISTINCT
	t1.num AS ConsecutiveNums
FROM
	Logs AS t1
	JOIN Logs AS t2 ON t1.Id = t2.Id + 1
	AND t1.Num = t2.Num
	JOIN Logs AS t3 ON t1.Id = t3.Id + 2
	AND t1.Num = t3.Num
/*
In this solution, we have used two self joins as we are trying to find numbers that that appear at least three times consecutively. If we want to find at least two numbers consecutively then we will only use one self join to the logs table.
And we are using two join conditions to join the tables together. And the reason for this is that for a series to be consecutive, the id of the second row has to be one greater than the first row ( t1.Id = t2.Id + 1 ) and the id of the third row should be 
two greater than the first row ( t1.Id = t3.Id + 2 ). Think of the Id as days like day1, day2, and day3 or hours and Num as a number of visitors to the website or revenue. And we use used ( t1.Num = t2.Num ) and (t1.Num = t3.Num) because along with the first condition,
this condition also has to be met in order for the numbers to be consecutive. We need the numbers to be the same. So basically we are looking for the number of visitors to a website or revenue, which is the same for the three consecutive days. In the given problem, 1 is 
the only number that appears consecutively for at least three times.
In the solution we also used DISTINCT because there could be another instance where number 1 appears consecutively for at least three times. So, if we don’t use it then in the output, we will get 1 twice. 
If you remove this and make a submission then you will get the wrong result.
*/
