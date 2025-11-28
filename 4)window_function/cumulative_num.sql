SUM() / AVG() / MIN() / MAX() as window functions
Explanation:
Aggregate functions can be used as window functions to compute cumulative or running totals.
Syntax:
SELECT 
    name,
    department,
    salary,
    SUM(salary) OVER(PARTITION BY department ORDER BY salary) AS cumulative_salary
FROM employees;

Output:
| name | department | salary | cumulative_salary |
| ---- | ---------- | ------ | ----------------- |
| John | IT         | 5000   | 5000              |
| Jane | IT         | 6000   | 11000             |
| Sara | IT         | 7000   | 18000             |
| Mike | HR         | 4000   | 4000              |
| Lily | HR         | 4500   | 8500              |

✅ Summary of Real-time Uses:
| Function        | Use Case Example                                |
| --------------- | ----------------------------------------------- |
| ROW_NUMBER()    | Top N employees per department                  |
| RANK()          | Leaderboards with ranking gaps                  |
| DENSE_RANK()    | Leaderboards without gaps                       |
| SUM/AVG/MIN/MAX | Running totals or moving averages in dashboards |

