-- ---------------------
--  1. View: Active_loans
-- ---------------------
CREATE OR REPLACE VIEW Active_loans AS
SELECT
    m.first_name,
    m.last_name,
    b.title      AS book_title,
    b.author     AS book_author,
    l.loan_date  AS loan_date,
    l.due_date   AS due_date
FROM loans l
JOIN members m
  ON l.member_id = m.member_id
JOIN books b
  ON l.book_id = b.book_id
WHERE l.return_date IS NULL;


-- ---------------------
--  2. View: Popular_books
-- ---------------------
CREATE OR REPLACE VIEW Popular_books AS
SELECT
    b.book_id,
    b.title         AS book_title,
    b.author        AS book_author,
    COUNT(l.load_id) AS times_borrowed
FROM books b
LEFT JOIN loans l
  ON b.book_id = l.book_id
GROUP BY
    b.book_id,
    b.title,
    b.author;
