SELECT p1.page_id
from pages p1
left join page_likes p2 on p1.page_id=p2.page_id
where p2.user_id is NULL
order by page_id ASC;