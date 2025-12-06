⭐ 1️⃣ ORDER BY — Sorting the Result
ORDER BY is used to sort the output of a query.

🔹 Syntax
SELECT column1, column2
FROM table_name
ORDER BY column1 [ASC|DESC];

🔹 Example
SELECT name, salary
FROM employees
ORDER BY salary DESC;


--✔  Explanation::
Sorts employees by salary high → low.

⭐ 2️⃣ GROUP BY — Group Rows + Apply Aggregation
GROUP BY is used to group rows that have the same values, usually with aggregate functions.

🔹 Syntax
SELECT column1, AGG_FUNC(column2)
FROM table_name
GROUP BY column1;

🔹 Example
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;


--✔  Explanation::
Groups employees by department, counts how many employees in each.

⭐ 3️⃣ Difference Between ORDER BY and GROUP BY
Feature	GROUP BY	ORDER BY
Purpose	Group rows	Sort rows
Works on	Raw data before final result	Final result after grouping
Uses aggregates	Yes (COUNT, SUM, AVG...)	No
Required?	Only if grouping needed	Optional
Example	GROUP BY department	ORDER BY salary DESC
⭐ 4️⃣ Using ORDER BY + GROUP BY Together

Yes, you can use both in one query.

✔ Example 1: Count employees per department and sort by count
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department
ORDER BY emp_count DESC;


--✔  Explanation::
1️⃣ GROUP BY department → groups employees
2️⃣ COUNT(*) → count employees per department
3️⃣ ORDER BY emp_count DESC → highest count first

--✔ Example 2: Show average salary per department, sort alphabetically
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department
ORDER BY department ASC;

--✔ Example 3: Sort by aggregated value (sum of salary)
SELECT department, SUM(salary) AS total_salary
FROM employees
GROUP BY department
ORDER BY total_salary DESC;

⭐ 5️⃣ Complete Example with WHERE, GROUP BY, HAVING, ORDER BY
SELECT department, COUNT(*) AS emp_count
FROM employees
WHERE salary > 30000
GROUP BY department
HAVING COUNT(*) >= 1
ORDER BY emp_count DESC;

✔ --✔  Explanation::
WHERE salary > 30000    → filter rows BEFORE grouping
GROUP BY department     → group by department
HAVING COUNT(*) >= 1    → filter groups
ORDER BY emp_count DESC → final sorted output

⭐ Final Summary
Clause	    Purpose	        Example
GROUP BY	Group rows	   GROUP BY department
ORDER BY	Sort output	   ORDER BY salary DESC
HAVING	    Filter groups  HAVING COUNT(*) > 1
WHERE	    Filter rows	   WHERE salary > 30000