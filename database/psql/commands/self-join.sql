-- https://pgexercises.com/questions/joins/self.html
-- Produce a list of all members who have recommended another member
-- How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

select distinct m1.firstname, m1.surname
	from cd.members m1
	inner join cd.members m2
	on m2.recommendedby = m1.memid
	order by m1.surname, m1.firstname;