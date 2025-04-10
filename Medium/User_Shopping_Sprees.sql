SELECT
  DISTINCT t1.user_id
FROM transactions t1
inner join transactions t2
 ON t2.transaction_date=t1.transaction_date+INTERVAL '1 day'

inner join transactions t3
 on t3.transaction_date=t1.transaction_date+INTERVAL '2 day'
order by t1.user_id;