SELECT
round(100.0*SUM(CASE WHEN call_category='n/a' or call_category ISNULL THEN 1 ELSE 0 END)/COUNT(*),1) as uncategorised_call_pct
FROM callers;