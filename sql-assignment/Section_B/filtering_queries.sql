-- Customers from delhi city
SELECT * FROM customers WHERE city = 'Delhi';

-- Products costing more than 1000
SELECT * FROM products WHERE unit_price > 1000;

-- Cancelled orders
SELECT * FROM orders WHERE status = 'Cancelled';

-- Customers who are premium
SELECT * FROM customers WHERE is_premium = 0;

-- Products with stock below 200
SELECT * FROM products WHERE stock_qty < 200;

-- Display order items with unit price greater than 800 and discount percentage of at least 10%
SELECT * FROM order_items WHERE unit_price>800 AND discount_pct>=10;