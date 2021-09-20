USE employees;

SELECT *
FROM employees
WHERE gender = "M";

SELECT *
FROM employees
WHERE hire_date = '1986-01-01';

SELECT *
FROM employees
WHERE first_name LIKE '%sus%';

SELECT *
FROM employees
WHERE first_name LIKE 'sus%';

SELECT *
FROM employees
WHERE first_name LIKE '%sa';

SELECT DISTINCT first_name
FROM employees
WHERE first_name LIKE '%sus%';

SELECT emp_no,
       first_name,
          last_name
FROM employees
WHERE emp_no BETWEEN 10026 AND 10082;

SELECT *
FROM employees
WHERE first_name IN ('Satosi', 'Satish', 'Saniya', 'Sumant');

SELECT *
FROM employees
WHERE last_name = 'Herber'
OR last_name = 'Baek';

SELECT *
FROM employees
WHERE last_name = 'Herber'
AND gender = 'F';

SELECT *
FROM employees
WHERE last_name IN ('Herber', 'Baek')
AND emp_no < 20000;

/*
ORDER OF OPERATIONS:
Parentheses > NOT > AND > OR
*/

SELECT *
FROM employees
WHERE (last_name = 'Herber' OR last_name = 'Baek'
OR first_name = 'Sridhar')
AND emp_no <20000;

-- Is different from:

SELECT *
FROM employees
WHERE last_name = 'Herber' OR last_name = 'Baek'
OR first_name = 'Sridhar'
AND emp_no <20000;


-- NULL = missing value

SELECT NULL = NULL;
-- Is NULL; has no meaning. Same for NULL = 2, cannot compare something to nothing

USE curriculum_logs;

SELECT *
FROM logs
WHERE cohort_id IS NULL;

-- Special SQL function to find null values: 'x IS NULL' rather than 'x = NULL'

SELECT *
FROM logs
WHERE cohort_id IS NOT NULL
AND user_id = 40;

USE employees;

SELECT *
FROM employees
WHERE first_name LIKE 'eb%'
AND NOT first_name LIKE '%e';