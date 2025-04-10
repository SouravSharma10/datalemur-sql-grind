with initial_month_data as(
SELECT card_name,issued_amount,
ROW_NUMBER() OVER(PARTITION BY card_name order by issue_year,issue_month) as initial_year_month
from monthly_cards_issued
)

select card_name,issued_amount
from initial_month_data
where initial_year_month=1
order by issued_amount desc;