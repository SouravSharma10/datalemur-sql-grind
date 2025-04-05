with tweet_Data as (SELECT user_id,count(msg) as tweet_count_per_user
from tweets
where tweet_date BETWEEN '2022-01-01' and '2022-12-31'
group by user_id)

select tweet_count_per_user as tweet_bucket,count(user_id) as user_nums
from tweet_Data
group by tweet_count_per_user;