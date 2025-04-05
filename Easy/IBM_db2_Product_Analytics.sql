with cte as (SELECT e.employee_id,coalesce(count(distinct q.query_id),0) as unique_queries
FROM employees e
left join queries q on q.employee_id=e.employee_id
AND q.query_starttime >= '2023-07-01T00:00:00Z'
      AND q.query_starttime < '2023-10-01T00:00:00Z'
group by e.employee_id)

select unique_queries,count(employee_id) as employee_count
from cte
group by unique_queries
order by unique_queries;

