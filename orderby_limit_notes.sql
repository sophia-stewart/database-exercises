-- Notes on ORDER BY and LIMIT functions in SQL

USE employees;

-- ORDER BY Notes:
-- sorts results

SELECT first_name, 
       last_name
FROM employees
ORDER BY last_name;
-- Ascending order (ASC) is default;

SELECT first_name,
       last_name
FROM employees
ORDER BY last_name DESC;

-- Can chain ORDER BY commands to sort by multiple columns:
SELECT first_name,
       last_name
FROM employees
WHERE gender = 'F'
ORDER BY last_name DESC,
         first_name ASC;

-- LIMIT Notes:
-- limits the number of results

SELECT *
FROM employees
WHERE gender = 'M'
ORDER BY last_name
LIMIT 5;
-- only shows first 5 results based on specifications

-- OFFSET tells SQL where to begin retrieving data (OFFSET 5 means skip first 5 records, start at record 6)

SELECT *
FROM employees
WHERE gender = 'M'
ORDER BY last_name
LIMIT 5 OFFSET 10;
-- Shows first 5 records beginning from record 11

-- This gives same result as above (but can be confusing bc offset/limit order is reversed, best to avoid):
SELECT *
FROM employees
WHERE gender = 'M'
ORDER BY last_name
LIMIT 10,5;