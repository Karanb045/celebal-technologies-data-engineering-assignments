# Superstore SQL Project

SQL practice project using the Superstore sample dataset — covers table design,
subqueries, CTEs, and window functions.

## What's Inside

- `sql/01_setup_tables.sql` – import raw data, create `customers`, `products`, `orders`
- `sql/02_required_queries.sql` – subqueries, CTEs, window functions
- `sql/03_final_combined_query.sql` – customer name, total sales, and rank
- `sql/04_mini_project_insights.sql` – top/bottom customers, one-time buyers, etc.
- `screenshots/` – query result outputs

## Key Insights

- Top customer: **Sean Miller** (~$25,043 total sales)
- Bottom customer: **Thais Sissman** (~$4.83 total sales)
- 12 customers placed only one order
- 294 of 793 customers are above-average spenders

## How to Run

1. In MySQL Workbench, use **Table Data Import Wizard** to import
   `Sample_-_Superstore.csv` into a table called `superstore_raw`
2. Run the SQL files in order: `01 → 02 → 03 → 04`
