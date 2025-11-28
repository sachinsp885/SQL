⭐ List of Aggregate Functions
-> COUNT()
-> SUM()
-> AVG()
-> MAX()
-> MIN()
-> STRING_AGG() (PostgreSQL special)
-> ARRAY_AGG() (PostgreSQL special)

1️⃣ COUNT() – Count number of rows
--✔  Explanation: Count total employees
SELECT COUNT(*) AS total_employees
FROM employees;

--✔  Explanation:
Returns how many rows (employees) exist in the table.

--✔  Explanation: Count employees in IT dept
SELECT COUNT(*) 
FROM employees
WHERE department = 'IT';

2️⃣ SUM() – Add all values
--✔  Explanation: Find total salary
SELECT SUM(salary) AS total_salary
FROM employees;

--✔  Explanation:

Adds all salary values and returns one number.

--✔  Explanation: Total salary of HR department
SELECT SUM(salary)
FROM employees
WHERE department = 'HR';

3️⃣ AVG() – Average value
--✔  Explanation: Average employee salary
SELECT AVG(salary) AS avg_salary
FROM employees;

--✔  Explanation:
( sum of salary ) / ( total rows )

4️⃣ MAX() – Highest value
--✔  Explanation: Highest salary
SELECT MAX(salary) AS highest_salary
FROM employees;

--✔  Explanation: Oldest employee age
SELECT MAX(age) AS oldest_age
FROM employees;

5️⃣ MIN() – Lowest value
--✔  Explanation: Minimum salary
SELECT MIN(salary) AS lowest_salary
FROM employees;

6️⃣ STRING_AGG() – Combine text values (PostgreSQL special)
--✔  Explanation: List all employee names in one row (comma-separated)
SELECT STRING_AGG(name, ', ') AS all_names
FROM employees;

--✔  Explanation:
Output example:
Arun, Meena, Kiran, Ravi

7️⃣ ARRAY_AGG() – Collect values into an array
--✔  Explanation:
SELECT ARRAY_AGG(name) AS name_array
FROM employees;
Output example:
{Arun, Meena, Kiran}

⭐ Aggregate Functions With GROUP BY
--✔  Explanation: Count employees in each department
SELECT department, COUNT(*) AS emp_count
FROM employees
GROUP BY department;

--✔  Explanation: Average salary per department
SELECT department, AVG(salary) AS avg_salary
FROM employees
GROUP BY department;