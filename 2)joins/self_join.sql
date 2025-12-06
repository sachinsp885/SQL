✅ 2. SELF JOIN — Explanation
Definition
SELF JOIN means:
A table is joined with itself.
You use this when rows in the same table are related to each other.

🎯 Example: employees table with manager_id
employees
emp_id	name	manager_id
    1	Arun	NULL
    2	Meena	1
    3	Ravi	1
    4	Kiran	2

Here:

Arun is the manager of Meena and Ravi
Meena is the manager of Kiran

🧩 SELF JOIN Query
SELECT e.name AS employee,
       m.name AS manager
FROM employees e
LEFT JOIN employees m
ON e.manager_id = m.emp_id;

✅ Output
employee	manager
    Arun	NULL
    Meena	Arun
    Ravi	Arun
    Kiran	Meena

✔️ Explanation

You treat:
First instance: employees e → employee
Second instance: employees m → manager
Both come from the same table, but with different aliases.

⭐ Summary
JOIN Type	What it does
CROSS JOIN	Returns all possible combinations
SELF JOIN	Join a table with itself