--  You should specify the join conditions before applying any filters.

SELECT b.starttime
    FROM cd.bookings b
    INNER JOIN cd.members m
    ON m.memid = b.memid
    WHERE m.firstname ILIKE '%david%' and m.surname ILIKE '%farrell%';