-- View all customers
SELECT * FROM customers;

-- View all products
SELECT * FROM products;

-- View all orders
SELECT * FROM orders;

-- View all order items
SELECT * FROM order_items;

-- Show customer names and cities
SELECT first_name, last_name, city FROM customers;

-- Show product name and price
SELECT product_name, unit_price FROM products;

-- Show distinct product categories
SELECT DISTINCT category FROM products;