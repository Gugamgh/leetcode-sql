;WITH Neighbors AS (
	SELECT num,
		LAG(num)  OVER (ORDER BY id) AS prevNum,
		LEAD(num) OVER (ORDER BY id) AS nextNum
	FROM Logs
)

SELECT DISTINCT num AS ConsecutiveNums
FROM Neighbors
WHERE num = prevNum
	AND num = nextNum;