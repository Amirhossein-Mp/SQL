SELECT
    c.CustomerId,
    c.FirstName,
    c.LastName,
    g.Name AS favorite_genre,
    SUM(il.Quantity * il.UnitPrice) AS total_spent_on_favorite
FROM Customer c
JOIN Invoice i ON c.CustomerId = i.CustomerId
JOIN InvoiceLine il ON i.InvoiceId = il.InvoiceId
JOIN Track t ON il.TrackId = t.TrackId
JOIN Genre g ON t.GenreId = g.GenreId
WHERE g.GenreId IN (
    SELECT sub.GenreId
    FROM (
        SELECT
            c2.CustomerId,
            g2.GenreId,
            COUNT(*) AS pcount,
            RANK() OVER (PARTITION BY c2.CustomerId ORDER BY COUNT(*) DESC) AS rnk
        FROM Customer c2
        JOIN Invoice i2 ON c2.CustomerId = i2.CustomerId
        JOIN InvoiceLine il2 ON i2.InvoiceId = il2.InvoiceId
        JOIN Track t2 ON il2.TrackId = t2.TrackId
        JOIN Genre g2 ON t2.GenreId = g2.GenreId
        GROUP BY c2.CustomerId, g2.GenreId
    ) AS sub
    WHERE c.CustomerId = sub.CustomerId AND sub.rnk = 1
)
GROUP BY c.CustomerId, c.FirstName, c.LastName, g.Name
HAVING SUM(il.Quantity * il.UnitPrice) > (
    SELECT MAX(genre_spent)
    FROM (
        SELECT SUM(il2.Quantity * il2.UnitPrice) AS genre_spent
        FROM Invoice i2
        JOIN InvoiceLine il2 ON i2.InvoiceId = il2.InvoiceId
        JOIN Track t2 ON il2.TrackId = t2.TrackId
        JOIN Genre g2 ON t2.GenreId = g2.GenreId
        WHERE g2.Name != g.Name AND i2.CustomerId = c.CustomerId
        GROUP BY g2.Name
    ) AS other_genre_spending
)
ORDER BY total_spent_on_favorite DESC;
