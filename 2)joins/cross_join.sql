✅ CROSS JOIN — Explanation
Definition
CROSS JOIN returns the Cartesian product of two tables.
That means:
👉 Every row of Table A is combined with every row of Table B.
👉 No condition required (no ON clause).
👉 Output size = (rows in A) × (rows in B)

🎯 Diagram (Easy Visual)
Employees Table (3 rows)       Departments Table (3 rows)

  A1                             B1
  A2         CROSS JOIN          B2
  A3                             B3

   Result = 3 × 3 = 9 rows

 A1-B1
 A1-B2
 A1-B3
 A2-B1
 A2-B2
 A2-B3
 A3-B1
 A3-B2
 A3-B3

📌 Example Tables
employees
emp_id	name
1	Arun
2	Meena
3	Ravi
departments
dept_id	dept_name
10	IT
20	HR
30	Finance
🧩 CROSS JOIN Query
SELECT e.name, d.dept_name
FROM employees e
CROSS JOIN departments d;

✅ Output (3 × 3 = 9 Rows)
name	dept_name
Arun	IT
Arun	HR
Arun	Finance
Meena	IT
Meena	HR
Meena	Finance
Ravi	IT
Ravi	HR
Ravi	Finance
✔️ Explanation

CROSS JOIN does not check for matching values.
It simply pairs every employee with every department.

Useful for:
generating combinations
test data
creating schedules

pricing combinations (product × size × color)

⭐ Summary of JOIN types so far
JOIN Type	Returns
INNER JOIN	Matching rows only
LEFT JOIN	All LEFT rows + matching RIGHT
RIGHT JOIN	All RIGHT rows + matching LEFT
FULL JOIN	All rows from both tables
CROSS JOIN	Cartesian product (A × B)