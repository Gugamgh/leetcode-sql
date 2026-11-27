;WITH TripsByNonBannedUsers AS (
	SELECT t.id, t.status, t.request_at
	FROM Trips AS t
	INNER JOIN Users AS c
		ON c.users_id = t.client_id
		AND c.banned = 'No'
	INNER JOIN Users AS d
		ON d.users_id = t.driver_id
		AND d.banned = 'No'
    WHERE request_at BETWEEN '2013-10-01' AND '2013-10-03'
)

SELECT request_at AS Day,
    CAST(SUM(CASE WHEN status != 'completed' THEN 1 ELSE 0 END) * 1.0 
    / COUNT(*) AS DECIMAL(10, 2)) AS [Cancellation Rate]
FROM TripsByNonBannedUsers
GROUP BY request_at;