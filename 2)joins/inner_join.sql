✅ INNER JOIN — Explanation
Definition
INNER JOIN returns only the matching rows from both tables.
If a value exists in Table A and also exists in Table B, only then it appears in the result.

🎯 Diagram (Easy to Remember)
     Table A        Table B
   (employees)    (departments)

       ●**●
        **     ← Only the overlapping/matching portion is returned
       ●**●

📌 Example
Table 1: employees
emp_id	name	dept_id
1	Arun	10
2	Meena	20
3	Ravi	10
4	Kiran	40

Table 2: departments
dept_id	dept_name
10	IT
20	HR
30	Finance

🧩 INNER JOIN Query
SELECT e.name, d.dept_name
FROM employees e
INNER JOIN departments d
ON e.dept_id = d.dept_id;

✅ Output (Matching Rows Only)
name	dept_name
Arun	IT
Meena	HR
Ravi	IT

✔️ Explanation of the Result
Returned
Arun (dept_id 10) → IT
Meena (dept_id 20) → HR
Ravi (dept_id 10) → IT
Not Returned

Kiran, because his dept_id = 40
→ Not present in departments table
→ So INNER JOIN removes him

Not Returned
Finance (dept_id 30) because no employee belongs to it.

⭐ Summary
INNER JOIN gives only matching rows
It behaves like an intersection
Non-matching rows from both tables are ignored