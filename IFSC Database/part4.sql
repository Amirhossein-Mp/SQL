SELECT
    a.athlete_id,
    a.firstname,
    a.lastname,
    COUNT(DISTINCT e.discipline) AS gold_disciplines_count
FROM entries e
JOIN athletes a ON e.athlete_id = a.athlete_id
WHERE e.final_rank = 1
GROUP BY a.athlete_id
HAVING COUNT(DISTINCT e.discipline) > 1;
