1. ROW_NUMBER()
Explanation:
-> Assigns a unique sequential number to each row within a partition of a result set.
-> Numbering starts at 1 for each partition.

Syntax:
ROW_NUMBER() OVER ([PARTITION BY column_name] ORDER BY column_name)

Real-time example:
Suppose we have an employees table:
| emp_id | name | department | salary |
| ------ | ---- | ---------- | ------ |
| 1      | John | IT         | 5000   |
| 2      | Jane | IT         | 6000   |
| 3      | Mike | HR         | 4000   |
| 4      | Sara | IT         | 7000   |
| 5      | Lily | HR         | 4500   |


Query to assign row numbers per department by salary (highest first):
SELECT 
    emp_id,
    name,
    department,
    salary,
    ROW_NUMBER() OVER(PARTITION BY department ORDER BY salary DESC) AS row_num
FROM employees;

Output:
| emp_id | name | department | salary | row_num |
| ------ | ---- | ---------- | ------ | ------- |
| 4      | Sara | IT         | 7000   | 1       |
| 2      | Jane | IT         | 6000   | 2       |
| 1      | John | IT         | 5000   | 3       |
| 5      | Lily | HR         | 4500   | 1       |
| 3      | Mike | HR         | 4000   | 2       |

Use case:
Identify the top N employees per department.
Deduplication when you want first occurrence based on a column.