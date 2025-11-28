LIMIT and OFFSET in PostgreSQL
These two are used to control how many rows you want from your query — especially useful for pagination.

1️⃣ LIMIT
--✔  Meaning:
LIMIT tells PostgreSQL how many rows to return.

--✔  Example:
SELECT * FROM employees
LIMIT 5;

--✔  Explanation:
This query returns only the first 5 rows from the employees table.
Even if the table has 500 rows → you see only 5.

2️⃣ OFFSET
--✔  Meaning:
OFFSET skips the given number of rows before starting to return results.

--✔  Example:
SELECT * FROM employees
OFFSET 3;

--✔  Explanation:
This will skip the first 3 rows
and return everything after that.

3️⃣ LIMIT + OFFSET (Pagination)
This is used when you want results in pages.

--✔  Example 1: Page 1 (records 1–5)
SELECT * FROM employees
LIMIT 5 OFFSET 0;

--✔  Explanation:
Returns first 5 rows
OFFSET 0 means → start from the beginning

--✔  Example 2: Page 2 (records 6–10)
SELECT * FROM employees
LIMIT 5 OFFSET 5;

--✔  Explanation:
Skip first 5 rows
Return next 5 rows

--✔  Example 3: Page 3 (records 11–15)
SELECT * FROM employees
LIMIT 5 OFFSET 10;

4️⃣ Using ORDER BY with LIMIT
Always use ORDER BY with LIMIT to get consistent results.

--✔  Explanation:
SELECT * FROM employees
ORDER BY salary DESC
LIMIT 3;

--✔  Explanation:
Returns top 3 highest salaries.

5️⃣ Real-Time Example: Get Latest 10 Employees
SELECT * FROM employees
ORDER BY emp_id DESC
LIMIT 10;

6️⃣ Real-Time Example: Skip Latest 10, Show Next 5
SELECT * FROM employees
ORDER BY emp_id DESC
LIMIT 5 OFFSET 10;

--✔  Explanation:
Skip first 10 newest records
Show next 5 records

⭐ Summary Table
Keyword	Meaning	Example
LIMIT	Number of rows to return	LIMIT 5
OFFSET	Number of rows to skip	OFFSET 10
LIMIT + OFFSET	Pagination	LIMIT 5 OFFSET 10
