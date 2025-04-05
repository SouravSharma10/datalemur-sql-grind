SELECT user_id
FROM emails e
join texts t on e.email_id=t.email_id
where t.signup_action='Confirmed' and date(action_date)-date(e.signup_date)=1;