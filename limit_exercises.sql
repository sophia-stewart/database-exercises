-- LIMIT Exercises

USE employees;

-- 2.
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

-- 3.
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

-- 4.
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