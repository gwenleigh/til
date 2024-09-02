-- https://pgexercises.com/questions/basic/unique.html
-- DISTINCT
-- ORDER BY column_name [ASC | DESC]

select distinct surname from cd.members order by surname asc limit 10;