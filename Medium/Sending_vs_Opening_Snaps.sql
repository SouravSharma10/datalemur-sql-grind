SELECT ag.age_bucket,
round(100.0*sum(case when ac.activity_type='send' then time_spent else 0 end)/sum(ac.time_spent),2) as send_perc,
round(100.0*sum(case when ac.activity_type='open' then time_spent else 0 end)/sum(ac.time_spent),2) as open_perc
from age_breakdown ag
join activities ac on ag.user_id=ac.user_id
where ac.activity_type in ('send','open')
group by ag.age_bucket;