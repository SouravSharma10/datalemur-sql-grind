select count(distinct company_id) as duplicate_companies
from(SELECT company_id
FROM job_listings
group by company_id,title,description
having count(*)>1) as t;