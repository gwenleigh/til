-- Produce a list of all members who have used a tennis court
-- How can you produce a list of all members who have used a tennis court? Include in your output the name of the court, and the name of the member formatted as a single column. Ensure no duplicate data, and order by the member name followed by the facility name.

select distinct m.firstname || ' ' || m.surname as name, f.name as facility
	from cd.members m
	inner join cd.bookings b
	on b.memid = m.memid
	inner join cd.facilities f
	on b.facid = f.facid
	where f.name ilike '%tennis court%'
	order by name, facility;
