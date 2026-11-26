;WITH EmployeeSalaries AS (
	SELECT d.name AS Department, e.name AS Employee, e.salary,
		DENSE_RANK() OVER (PARTITION BY d.id
						   ORDER BY e.salary DESC) AS rnk
	FROM Employee AS e
	INNER JOIN Department AS d
		ON e.departmentId = d.id
)

SELECT Department, Employee, salary
FROM EmployeeSalaries
WHERE rnk <= 3;