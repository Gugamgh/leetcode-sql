;WITH FirstLogin AS (
    SELECT player_id, MIN(event_date) AS first_date
    FROM Activity
    GROUP BY player_id
)

SELECT CAST(COUNT(a.player_id) * 1.0 / COUNT(*) AS DECIMAL(10, 2)) AS fraction
FROM FirstLogin AS f
LEFT JOIN Activity AS a
    ON f.player_id = a.player_id
    AND a.event_date = DATEADD(day, 1, f.first_date);