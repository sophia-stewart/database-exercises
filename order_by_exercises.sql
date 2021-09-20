-- ORDER BY Exercises

USE employees;

-- 2. 
SELECT *
FROM employees
WHERE first_name IN ('Irena', 'Vidya', 'Maya')
ORDER BY first_name;
-- Irena Reutenauer is in the first row of the results, and Vidya Simmen is the last person in the table;

-- 3. 
SELECT *
FROM employees
WHERE first_name = 'Irena'
OR first_name = 'Vidya'
OR first_name = 'Maya'
ORDER BY first_name,
         last_name;
-- Irena Acton is in the first row of the results, and Vidya Zweizig is the last person in the table;

-- 4.
SELECT *
FROM employees
WHERE first_name = 'Irena'
	OR first_name = 'Vidya'
	OR first_name = 'Maya'
ORDER BY last_name,
         first_name;
-- Irena Acton is in the first row of the results, and Maya Zyda is the last person in the table;

-- 5.
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY emp_no;
-- 899 employees returned. The first employee listed is 10021 Ramzi Erde. The last employee listed is 499648 Tadahiro Erde;

-- 6.
SELECT *
FROM employees
WHERE last_name LIKE 'E%E'
ORDER BY hire_date DESC;
-- 899 employees returned. The newest employee is Teiji Eldridge. The oldest employee is Sergi Erde;

-- 7.
SELECT *
FROM employees
WHERE (
	hire_date BETWEEN '1990-01-01' AND '1999-12-31'
	)
AND birth_date LIKE '%12-25'
ORDER BY birth_date,
         hire_date DESC;
-- 362 employees returned. The oldest employee who was hired last is Khun Bernini. The youngest employee who was hired first is Douadi Pettis;