

use cinema_booking_system;

-- NON-CORRELATED SUBQUERIES --
select id, start_time from screenings
where film_id in
(select id from films
where length_min > 120);

-- Inner Query
select id from films
where length_min > 120;

select * from customers;
select * from bookings;

select first_name, last_name, email from customers
where id in
(select customer_id from bookings
where screening_id = 1);
-- first anme, last name and email of the customers are returned whose ids are equal to the customer ids in the bookings table 
-- with screening id 1.

select avg(no_seats), max(b.no_seats) from
(select booking_id, count(seat_id) as no_seats from reserved_seat
group by booking_id) b;
-- here the inner query is returning a table which we call a derived table. And we need to assign an alias to the derived table.



-- CORRELATED SUBQUERIES --
select screening_id, customer_id,
(select count(seat_id)
from reserved_seat where booking_id = b.id) -- whenever booking_id in reserved_seat table and id in bookings table is mathched,the inner query returns the count of the seat_id column i.e, total seats reserved by that booking id
from bookings b
order by screening_id;

select screening_id, customer_id
from bookings b
order by screening_id;

select * from reserved_seat;



-- EXERCISE --
-- 1. Select the film name and length for all films with a length greater than the average film length
select * from films;
select avg(length_min) from films;
select name, length_min from films
where length_min > (
	select avg(length_min) from films
); -- 17 films

-- 2. Select the maximum number and the minimum number of screenings for a particular film
select * from screenings;
select * from bookings;
select film_id, count(id) from screenings
group by film_id; -- returns total count of screenings for each film id

select max(t.id), min(t.id) from 
(
	select film_id, count(id) as id from screenings
    group by film_id
) t;

-- 3. Select each film name and the number of screenings for the film.
select * from films;
select * from screenings;

select film_id, count(id) from screenings
group by film_id; -- first we find screening count for each film

-- SOLUTION
select f.name, (t.screening_count) from films f
join (
	select film_id, count(id) as screening_count from screenings
	group by film_id
) t on f.id = t.film_id;

-- ALTERNATIVE
select name,
(select count(id) from screenings
where film_id = f.id)
from films f;












































