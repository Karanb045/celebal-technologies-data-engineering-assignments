
CREATE TABLE customers (
    customer_id   VARCHAR(20) PRIMARY KEY,
    customer_name VARCHAR(100),
    segment       VARCHAR(30),
    country       VARCHAR(50)
);
 
CREATE TABLE products (
    product_id    VARCHAR(30),
    category      VARCHAR(30),
    sub_category  VARCHAR(30),
    product_name  VARCHAR(200)
);
 
CREATE TABLE orders (
    row_id        INTEGER PRIMARY KEY,
    order_id      VARCHAR(20),
    order_date    DATE,
    ship_date     DATE,
    ship_mode     VARCHAR(30),
    customer_id   VARCHAR(20),
    product_id    VARCHAR(30),
    city          VARCHAR(50),
    state         VARCHAR(50),
    postal_code   VARCHAR(10),
    region        VARCHAR(20),
    sales         DECIMAL(10,4),
    quantity      INT,
    discount      DECIMAL(5,2),
    profit        DECIMAL(10,4)
);

INSERT INTO customers (customer_id, customer_name, segment, country)
SELECT DISTINCT customer_id, customer_name, segment, country
FROM superstore_raw;
 
INSERT INTO products (product_id, category, sub_category, product_name)
SELECT DISTINCT product_id, category, sub_category, product_name
FROM superstore_raw;
 
INSERT INTO orders (row_id, order_id, order_date, ship_date, ship_mode,
                     customer_id, product_id, city, state, postal_code,
                     region, sales, quantity, discount, profit)
SELECT DISTINCT row_id, order_id, order_date, ship_date, ship_mode,
                customer_id, product_id, city, state, postal_code,
                region, sales, quantity, discount, profit
FROM superstore_raw;