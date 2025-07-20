select employee_id,first_name,e.department,salary,round(AVG_SALARY,2) from employees e join
(select d.department, avg(salary) as AVG_SALARY from departments d join employees e on d.department=e.department
group by d.department) d on e.department=d.department where salary >d.AVG_SALARY