WITH
yearly_counts AS (
    SELECT
        l.book_id,
        COUNT(*) AS cnt_year
    FROM loans l
    WHERE EXTRACT(YEAR FROM l.loan_date) = EXTRACT(YEAR FROM CURRENT_DATE)
    GROUP BY l.book_id
),
max_yearly AS (
    SELECT MAX(cnt_year) AS max_cnt
    FROM yearly_counts
),
prev_month_counts AS (
    SELECT
        l.book_id,
        COUNT(*) AS cnt_prev_month
    FROM loans l
    WHERE l.loan_date >= (date_trunc('month', CURRENT_DATE) - INTERVAL '1 month')
      AND l.loan_date <  date_trunc('month', CURRENT_DATE)
    GROUP BY l.book_id
)
SELECT
    b.book_id,
    b.title,
    yc.cnt_year AS loans_this_year
FROM yearly_counts yc
JOIN max_yearly my
    ON yc.cnt_year = my.max_cnt
LEFT JOIN prev_month_counts pmc
    ON yc.book_id = pmc.book_id
JOIN books b
    ON b.book_id = yc.book_id
WHERE COALESCE(pmc.cnt_prev_month, 0) = 0
ORDER BY yc.cnt_year DESC;