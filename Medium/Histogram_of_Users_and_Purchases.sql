with user_data as (
SELECT transaction_date,user_id,product_id,
RANK() OVER(PARTITION BY user_id order by transaction_date desc)
from user_transactions
)

select transaction_date,user_id,count(product_id) as purchase_count
from user_data
where rank=1
group by transaction_date,user_id
order by transaction_date;
