3. DENSE_RANK()
Explanation:
-> Similar to RANK(), but no gaps between ranks.
-> Ties get the same rank, and the next rank continues sequentially.

Syntax:
DENSE_RANK() OVER ([PARTITION BY column_name] ORDER BY column_name)

Example:
SELECT 
    name, 
    department, 
    salary, 
    DENSE_RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS dense_rank
FROM employees;

Output: (if two employees had same salary)
| name | department | salary | dense_rank |
| ---- | ---------- | ------ | ---------- |
| Sara | IT         | 7000   | 1          |
| Jane | IT         | 6000   | 2          |
| John | IT         | 6000   | 2          |
| Lily | HR         | 4500   | 1          |
| Mike | HR         | 4000   | 2          |

Use case:
Leaderboards where you don’t want gaps in ranking.
