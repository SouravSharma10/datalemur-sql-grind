with cte as (
select measurement_value,
DATE(measurement_time) as measurement_date,
ROW_NUMBER() over(
partition by DATE(measurement_time)
order by measurement_time) as index_number
from measurements
)

select measurement_date,
SUM(case when index_number%2!=0 then measurement_value else 0 end ) as odd_sum,
SUM(case when index_number%2=0 then measurement_value else 0 end ) as even_sum
from cte
group by measurement_date
order by measurement_date;