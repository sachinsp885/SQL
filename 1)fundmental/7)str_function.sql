| **Function**       | **Description**                           | **Example**                                  | **Output**                    |                  |   |           |               |
| ------------------ | ----------------------------------------- | -------------------------------------------- | ----------------------------- | ---------------- | - | --------- | ------------- |
| LENGTH()           | Returns number of characters in a string  | `SELECT LENGTH('Hello');`                    | `5`                           |                  |   |           |               |
| UPPER()            | Converts string to uppercase              | `SELECT UPPER('sql');`                       | `SQL`                         |                  |   |           |               |
| LOWER()            | Converts string to lowercase              | `SELECT LOWER('POSTGRES');`                  | `postgres`                    |                  |   |           |               |
| INITCAP()          | Capitalizes first letter of each word     | `SELECT INITCAP('hello world');`             | `Hello World`                 |                  |   |           |               |
| CONCAT()           | Joins multiple strings                    | `SELECT CONCAT('Data','Base');`              | `DataBase`                    |                  |   |           |               |
| String concatenation operator  `SELECT 'Hello  'World';`       | `Hello World` |
| SUBSTRING()        | Extracts part of a string                 | `SELECT SUBSTRING('Database' FROM 1 FOR 4);` | `Data`                        |                  |   |           |               |
| LEFT()             | Returns leftmost characters               | `SELECT LEFT('PostgreSQL', 4);`              | `Post`                        |                  |   |           |               |
| RIGHT()            | Returns rightmost characters              | `SELECT RIGHT('PostgreSQL', 3);`             | `SQL`                         |                  |   |           |               |
| TRIM()             | Removes both leading & trailing spaces    | `SELECT TRIM('  hello  ');`                  | `hello`                       |                  |   |           |               |
| LTRIM()            | Removes leading spaces/characters         | `SELECT LTRIM('---hello','-');`              | `hello`                       |                  |   |           |               |
| RTRIM()            | Removes trailing spaces/characters        | `SELECT RTRIM('hello***','*');`              | `hello`                       |                  |   |           |               |
| REPLACE()          | Replace substring inside a string         | `SELECT REPLACE('abc123abc','abc','XYZ');`   | `XYZ123XYZ`                   |                  |   |           |               |
| POSITION()         | Find substring position                   | `SELECT POSITION('st' IN 'Postgres');`       | `3`                           |                  |   |           |               |
| REPEAT()           | Repeats a string N times                  | `SELECT REPEAT('Hi',3);`                     | `HiHiHi`                      |                  |   |           |               |
| REVERSE()          | Reverses a string                         | `SELECT REVERSE('SQL');`                     | `LQS`                         |                  |   |           |               |
| LPAD()             | Left-pad string to given length           | `SELECT LPAD('123', 6, '0');`                | `000123`                      |                  |   |           |               |
| RPAD()             | Right-pad string to given length          | `SELECT RPAD('123', 6, '0');`                | `123000`                      |                  |   |           |               |
| SPLIT_PART()       | Get Nth part after splitting by delimiter | `SELECT SPLIT_PART('a,b,c', ',', 2);`        | `b`                           |                  |   |           |               |
| BTRIM()            | Trim characters from both ends            | `SELECT BTRIM('@@Hello@@','@');`             | `Hello`                       |                  |   |           |               |
| Function                                    | Description                                                                  | Example                                        | Output       |
| ------------------------------------------- | ---------------------------------------------------------------------------- | ---------------------------------------------- | ------------ |
| CONCAT_WS(separator, str1, str2, ...)       | Concatenates strings using a **separator** (skips NULL values automatically) | `SELECT CONCAT_WS('-', '2025', '11', '28');`   | `2025-11-28` |
|                                             |                                                                              | `SELECT CONCAT_WS(' ', 'Sachin', NULL, 'SP');` | `Sachin SP`  |
|                                             |                                                                              | `SELECT CONCAT_WS(',', 'A', 'B', 'C');`        | `A,B,C`      |
