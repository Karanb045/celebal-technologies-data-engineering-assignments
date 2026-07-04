-- 1. Orders where sales are greater than the average sales (SUBQUERY)
SELECT order_id, customer_id, sales
FROM orders
WHERE sales > (SELECT AVG(sales) FROM orders)
ORDER BY sales DESC;
 
 
-- 2. Highest sales order for each customer (SUBQUERY)
SELECT o.customer_id, o.order_id, o.sales
FROM orders o
WHERE o.sales = (
    SELECT MAX(o2.sales)
    FROM orders o2
    WHERE o2.customer_id = o.customer_id
)
ORDER BY o.sales DESC;
 
 
-- 3. Total sales for each customer (CTE)
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id, total_sales
FROM customer_sales
ORDER BY total_sales DESC;
 
 
-- 4. Customers whose total sales are above average (CTE + SUBQUERY)
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id, total_sales
FROM customer_sales
WHERE total_sales > (SELECT AVG(total_sales) FROM customer_sales)
ORDER BY total_sales DESC;
 
 
-- 5. Rank all customers based on total sales (WINDOW FUNCTION)
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT customer_id,
       total_sales,
       RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
FROM customer_sales;
 
 
-- 6. Row number for each order within a customer (WINDOW FUNCTION + PARTITION BY)
SELECT order_id,
       customer_id,
       sales,
       ROW_NUMBER() OVER (PARTITION BY customer_id ORDER BY sales DESC) AS rn
FROM orders;
 
 
-- 7. Top 3 customers based on total sales (WINDOW FUNCTION)
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
),ranked AS (
    SELECT customer_id,
           total_sales,
           RANK() OVER (ORDER BY total_sales DESC) AS sales_rank
    FROM customer_sales
)
SELECT customer_id, total_sales, sales_rank FROM ranked WHERE sales_rank <= 3;