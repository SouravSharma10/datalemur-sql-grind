SELECT
  order_id,
  COALESCE(
  CASE
  WHEN order_id%2!=0 THEN LEAD(item) OVER(ORDER BY order_id)
  WHEN order_id%2=0 THEN LAG(item) OVER(ORDER BY order_id)
  END,item)
FROM orders;