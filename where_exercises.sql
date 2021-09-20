USE employees;

-- 2. 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya');
-- 709 records returned;

-- 3. 
SELECT *
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya';
-- 709 records returned; same number of rows as Q2;

-- 4.
SELECT *
FROM employees
WHERE (
	first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
	)
AND gender = 'M';
-- 441 records returned;

-- 5.
SELECT *
FROM employees
WHERE last_name LIKE 'E%';
-- 7330 employees whose last name starts with E;

-- 6.
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
OR last_name LIKE '%E';
-- 30723 employees whose last name starts or ends with E;
SELECT *
FROM employees
WHERE last_name LIKE '%E'
AND NOT last_name LIKE 'E%';
-- Alternatively/double check:
SELECT 30723 - 7330;
-- 23393 employees whose last name ends with E but does not starts with E;

-- 7.
SELECT *
FROM employees
WHERE last_name LIKE 'E%'
AND last_name LIKE '%E';
-- 899 employees whose last name starts and ends with E;
SELECT *
FROM employees
WHERE last_name LIKE '%E';
-- 24292 employees whose last name ends with E, regardless of whether they start with E;

-- 8.
SELECT *
FROM employees
WHERE hire_date BETWEEN '1990-01-01' AND '1999-12-31';
-- 135214 employees returned;

-- 9.
SELECT *
FROM employees
WHERE birth_date LIKE '%12-25';
-- 842 employees returned;

-- 10.
SELECT *
FROM employees
WHERE (
	hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	)
AND birth_date LIKE '%12-25';
-- 362 employees returned;

-- 11.
SELECT *
FROM employees
WHERE last_name LIKE '%q%';
-- 1873 records returned;

-- 12.
SELECT *
FROM employees
WHERE last_name LIKE '%q%'
AND NOT last_name LIKE '%qu%';
-- 547 employees are found;