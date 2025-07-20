SELECT
    e.EmployeeId,
    e.FirstName,
    e.LastName,
    COUNT(DISTINCT c.CustomerId) AS num_customers,
    AVG(customer_spending.total_spent) AS avg_customer_spending
FROM Employee e
JOIN Customer c ON e.EmployeeId = c.SupportRepId
JOIN (
    SELECT i.CustomerId,
           SUM(i.Total) AS total_spent
    FROM Invoice i
    GROUP BY i.CustomerId
) AS customer_spending ON customer_spending.CustomerId = c.CustomerId
GROUP BY e.EmployeeId
HAVING AVG(customer_spending.total_spent) > (
    SELECT AVG(total_spent)
    FROM (
        SELECT i2.CustomerId,
               SUM(i2.Total) AS total_spent
        FROM Invoice i2
        GROUP BY i2.CustomerId
    ) AS avg_sub
)
ORDER BY avg_customer_spending desc;
