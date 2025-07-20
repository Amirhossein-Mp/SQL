select first_name,hire_date,department,salary,sum(salary)over(partition by department
order by hire_date
    rows between unbounded preceding and current row ) from employees