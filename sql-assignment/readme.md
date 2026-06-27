

\# Objective

Analyze sales data using SQL with filtering, aggregation, and business queries.



\---



\## Database Schema



The database consists of the following four tables:



\* \*\*customers\*\* – Stores customer information.

\* \*\*products\*\* – Stores product details and inventory.

\* \*\*orders\*\* – Stores customer order information.

\* \*\*order\_items\*\* – Stores details of products included in each order.



\### Entity Relationships



\* One customer can place multiple orders.

\* One order can contain multiple order items.

\* One product can appear in multiple order items.



\---



\## Project Structure



```

sql-assignment/

│── Section\_A/

│   └── basic\_queries.sql

│── Section\_B/

│   └── filtering\_queries.sql

│── Section\_C/

│   └── aggregation\_queries.sql

│── Section\_D/

│   └── joins\_queries.sql

│── Section\_E/

│   └── advanced\_queries.sql

│── README.md

```



\---



\## Assignment Sections



\### Section A – Basic Queries



\* Retrieve all records

\* Select specific columns

\* Use `DISTINCT`



\### Section B – Filtering



\* `WHERE` clause

\* Comparison operators

\* Logical operators (`AND`, `OR`)



\### Section C – Aggregation



\* `COUNT()`

\* `SUM()`

\* `AVG()`

\* `MAX()`

\* `MIN()`

\* `GROUP BY`



\### Section D – Joins



\* `INNER JOIN`

\* `LEFT JOIN`

\* Multi-table joins



\### Section E – Advanced SQL



\* `CASE` statements

\* Transactions (`COMMIT` and `ROLLBACK`)



\---



