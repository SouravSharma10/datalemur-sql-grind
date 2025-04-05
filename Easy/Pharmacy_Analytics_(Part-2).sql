SELECT
manufacturer,
count(drug) as drug_count,
abs(SUM(total_sales-cogs)) as total_loss
FROM pharmacy_sales
where total_sales-cogs<=0
group by manufacturer
order by total_loss desc;