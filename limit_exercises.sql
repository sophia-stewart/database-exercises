-- LIMIT Exercises

USE employees;

-- 2. List the first 10 distinct last name sorted in descending order.
SELECT DISTINCT last_name
FROM employees
ORDER BY last_name DESC
LIMIT 10;
/*
Zykh
Zyda
Zwicker
Zweizig
Zumaque
Zultner
Zucker
Zuberek
Zschoche
Zongker
*/

-- 3. Find all previous or current employees hired in the 90s and born on Christmas. Find the first 5 employees hired in the 90's by sorting by hire date and limiting your results to the first 5 records. Write a comment in your code that lists the five names of the employees returned.
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5;
/* 
Alselm Cappello
Utz Mandell
Bouchung Schreiter
Baocai Kushner
Petter Stroustrup
*/

-- 4. Try to think of your results as batches, sets, or pages. The first five results are your first page. The five after that would be your second page, etc. Update the query to find the tenth page of results.
-- LIMIT and OFFSET can be used to create multiple pages of data. What is the relationship between OFFSET (number of results to skip), LIMIT (number of results per page), and the page number?
SELECT *
FROM employees
WHERE hire_date LIKE '199%'
AND birth_date LIKE '%12-25'
ORDER BY hire_date
LIMIT 5 OFFSET 45;
/* The limit specifies how many rows will appear on each page and the offset specifies at what point to begin displaying data and which page number will be shown.
Handy dandy formula found at https://www.petefreitag.com/item/451.cfm :
offset = (limit * pageNumber) - limit

offset = (5 * 10) - 5
offset = 45
*/