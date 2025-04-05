SELECT u.city,count(t.order_id) as total_orders
from users u
join trades t on u.user_id=t.user_id
where status='Completed'
group by u.city
order by total_orders DESC
limit 3;
