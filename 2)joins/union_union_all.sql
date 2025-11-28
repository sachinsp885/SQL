✅ UNION vs UNION ALL — Simple Difference
| Feature            | UNION                                 | UNION ALL                     |
| ------------------ | ------------------------------------- | ---------------------------   |
| Removes duplicates | ✔ Yes                                 | ❌ No                        |
| Returns all rows   | ❌ No (unique only)                    | ✔ Yes (includes duplicates) |
| Faster?            | ❌ Slightly slower                     | ✔ Faster                    |
| Sorting            | Internally sorts to remove duplicates | No sorting                    |

🎯 Basic Example
Table: employees_2024
emp_id	name
1	Arun
2	Meena
3	Ravi
Table: employees_2025
emp_id	name
3	Ravi
4	Kiran
5	Divya
🧩 UNION Example (Removes duplicates)
SELECT name FROM employees_2024
UNION
SELECT name FROM employees_2025;

Output
name
Arun
Meena
Ravi
Kiran
Divya

✔ Duplicates removed automatically

🧩 UNION ALL Example (Keeps duplicates)
SELECT name FROM employees_2024
UNION ALL
SELECT name FROM employees_2025;

Output
name
Arun
Meena
Ravi
Ravi
Kiran
Divya

✔ Faster
✔ Keeps all rows, including duplicates.

⭐ Real-Time Use Cases
🔵 1. Combining data from multiple years (common real case)
Example: Sales from 2023 + 2024
SELECT * FROM sales_2023
UNION ALL
SELECT * FROM sales_2024;


✔ Used in BI dashboards
✔ Prevents duplicate removal
✔ Performance-friendly

🔵 2. Removing duplicates from two sources
Example: You want a unique list of all employees across two branches.

SELECT emp_id FROM branch1_employees
UNION
SELECT emp_id FROM branch2_employees;

✔ Gives unique employee IDs
✔ Avoids double counting

🔵 3. Search across multiple tables
Example: A company stores old customers in a backup table.

SELECT name FROM active_customers
UNION
SELECT name FROM old_customers;

✔ Returns unique names only
✔ Useful in customer lookup screens

🔵 4. Merging logs or audit tables
Audit logs usually have duplicates.
SELECT * FROM logs_server1
UNION ALL
SELECT * FROM logs_server2;


✔ No need to remove duplicates
✔ Used in monitoring systems

🎯 When to use what?
✔ Use UNION when:
-> You want unique values
-> Duplicate rows should not be counted
Example: unique customer list

✔ Use UNION ALL when:
-> Performance matters
-> You want ALL rows including duplicates

Example: merging logs, sales, transactions