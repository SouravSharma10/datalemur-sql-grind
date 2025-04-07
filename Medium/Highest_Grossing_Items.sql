with cte as(
select category,product,sum(spend) as total_spend,
rank() over(partition by category
order by sum(spend) desc) as ranking
from product_spend
WHERE EXTRACT(YEAR FROM transaction_date) = 2022
group by category,product)

select category,product,total_spend
from cte
where ranking<=2
order by category,ranking;