with cte as (
SELECT c.*,p.product_category
FROM customer_contracts c
left join products p on c.product_id=p.product_id)

select customer_id
from cte
group by customer_id
having count(distinct product_category)=(select count(distinct product_category) from products);