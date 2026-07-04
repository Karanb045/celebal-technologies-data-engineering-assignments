-- 1. Top 5 customers
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_name, cs.total_sales
FROM customer_sales cs
JOIN customers c ON c.customer_id = cs.customer_id
ORDER BY cs.total_sales DESC
LIMIT 5;
 
 
-- 2. Bottom 5 customers
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_name, cs.total_sales
FROM customer_sales cs
JOIN customers c ON c.customer_id = cs.customer_id
ORDER BY cs.total_sales ASC
LIMIT 5;
 
 
-- 3. Customers who made only one order
SELECT c.customer_name, COUNT(DISTINCT o.order_id) AS order_count
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.customer_name
HAVING COUNT(DISTINCT o.order_id) = 1;
 
 
-- 4. Customers with above-average sales
WITH customer_sales AS (
    SELECT customer_id, SUM(sales) AS total_sales
    FROM orders
    GROUP BY customer_id
)
SELECT c.customer_name, cs.total_sales
FROM customer_sales cs
JOIN customers c ON c.customer_id = cs.customer_id
WHERE cs.total_sales > (SELECT AVG(total_sales) FROM customer_sales)
ORDER BY cs.total_sales DESC;
 
 
-- 5. Highest order value per customer
SELECT c.customer_name, MAX(o.sales) AS highest_order_value
FROM orders o
JOIN customers c ON c.customer_id = o.customer_id
GROUP BY o.customer_id, c.customer_name
ORDER BY highest_order_value DESC;