select division,d.department,first_value(e.department) over (partition by division order by d.department)
as first_department_in_division,
last_value(e.department) over (partition by division order by d.department) as last_department_in_division
from employees e join departments d on e.department=d.department