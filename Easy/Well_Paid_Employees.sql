select e2.employee_id,e2.NAME
from employee e1
join employee e2 on e1.employee_id=e2.manager_id
where e2.salary>e1.salary;