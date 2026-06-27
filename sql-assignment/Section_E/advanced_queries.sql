-- Categorize orders using CASE
SELECT
    order_id,
    total_amount,
    CASE
        WHEN total_amount >= 5000 THEN 'High Value'
        WHEN total_amount >= 2000 THEN 'Medium Value'
        ELSE 'Low Value'
    END AS order_category
FROM orders;

-- Product stock classification
SELECT
    product_name,
    stock_qty,
    CASE
        WHEN stock_qty < 150 THEN 'Low Stock'
        WHEN stock_qty <= 300 THEN 'Medium Stock'
        ELSE 'High Stock'
    END AS stock_status
FROM products;

-- Transaction
START TRANSACTION;
UPDATE products
SET stock_qty = stock_qty - 1
WHERE product_id = 201;
COMMIT;

-- Rollback
START TRANSACTION;
UPDATE products SET stock_qty = stock_qty - 5 WHERE product_id = 202;
ROLLBACK;