✅ RIGHT JOIN — Explanation
Definition
RIGHT JOIN returns:
All rows from the RIGHT table
Matching rows from the LEFT table
If no match, LEFT table values become NULL
It is opposite of LEFT JOIN.

🎯 Diagram (Easy Visual)
 LEFT TABLE           RIGHT TABLE
 (employees)          (departments)

   ●●●●●               ●●●●●●
        ●●             ← Entire RIGHT table returned
   ○○                   + matching from LEFT table
                        Non-matching LEFT values become NULL

📌 Example Tables
Table 1: employees (LEFT table)
emp_id	name	dept_id
   1	     Arun	  10
   2	     Meena  20
   3	     Ravi	  10
   4	     Kiran  40

Table 2: departments (RIGHT table)
dept_id	dept_name
  10	        IT
  20	        HR
  30	      Finance

🧩 RIGHT JOIN Query
SELECT e.name, e.dept_id, d.dept_name
FROM employees e
RIGHT JOIN departments d
ON e.dept_id = d.dept_id;

✅ Output (All rows from RIGHT + matching LEFT)
name	dept_id	dept_name
Arun	  10	        IT
Ravi	  10	        IT
Meena  20	        HR
NULL	 NULL	Finance

✔️ Explanation
1️⃣ Matching Rows
dept_id 10 → Arun, Ravi
dept_id 20 → Meena

2️⃣ Unmatched RIGHT table row

dept_id 30 (Finance) has no employee
→ So employee values become NULL

3️⃣ Kiran (dept_id 40)
Does NOT appear
Because RIGHT JOIN only returns all rows from RIGHT table, not LEFT.

⭐ Summary Comparison
JOIN	What it returns
LEFT JOIN	All rows from LEFT + matching RIGHT
RIGHT JOIN	All rows from RIGHT + matching LEFT
INNER JOIN	Only matching rows