select app_id,
ROUND(100.0 *SUM(case when event_type='click' Then 1 else 0 END)/
SUM(case when event_Type='impression' then 1 else 0 END),2) as ctr
from events
where timestamp >='2022-01-01' and timestamp < '2023-01-01'
group by app_id;
