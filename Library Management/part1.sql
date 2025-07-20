CREATE OR REPLACE FUNCTION calculate_lateness()
RETURNS TABLE(
    member_id      INTEGER,
    member_name    TEXT,
    total_debt     BIGINT
)
LANGUAGE SQL
AS $$
    SELECT
        member_id,
        member_name,
        total_debt
    FROM (
        SELECT
            l.member_id,
            m.first_name || ' ' || m.last_name AS member_name,


            SUM(
                GREATEST(
                    CASE

                        WHEN l.return_date IS NOT NULL
                             AND l.return_date > l.due_date
                        THEN (l.return_date - l.due_date)


                        WHEN l.return_date IS NULL
                             AND CURRENT_DATE > l.due_date
                        THEN (CURRENT_DATE - l.due_date)


                        ELSE 0
                    END,
                0)
                * 5000
            ) OVER (PARTITION BY l.member_id) AS total_debt,


            ROW_NUMBER() OVER (PARTITION BY l.member_id ORDER BY l.member_id) AS rn
        FROM loans l
        JOIN members m ON m.member_id = l.member_id
    ) AS sub
    WHERE rn = 1
    ORDER BY total_debt DESC;
$$;
