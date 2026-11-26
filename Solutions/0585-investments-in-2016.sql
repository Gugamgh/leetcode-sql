;WITH Attributes AS (
	SELECT tiv_2016,
		COUNT(*) OVER (PARTITION BY tiv_2015) AS same_2015,
		COUNT(*) OVER (PARTITION BY lat, lon) AS same_location
	FROM Insurance
)

SELECT CAST(SUM(tiv_2016) AS DECIMAL(10, 2)) AS tiv_2016
FROM Attributes
WHERE same_2015 > 1
	AND same_location = 1;