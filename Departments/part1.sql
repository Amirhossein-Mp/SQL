with intermediate as (
    select *,ntile(5)over(order by salary) as division from employees
)
select division as rank_of_salary,avg(salary) as avg_SALARY from intermediate group by division order by rank_of_salary asc