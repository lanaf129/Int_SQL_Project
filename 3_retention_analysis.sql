WITH customer_last_purchase AS ( 
	SELECT
		customerkey,
		cleaned_name,
		orderdate,
		ROW_NUMBER() OVER (PARTITION BY customerkey ORDER BY orderdate DESC) AS rn,
		first_purchase_date,
		cohort_year
	FROM 
		cohort_analysis
		),

	churned_customers AS (SELECT 
		customerkey,
		cleaned_name,
		orderdate AS last_purchase_date,
		first_purchase_date,
		CASE 
			WHEN orderdate < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months' THEN 'Churned'
			ELSE 'Active'
		END AS customer_status,
		cohort_year
	FROM
		customer_last_purchase 
	WHERE 	
		rn = 1
		AND first_purchase_date < (SELECT MAX(orderdate) FROM sales) - INTERVAL '6 months')
		)
		
SELECT
	cohort_year,
	customer_status,
	COUNT(customerkey) AS num_customers,
	SUM(COUNT(customerkey)) OVER (PARTITION BY cohort_year) AS total_customers,
	ROUND(COUNT(customerkey)*100/SUM(COUNT(customerkey)) OVER (PARTITION BY cohort_year), 2) AS num_customers_pct
 FROM 
	churned_customers 
GROUP BY
	customer_status,
	cohort_year