SELECT
    t.TrackId,
    t.Name,
    COUNT(DISTINCT i.CustomerId) AS num_customers,
    SUM(il.Quantity * il.UnitPrice) AS total_revenue
FROM Track t
JOIN InvoiceLine il ON il.TrackId = t.TrackId
JOIN Invoice i ON il.InvoiceId = i.InvoiceId
WHERE i.CustomerId IN (
    SELECT c.CustomerId
    FROM Customer c
    JOIN Invoice i2 ON c.CustomerId = i2.CustomerId
    GROUP BY c.CustomerId
    HAVING SUM(i2.Total) > (
        SELECT AVG(total_spent)
        FROM (
            SELECT SUM(i3.Total) AS total_spent
            FROM Invoice i3
            GROUP BY i3.CustomerId
        ) AS avg_sub
    )
)
GROUP BY t.TrackId, t.Name
HAVING COUNT(DISTINCT i.CustomerId) > 0
ORDER BY num_customers DESC;
