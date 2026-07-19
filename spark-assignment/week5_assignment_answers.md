# Week 5 Assignment Answers

## Q1. What are the key limitations of traditional MapReduce that make Spark a preferred choice for modern big data processing?

### Answer

Traditional MapReduce has several limitations:

* Stores intermediate results on disk, making processing slower.
* Supports only batch processing.
* Performs poorly for iterative machine learning and graph algorithms because every iteration requires disk read/write operations.

Apache Spark overcomes these limitations by:

* Using **in-memory computing** for faster execution.
* Supporting **batch processing, streaming, SQL, machine learning, and graph processing**.
* Reusing data in memory, making iterative algorithms much faster.

---

## Q2. Explain how Spark uses In-Memory Computing to speed up iterative machine learning algorithms compared to disk-based systems.

### Answer

Spark stores intermediate results in **RAM** instead of writing them to disk after every operation. Since machine learning algorithms repeatedly process the same data, Spark avoids repeated disk I/O and significantly improves execution speed.

**Benefits**

* Faster iterative computations
* Reduced disk access
* Better performance for machine learning and graph algorithms
* Lower execution time than MapReduce

---

## Q3. Remove duplicate rows based on `user_id` and `transaction_date`

```python
df = df.dropDuplicates(["user_id", "transaction_date"])
```

---

## Q4. Filter rows where region is West and calculate the average sale amount by product category.

```python
from pyspark.sql.functions import avg

result = (
    df_sales
    .filter(df_sales.region == "West")
    .groupBy("product_category")
    .agg(avg("sale_amount").alias("average_sale_amount"))
)

result.show()
```

---

## Q5. Difference between `.na.drop()` and `.na.fill()`

### Answer

* **`.na.drop()`** removes rows containing null values.
* **`.na.fill()`** replaces null values with a specified value.

Example:

```python
df = df.na.fill({
    "status": "Unknown"
})
```

---

## Q6. Find the total count of records for each city where the count is greater than 100.

```python
from pyspark.sql.functions import count

result = (
    df.groupBy("city")
      .agg(count("*").alias("total_records"))
      .filter("total_records > 100")
)

result.show()
```

---

## Q7. How does DataFrame immutability affect data cleaning?

### Answer

Spark DataFrames are immutable, meaning they cannot be modified directly. Every transformation creates a new DataFrame.

Example:

```python
df_clean = df.drop("age")
```

or

```python
df = df.drop("age")
```

---

## Q8. Filter rows where age is between 18 and 30 and subscription is Premium.

```python
result = df.filter(
    (df.age.between(18, 30)) &
    (df.subscription == "Premium")
)

result.show()
```

---

## Q9. Why should null values be handled before aggregation?

### Answer

Handling null values before performing mathematical operations ensures accurate and reliable results. Filling or removing null values improves data quality and prevents misleading calculations.

---

## Q10. Convert `raw_timestamp` into `event_time`.

```python
from pyspark.sql.functions import col
from pyspark.sql.types import TimestampType

df = (
    df.withColumn(
        "event_time",
        col("raw_timestamp").cast(TimestampType())
    )
    .drop("raw_timestamp")
)
```

---

## Q11. Explain Shuffle.

### Answer

Shuffle is the process of redistributing data across partitions so that rows with the same key are grouped together.

Operations such as:

* `groupBy()`
* `join()`
* `distinct()`
* `reduceByKey()`

trigger a shuffle.

It is considered a **wide transformation** because data moves across partitions and worker nodes, involving network communication and disk I/O.

---

## Q12. Remove rows where email is null or username is empty.

```python
result = df.filter(
    df.email.isNotNull() &
    (df.username != "")
)

result.show()
```

---

## Q13. Calculate minimum, maximum, and average price.

```python
from pyspark.sql.functions import min, max, mean

result = df.agg(
    min("price").alias("Minimum Price"),
    max("price").alias("Maximum Price"),
    mean("price").alias("Average Price")
)

result.show()
```

---

## Q14. What is the risk of using `inferSchema=True` with inconsistent date formats?

### Answer

Using `inferSchema=True` with inconsistent date formats may:

* Infer incorrect data types.
* Treat dates as strings.
* Produce null values.
* Cause parsing errors.
* Lead to inaccurate analysis.

For inconsistent datasets, defining the schema manually is generally recommended.

---

## Q15. Final processing pipeline.

```python
from pyspark.sql.functions import sum

result = (
    df.dropDuplicates()
      .na.fill({"price": 0})
      .groupBy("store_id")
      .agg(
          sum("price").alias("total_revenue")
      )
)

result.show()
```
