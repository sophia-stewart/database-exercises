-- FUNCTION EXERCISES

USE employees;

-- 2. 
SELECT CONCAT(first_name, ' ', last_name) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- 3.
SELECT UPPER(CONCAT(first_name, ' ', last_name)) AS full_name
FROM employees
WHERE last_name LIKE 'E%E';

-- 4.
SELECT *,
       DATEDIFF(NOW(), hire_date) AS days_employed
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25';

-- 5.
SELECT MIN(salary) AS smallest_current_salary,
       MAX(salary) AS largest_current_salary
FROM salaries
WHERE to_date = '9999-01-01';

-- 6.
SELECT lower(
         CONCAT(
          SUBSTR(first_name, 1, 1),
                SUBSTR(last_name, 1, 4),
                '_',
                  SUBSTR(birth_date, 6, 2),
                  SUBSTR(birth_date, 3, 2)
          )) AS username,
          first_name,
          last_name,
          birth_date
FROM employees;