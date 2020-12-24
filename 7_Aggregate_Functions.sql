
-- COUNT --
use cinema_booking_system;

select * from customers;

-- count number of rows
select count(*) from customers; -- 120 rows in the customers table

-- count number of a particular column
select count(first_name) from customers; -- 114 value is returned as null value is not counted

select count(*) from customers
where last_name = 'Smith';

select count(*) from customers
where first_name is null;



-- SUM --
-- sum up all the values in a particular column. Cannot be used on *
-- Can only be applied on numerical columns
select sum(no_seats) from rooms;

select sum(no_seats) from rooms
where id > 1;



-- MIN AND MAX --
select max(length_min) from films; -- returns the maximum value in the selected column
select min(length_min) from films; -- returns the minimum value in the selected column

-- select name, max(length_min) from films; 
-- This will give an error because, name will return 12 rows but max() only returns one value.
-- We can go around this using the GROUP BY clause



-- AVERAGE --
-- Returns the average value in the selected column. It returns decimal values.
select avg(length_min) from films;

select avg(length_min) from films
where length_min > 120;



-- EXERCISE 1 --
-- How many bookings did customer id 10 make in October 2017
select count(*) from bookings
where customer_id = 10; -- 6

-- Count the number of screenings for Blade Runner 2049 in October 2017
select count(*) from screenings s
join films f on s.film_id = f.id
where f.name = 'Blade Runner 2049'; -- 24

-- Count the number of unique customers who made a booking for October 2017
select count(distinct(customer_id)) from bookings; -- 105
-- count distinct customer_id from customer_id columns.



-- GROUPING DATA --
-- Number of bookings per person
select customer_id, count(id) from bookings
group by customer_id; -- total id count per customer_id is returned

select customer_id, screening_id, count(id) from bookings
group by customer_id, screening_id; -- total id count per customer_id and screenng id combined is returned
-- any column other than aggregate function that we select, must appear in a group by clause.
-- A column returns all the values in the column but a aggregate function generally returns a
-- single value. That's why we need a GROUP BY clause.

select f.name, s.start_time,c.first_name, c.last_name, count(b.id) from films f
join screenings s on f.id = s.film_id
join bookings b on s.id = b.screening_id
join customers c on b.customer_id = c.id
group by f.name,s.start_time,c.first_name,c.last_name
order by s.start_time;



-- HAVING CLAUSE --
-- HAVING clauses acts like a WHERE clause but for GROUP BY clauses
select customer_id, screening_id, count(id) from bookings
group by customer_id, screening_id
having customer_id = 10;



-- EXERCISE 2 --
-- Select the customer id and the number of reserved seats grouped by customer for October 2017
select * from reserved_seat; -- booking_id, seat_id
select * from bookings; -- screening_id, customer_id
-- select * from customers;
select * from screenings; -- customer_id, start_time
select b.customer_id, count(rs.seat_id) from bookings b
join reserved_seat rs on b.id = rs.booking_id
group by b.customer_id;

-- Select the film name and count the number of screenings for each film that is over 2 hours long.
select f.name, f.length_min, count(s.id) from films f
join screenings s on f.id = s.film_id
group by f.name, f.length_min
having f.length_min > 120;



























