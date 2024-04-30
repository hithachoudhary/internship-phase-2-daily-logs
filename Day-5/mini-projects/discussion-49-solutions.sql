-- 1. Basic Data Selection
select name,continent,population from country;

-- 2. Using Aliases for Columns and Tables
select name AS 'Country Name' from country AS c;

-- 3. Filtering Data with Basic WHERE Clauses
select name,population from country WHERE continent='Europe' AND population>10000000;

-- 4. Combining Conditions with AND, OR
select Name,CountryCode from city where CountryCode='POL' OR CountryCode='BEL';

-- 5. Sorting Results with ORDER BY
select Name,LifeExpectancy from country WHERE Continent='South America' ORDER BY LifeExpectancy DESC;

-- 6. Limiting Results with LIMIT
select Name,Population from city ORDER BY Population DESC LIMIT 7;
select Name,Population from city ORDER BY Population DESC LIMIT 2 OFFSET 4;
