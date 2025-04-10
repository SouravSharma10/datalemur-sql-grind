WITH monthly_open AS (
  SELECT
    ticker,
    TO_CHAR(date, 'Mon-YYYY') AS month_year,
    open,
    date
  FROM stock_prices
),

ranked_opens AS (
  SELECT *,
         RANK() OVER(PARTITION BY ticker ORDER BY open DESC) AS high_rank,
         RANK() OVER(PARTITION BY ticker ORDER BY open ASC) AS low_rank
  FROM monthly_open
)

SELECT
  ticker,
  MAX(CASE WHEN high_rank = 1 THEN month_year END) AS highest_mth,
  MAX(CASE WHEN high_rank = 1 THEN open END) AS highest_open,
  MAX(CASE WHEN low_rank = 1 THEN month_year END) AS lowest_mth,
  MAX(CASE WHEN low_rank = 1 THEN open END) AS lowest_open
FROM ranked_opens
GROUP BY ticker
ORDER BY ticker;