
# Objective
Analyze sales data using SQL with filtering, aggregation, and business queries.

---

## Database Schema

The database consists of the following four tables:

* **customers** – Stores customer information.
* **products** – Stores product details and inventory.
* **orders** – Stores customer order information.
* **order_items** – Stores details of products included in each order.

### Entity Relationships

* One customer can place multiple orders.
* One order can contain multiple order items.
* One product can appear in multiple order items.

---

## Project Structure

```
sql-assignment/
│── Section_A/
│   └── basic_queries.sql
│── Section_B/
│   └── filtering_queries.sql
│── Section_C/
│   └── aggregation_queries.sql
│── Section_D/
│   └── joins_queries.sql
│── Section_E/
│   └── advanced_queries.sql
│── README.md
```

---

## Assignment Sections

### Section A – Basic Queries

* Retrieve all records
* Select specific columns
* Use `DISTINCT`

### Section B – Filtering

* `WHERE` clause
* Comparison operators
* Logical operators (`AND`, `OR`)

### Section C – Aggregation

* `COUNT()`
* `SUM()`
* `AVG()`
* `MAX()`
* `MIN()`
* `GROUP BY`

### Section D – Joins

* `INNER JOIN`
* `LEFT JOIN`
* Multi-table joins

### Section E – Advanced SQL

* `CASE` statements
* Transactions (`COMMIT` and `ROLLBACK`)

---
