with cte as(
select department_id,name,salary,
dense_rank() over(partition by department_id order by salary desc)
from employee)

SELECT d.department_name,c.name,c.salary
FROM cte c
join department d on c.department_id=d.department_id
where c.dense_Rank<=3
order by d.department_name asc,c.salary desc,c.name asc;