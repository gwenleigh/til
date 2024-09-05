-- https://pgexercises.com/questions/joins/simplejoin2.html
-- How can you produce a list of the start times for bookings for tennis courts, for the date '2012-09-21'? Return a list of start time and facility name pairings, ordered by the time.
-- Truncate date DATE_TRUNC('day', b.starttime) = '2012-09-21'

select b.starttime as start, f.name
	from cd.bookings b
	inner join cd.facilities f
	on f.facid = b.facid
	where f.name ilike '%tennis court%' 
		and DATE_TRUNC('day', b.starttime) = '2012-09-21'
	order by b.starttime;