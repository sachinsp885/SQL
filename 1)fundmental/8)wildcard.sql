1️⃣ % (Percent)
✔ Meaning:
Matches 0 or more characters in a string.

--✔  Example:
SELECT * FROM employees
WHERE name LIKE 'A%';


--✔  Explanation:
Returns employees whose names start with 'A'

Matches: Arun, Anita, Aman…
Does not match: Ravi, Meena

--✔  Example: Ends with specific letters
SELECT * FROM employees
WHERE name LIKE '%n';


--✔  Explanation:
Names ending with 'n'
Matches: Kiran, Meen…

--✔  Example: Contains specific letters
SELECT * FROM employees
WHERE name LIKE '%an%';


--✔  Explanation:
Names containing 'an' anywhere
Matches: Kiran, Meena, Anand

2️⃣ _ (Underscore)
✔ Meaning:
Matches exactly one character.

--✔  Example:
SELECT * FROM employees
WHERE name LIKE 'A_u_';


--✔  Explanation:
Names starting with 'A', third letter 'u', fourth any letter
Matches: Arun (A-r-u-n)

Does not match: Anita, Aman

3️⃣ [] (Square Brackets – PostgreSQL Regex, not LIKE)

PostgreSQL LIKE does not support [], use SIMILAR TO or ~ for regex
Example: Names starting with A, B, or C

SELECT * FROM employees
WHERE name SIMILAR TO '(A|B|C)%';

4️⃣ Combining % and _
SELECT * FROM employees
WHERE name LIKE 'A_n%';


--✔  Explanation:
First letter: A
Third letter: n

% → any characters after that
Matches: Anand, Annu, Ananya

5️⃣ Case-Insensitive Search
LIKE → case-sensitive

ILIKE → case-insensitive
SELECT * FROM employees
WHERE name ILIKE 'a%';


--✔  Explanation:
Returns names starting with 'A' or 'a'

6️⃣ Real-time Example with Table

Assume table:
emp_id	name	department
1	Arun	IT
2	Meena	HR
3	Kiran	IT
4	Anita	HR
5	Ravi	Finance
Queries:

Names starting with 'A':
SELECT name FROM employees WHERE name LIKE 'A%';
-- Output: Arun, Anita

Names ending with 'a':
SELECT name FROM employees WHERE name LIKE '%a';
-- Output: Meena, Anita

Names containing 'ri':
SELECT name FROM employees WHERE name LIKE '%ri%';
-- Output: Kiran, Ravi