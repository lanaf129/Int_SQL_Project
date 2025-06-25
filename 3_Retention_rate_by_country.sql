WITH first_order_date AS (
  SELECT 
    customerkey,
    MIN(orderdate) AS first_order
  FROM sales
  GROUP BY customerkey
),
last_order_date AS (
  SELECT 
    customerkey,
    MAX(orderdate) AS last_order
  FROM sales
  GROUP BY customerkey
),
cohort_data AS (
  SELECT 
    c.customerkey,
    c.countryfull::text AS country,
    EXTRACT(year FROM fod.first_order::date) AS cohort_year,
    lod.last_order
  FROM customer c
  JOIN first_order_date fod ON fod.customerkey = c.customerkey
  JOIN last_order_date lod ON lod.customerkey = c.customerkey
),
global_max_date AS (
  SELECT MAX(orderdate) AS max_date FROM sales
)

SELECT
  cd.country,
  cd.cohort_year,
  COUNT(*) AS total_customers,
  COUNT(*) FILTER (WHERE cd.last_order < gmd.max_date - INTERVAL '6 months') AS churned_customers,
  ROUND( 100 *
    COUNT(*) FILTER (WHERE cd.last_order < gmd.max_date - INTERVAL '6 months')::NUMERIC 
    / COUNT(*), 
    3
  ) AS churn_ratio
FROM cohort_data cd
JOIN global_max_date gmd ON TRUE
GROUP BY cd.country, cd.cohort_year
ORDER BY cd.country, cd.cohort_year;
