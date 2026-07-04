WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
),
ranked_customers AS (
    SELECT customer_id,
           total_sales,
           RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
)
SELECT c.customer_name,
       r.total_sales,
       r.sales_rank
FROM ranked_customers r
JOIN customers c ON c.customer_id = r.customer_id
ORDER BY r.sales_rank;