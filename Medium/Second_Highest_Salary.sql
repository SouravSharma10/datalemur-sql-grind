with cte as(
select salary,
dense_Rank() over (order by salary desc) as rank_salary
from employee)

select salary as second_highest_salary
from cte
where rank_salary=2;