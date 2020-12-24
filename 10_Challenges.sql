
-- CHALLENGE 1 --
-- 1. Which films are over 2 hours long?
select name from films
where length_min > 120;
-- SOLUTION
SELECT name, length_min FROM films
WHERE length_min > 120;



-- CHALLENGE 2 --
-- 1. Which film had the most screenings in October 2017
--
-- SOLUTION
SELECT f.name, COUNT(s.film_id) AS showings FROM screenings s
JOIN films f ON f.id = s.film_id
GROUP BY film_id
ORDER BY showings DESC
LIMIT 1;



-- CHALLENGE 3 --
-- 1. How many bookings did the film 'Jigsaw' have in October 2017
select * from bookings;
select * from screenings;
select * from films;
select * from customers;

select id from films
where name = 'Jigsaw';

select id from screenings
where film_id = (
select id from films
where name = 'Jigsaw'
);

select count(*) from bookings
where screening_id in (
select id from screenings
where film_id = (
select id from films
where name = 'Jigsaw'
)
);
-- SOLUTION
SELECT COUNT(*) AS no_bookings FROM bookings 
WHERE screening_id IN
(SELECT id FROM screenings 
WHERE film_id = 5);



-- CHALLENGE 4 --
-- 1. Which 5 customers made the most bookings in October 2017
select * from bookings;
select * from customers;

select c.first_name,c.last_name,count(b.customer_id) as customer from bookings b
join customers c on b.customer_id = c.id
group by c.first_name, c.last_name
order by customer desc
limit 5;
-- SOLUTION
SELECT c.first_name, c.last_name, COUNT(b.id) AS no_bookings FROM bookings b 
JOIN customers c ON c.id = b.customer_id
GROUP BY c.first_name, c.last_name
ORDER BY no_bookings DESC
LIMIT 5;



-- CHALLENGE 5 --
-- 1. Which film was shown in the Chaplin room most often in October 2017
select * from rooms;
select * from films;
select * from screenings; -- film_id, room_id

select f.name, count(r.name) as screening_no from films f
join screenings s on f.id = s.film_id
join rooms r on s.room_id = r.id
where r.name = 'Chaplin'
group by f.name
order by screening_no desc
limit 1;
-- SOLUTION
SELECT f.name, COUNT(r.name) AS no_screenings FROM films f
JOIN screenings s ON f.id = s.film_id 
JOIN rooms r ON r.id = s.room_id
WHERE r.id = 1
GROUP BY f.name
ORDER BY no_screenings DESC
LIMIT 1;



-- CHALLENGE 6 --
-- 1. How many of the customers made a booking in October 2017
--
-- SOLUTION
SELECT COUNT(*) FROM customers;

SELECT * FROM bookings;

SELECT COUNT(DISTINCT(customer_id)) AS no_of_customers FROM bookings;


















