✅ LEFT JOIN — Explanation
Definition
LEFT JOIN returns:
All rows from the LEFT table
Matching rows from the RIGHT table
If no match, RIGHT table values become NULL

🎯 Diagram (Easy Visual)
 LEFT TABLE          RIGHT TABLE
 (employees)         (departments)

   ●●●●●●             ●●●
   ●●●●●●  ← Entire LEFT table returned
   ●●●●●●     + matching from RIGHT table
      ○○         Non-matching RIGHT values become NULL

📌 Example
Table 1: employees (LEFT table)
emp_id	name	dept_id
1	Arun	10
2	Meena	20
3	Ravi	10
4	Kiran	40

Table 2: departments (RIGHT table)
dept_id	dept_name
10	IT
20	HR
30	Finance

🧩 LEFT JOIN Query
SELECT e.name, e.dept_id, d.dept_name
FROM employees e
LEFT JOIN departments d
ON e.dept_id = d.dept_id;

✅ Output (All rows from LEFT + matching RIGHT)
name	dept_id	dept_name
Arun	10	IT
Meena	20	HR
Ravi	10	IT
Kiran	40	NULL

✔️ Explanation
1️⃣ Matching rows
Arun → IT
Meena → HR
Ravi → IT

2️⃣ Non-matching row
Kiran (dept_id = 40) has no matching department
→ So dept_name becomes NULL

3️⃣ Department 30 (Finance)
No employee belongs to it

LEFT JOIN does NOT return extra RIGHT table rows without match

⭐ Summary
JOIN Type	Returns
INNER JOIN	Only matching rows
LEFT JOIN	All LEFT + matching RIGHT + NULL for unmatched