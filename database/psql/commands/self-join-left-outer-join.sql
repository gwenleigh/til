-- https://pgexercises.com/questions/joins/self.html
-- Produce a list of all members who have recommended another member
-- How can you output a list of all members who have recommended another member? Ensure that there are no duplicates in the list, and that results are ordered by (surname, firstname).

select distinct m1.firstname, m1.surname
	from cd.members m1
	inner join cd.members m2
	on m2.recommendedby = m1.memid
	order by m1.surname, m1.firstname;

-- LEFT OUTER JOIN
-- https://pgexercises.com/questions/joins/self2.html
-- Produce a list of all members, along with their recommender
-- How can you output a list of all members, including the individual who recommended them (if any)? Ensure that results are ordered by (surname, firstname).

select m1.firstname as memfname, 
		m1.surname as memsname, 
		m2.firstname as recfname, 
		m2.surname as recsname
	from cd.members m1
	left join cd.members m2
	on m1.recommendedby = m2.memid
	order by m1.surname, m1.firstname;


-- A LEFT OUTER JOIN operates similarly, except that if a given row on the left hand table doesn't match anything, it still produces an output row. That output row consists of the left hand table row, and a bunch of NULLS in place of the right hand table row.

-- This is useful in situations like this question, where we want to produce output with optional data. We want the names of all members, and the name of their recommender if that person exists. You can't express that properly with an inner join.

-- As you may have guessed, there's other outer joins too. The RIGHT OUTER JOIN is much like the LEFT OUTER JOIN, except that the left hand side of the expression is the one that contains the optional data. The rarely-used FULL OUTER JOIN treats both sides of the expression as optional.