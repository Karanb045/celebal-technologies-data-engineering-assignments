-- Customers with their orders
SELECT
    c.customer_id,
    c.first_name,
    c.last_name,
    o.order_id,
    o.order_date,
    o.status
FROM customers c INNER JOIN orders o ON c.customer_id = o.customer_id;

-- Order details with products
SELECT
    oi.item_id,
    o.order_id,
    p.product_name,
    oi.quantity,
    oi.unit_price
FROM order_items oi
INNER JOIN orders o ON oi.order_id = o.order_id
INNER JOIN products p ON oi.product_id = p.product_id;

-- All customers and their orders
SELECT
    c.customer_id,
    c.first_name,
    o.order_id
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id;

-- Total orders per customer
SELECT
    c.customer_id,
    c.first_name,
    COUNT(o.order_id) AS total_orders
FROM customers c LEFT JOIN orders o ON c.customer_id = o.customer_id GROUP BY c.customer_id, c.first_name;

-- Customer purchase details
SELECT
    c.first_name,
    p.product_name,
    oi.quantity
FROM customers c
JOIN orders o ON c.customer_id = o.customer_id
JOIN order_items oi ON o.order_id = oi.order_id
JOIN products p ON oi.product_id = p.product_id;