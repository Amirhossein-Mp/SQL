SELECT c.Country,
       COUNT(*) AS num_customers,
       AVG(ci.avg_invoicetotal) avg_avg_invoicetotal
       FROM (SELECT i.CustomerId,
                    AVG(i.Total) avg_invoicetotal
                    FROM invoice i
                    GROUP BY i.CustomerId
            ) AS ci JOIN Customer c ON c.CustomerId = ci.CustomerId
       GROUP BY c.Country
       HAVING COUNT(*) >= 2 AND AVG(ci.avg_invoicetotal) > (SELECT AVG(ci2.avg_invoicetotal)
                                                                   FROM (SELECT i2.CustomerId,
                                                                                AVG(i2.Total) AS avg_invoicetotal
                                                                                FROM invoice i2
                                                                                GROUP BY i2.CustomerId
                                                                        ) AS ci2
                                                           )
ORDER BY avg_avg_invoicetotal DESC;