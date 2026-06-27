-- Total number of customers
SELECT COUNT(*) AS total_customers FROM customers;

-- Total number of products
SELECT COUNT(*) AS total_products FROM products;

-- Average product price
SELECT AVG(unit_price) AS avg_price FROM products;

-- Highest product price
SELECT MAX(unit_price) AS highest_price FROM products;

-- Lowest product price
SELECT MIN(unit_price) AS lowest_price FROM products;

-- Total sales amount
SELECT SUM(total_amount) AS total_sales FROM orders;

-- Number of products per category
SELECT category, COUNT(*) AS product_count FROM products GROUP BY category;

-- Average price by category
SELECT category, AVG(unit_price) AS avg_price FROM products GROUP BY category;

-- Total orders by status
SELECT status, COUNT(*) AS total_orders FROM orders GROUP BY status;