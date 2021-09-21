-- 2. Use the albums_db database.
USE albums_db;

-- 3. Explore the structure of the albums table.
DESCRIBE albums;
SELECT * FROM albums;
-- Also  viewed Structure/Table Info tabs in GUI to explore structure of albums table;

-- 3a. How many rows are in the albums table?
SELECT COUNT(*) AS 'rows'
FROM albums;
-- There are 31 rows in the albums table;

-- 3b. How many unique artist names are in the albums table?
SELECT DISTINCT artist
FROM albums;
SELECT COUNT(DISTINCT artist)
FROM albums;
-- There are 23 unique artist names in the albums table;

-- 3c. What is the primary key for the albums table?
SHOW CREATE TABLE albums;
-- 'id' is the primary key for the albums table;

-- 3d. What is the oldest release date for any album in the albums table? What is the most recent release date?
SELECT MIN(release_date),
       MAX(release_date)
FROM albums;
-- 1967 is the oldest release date for any album in the albums table. 2011 is the most recent release date for any album in the albums table;

-- 4. Write queries to find the following information:
-- 4a. The name of all albums by Pink Floyd
SELECT name AS 'Pink Floyd Albums'
FROM albums
WHERE artist = 'Pink Floyd';

-- 4b. The year Sgt. Pepper's Lonely Hearts Club Band was released
SELECT release_date
FROM albums
WHERE name = "Sgt. Pepper's Lonely Hearts Club Band";

-- 4c. The genre for the album Nevermind
SELECT genre
FROM albums
WHERE name = 'Nevermind';

-- 4d. Which albums were released in the 1990s
SELECT name AS "'90s Albums"
FROM albums
WHERE release_date >= 1990
AND release_date <= 1999;

-- 4e. Which albums had less than 20 million certified sales
SELECT name AS 'Sold < 20 Million'
FROM albums
WHERE sales < 20;

-- 4f. All the albums with a genre of "Rock". Why do these query results not include albums with a genre of "Hard rock" or "Progressive rock"?
SELECT name AS 'Rock Albums'
FROM albums
WHERE genre = 'Rock';
-- Albums with a genre of 'Hard rock' or 'Progressive rock' are not included in these query results because they do not /exactly/ match the query entry, 'Rock'; they include words/characters that are not in the query I entered.

