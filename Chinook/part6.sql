WITH RECURSIVE Reporting AS (
    SELECT e.ReportsTo AS managerid,
           e.EmployeeId AS employeeid
           FROM Employee e
           WHERE e.ReportsTo IS NOT NULL
           UNION ALL

           SELECT r.managerid,
                  e.EmployeeId
                  FROM Employee e JOIN Reporting r ON e.ReportsTo = r.employeeid

)
SELECT r.managerid AS EmployeeId,
       (SELECT CONCAT(e.FirstName, ' ', e.LastName)
        FROM Employee e
        WHERE e.EmployeeId = r.managerid
       ) AS ManagerName,
       COUNT(*) AS total_managed
       FROM Reporting r
       GROUP BY r.managerid
       ORDER BY total_managed DESC;