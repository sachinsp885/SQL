✅ FULL OUTER JOIN — Explanation
Definition
FULL OUTER JOIN returns:
-> All matching rows
-> All non-matching rows from LEFT table
-> All non-matching rows from RIGHT table
-> Missing values are filled with NULL

It is basically:
LEFT JOIN
UNION
RIGHT JOIN

🎯 Diagram (Easy Visual)
 LEFT TABLE           RIGHT TABLE
 (employees)          (departments)

   ●●●●●●●●●●●●●●●●  ← ALL rows from both tables  
   ●●●●●●●●●●●●●●●●     Matching + Non-matching  
           ●●●●●●● 

📌 Example Tables
employees (LEFT table)
emp_id	name	dept_id
  1	    Arun	  10
  2	    Meena	  20
  3	    Ravi	  10
  4	    Kiran	  40

departments (RIGHT table)
dept_id	dept_name
  10	      IT
  20	      HR
  30	      Finance

🧩 FULL OUTER JOIN Query
SELECT e.name, e.dept_id, d.dept_name
FROM employees e
FULL OUTER JOIN departments d
ON e.dept_id = d.dept_id;

✅ Output (All matching + all non-matching rows)
name	dept_id	dept_name
Arun	10	IT
Ravi	10	IT
Meena	20	HR
Kiran	40	NULL
NULL	30	Finance

✔️ Explanation
Matching rows
10 → Arun, Ravi
20 → Meena
Non-matching from LEFT (employees)

dept_id 40 → Kiran
→ No department = dept_name becomes NULL
Non-matching from RIGHT (departments)

dept_id 30 → Finance
→ No employee = name becomes NULL