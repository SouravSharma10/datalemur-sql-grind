SELECT EXTRACT(month from submit_date) as mth,
product_id as product,
round(avg(stars),2) as avg_stars
FROM reviews
group by product,mth
order by mth,product;