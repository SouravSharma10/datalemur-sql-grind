with cte as (SELECT
user_id,spend,transaction_date,
ROW_NUMBER() OVER (partition by user_id order by transaction_date)
from transactions)

select user_id,spend,transaction_date
from cte
where row_number=3;