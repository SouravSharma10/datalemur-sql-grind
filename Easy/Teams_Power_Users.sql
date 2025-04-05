SELECT sender_id,count(*) as message_count
FROM messages
where sent_Date >= '2022-08-01' and sent_Date < '2022-09-01'
group by sender_id
order by count(*) DESC
limit 2;