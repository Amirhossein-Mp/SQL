This directory is dedicated for queries on History of Baseball database. You can download the database via this link: [Departments](https://uupload.ir/view/insert_dataset_7xpq.sql/)

Query 1 is for this demand:<br/>
Create a middle table using the WITH clause and divide the employees into 5 equal groups based on salary using the NTILE function from Window Function. Then use GROUP BY and AVG to calculate the average salary of each group.<br/>

Query 2 is for this demand:<br/>
Using the SUM function from Window Function and utilizing PARTITION BY and ORDER BY, calculate the total salary (running_total) of each department based on the employee's hire date.<br/>

Query 3 is for this demand:<br/>
Using a subquery and JOIN, calculate the average salary for each department and then find employees whose salaries are higher than the average salary for their department.<br/>

Query 4 is for this demand:<br/>
Using the FIRST_VALUE and LAST_VALUE functions from Window Functions, find the first and last department names in alphabetical order for each division.<br/>

Query 5 is for this demand:<br/>
Using GROUP BY and the RANK function from the Window Function, create a Materialized View named mv_top_customers that ranks customers based on the number of purchases they make. Then, with a separate query, retrieve only the top three customers from this view.<br/>

Query 6 is for this demand:<br/>
Using a LATERAL JOIN, find the product category from which each customer has made the most purchases. In the subquery associated with the LATERAL clause, use a combination of GROUP BY to group purchases by product category, ORDER BY to sort the categories by purchase count in descending order, and LIMIT to restrict the results to the top category. The goal is to produce a list of customers along with their most preferred category (in terms of number of purchases).<br/>
