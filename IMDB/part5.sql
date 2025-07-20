select director,avg(budget) avgBudget from movies
group  by director order by avgBudget desc