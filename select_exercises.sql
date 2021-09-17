-- 2.
USE albums_db;

-- 3.
DESCRIBE albums;
SELECT * FROM albums;
-- Also  viewed Structure/Table Info tabs in GUI to explore structure of albums table;

-- 3a.
SELECT COUNT(*) AS 'rows'
FROM albums;
-- There are 31 rows in the albums table;

-- 3b.
SELECT DISTINCT artist
FROM albums;
-- There are 23 unique artist names in the albums table;

-- 3c.
SHOW CREATE TABLE albums;
-- 'id' is the primary key for the albums table;

-- 3d.
SELECT MIN(release_date),
       MAX(release_date)
FROM albums;
-- 1967 is the oldest release date for any album in the albums table. 2011 is the most recent release date for any album in the albums table;

-- 4a.
SELECT name AS 'Pink Floyd Albums'
FROM albums
WHERE artist = 'Pink Floyd';

-- 4b.
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- 4c.
SELECT genre
FROM albums
WHERE name = 'Nevermind';

-- 4d.
SELECT name AS "'90s Albums"
FROM albums
WHERE release_date >= 1990
AND release_date <= 1999;

-- 4e.
SELECT name AS 'Sold < 20 Million'
FROM albums
WHERE sales < 20;

-- 4f.
SELECT name AS 'Rock Albums'
FROM albums
WHERE genre = 'Rock';
-- Albums with a genre of 'Hard rock' or 'Progressive rock' are not included in these query results because they do not /exactly/ match the query entry, 'Rock'; they include words/characters that are not in the query I entered.

