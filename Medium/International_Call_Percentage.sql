with cte as (
SELECT pc.caller_id,pc.receiver_id,pi1.country_id as caller_country,pi2.country_id as receiver_country
FROM phone_calls pc
INNER JOIN phone_info pi1
ON pc.caller_id=pi1.caller_id

INNER JOIN phone_info pi2
ON pc.receiver_id=pi2.caller_id
)

SELECT
round(100.0*SUM(CASE WHEN caller_country!=receiver_country THEN 1 ELSE 0 END)/COUNT(caller_country),1) as international_calls_pct
FROM cte;