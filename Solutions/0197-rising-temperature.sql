SELECT w1.id
FROM Weather AS w1
INNER JOIN Weather AS w2
	ON w1.temperature > w2.temperature
	AND w1.recordDate = DATEADD(day, 1, w2.recordDate);