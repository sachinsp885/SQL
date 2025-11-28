2. RANK()
Explanation:
-> Assigns a rank to each row within a partition, based on order.
-> Ties get the same rank, and gaps exist after ties.

Syntax:
RANK() OVER ([PARTITION BY column_name] ORDER BY column_name)

Example:
SELECT 
    name, 
    department, 
    salary, 
    RANK() OVER(PARTITION BY department ORDER BY salary DESC) AS rank
FROM employees;

Output:
| name | department | salary | rank |
| ---- | ---------- | ------ | ---- |
| Sara | IT         | 7000   | 1    |
| Jane | IT         | 6000   | 2    |
| John | IT         | 5000   | 3    |
| Lily | HR         | 4500   | 1    |
| Mike | HR         | 4000   | 2    |

Use case:
-> Ranking employees or items in a category.
-> Useful for leaderboards, scoring, and performance evaluation.