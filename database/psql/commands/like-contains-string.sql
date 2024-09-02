-- case sensitive
select * from table_name where name like '%string%';
select * from table_name where name like '%String%';

-- case insensitive - insensitive like
select * from table_name where name ilike '%string%';
