;WITH Salaries AS (
	SELECT salary,
		DENSE_RANK() OVER (ORDER BY salary DESC) AS rnk
	FROM Employee
)

SELECT MAX(salary) AS SecondHighestSalary
FROM Salaries
WHERE rnk = 2;