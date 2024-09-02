-- https://pgexercises.com/questions/basic/agg.html
-- You'd like to get the signup date of your last member. How can you retrieve this informati

select joindate from cd.members order by joindate desc limit 1;

select firstname, surname, joindate from cd.members order by joindate desc limit 1;