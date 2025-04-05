select count(*) as policy_holder_count
from(SELECT policy_holder_id
FROM callers
group by policy_holder_id
having count(case_id)>=3) as t;