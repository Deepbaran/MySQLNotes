
use cinema_booking_system;

-- CONCATENATE --
-- Join data from multiple columns and return it into one column
-- SELECT CONCAT(column1,column2,...) AS new_column_name FROM table;

select concat(first_name,last_name) as full_name from customers;

select concat(first_name," ",last_name) as full_name from customers; -- Three strings will be concatenated. data in first_name + " " + data in last_name

select concat("This is ",first_name," ",last_name,"'s email: ",email) as customers_email from customers;

-- If we do not have a column name alias then the concatenated column name will be returned as the result column's column name



-- SUBSTRING --
-- SUBSTRING(string,start,length)
-- index starts from 1

select substring("Example",3,3) as Sub;

select substring(name,3,5) as sub_name from films;
-- If the start value exceeds the length of the string then the substring is empty (not null)
-- If the length exceeds the length of the string then substring ends when the string ends
-- start takes negative values. Putting negative number at start means that the start idex cycles back
-- start value -1 means the starting index is the last letter of the string



-- UPPER AND LOWER CASE --
-- SELECT UPPER(column1) AS new_column_name FROM table1;
select upper(name) as upper_name from rooms;

-- SELECT LOWER(column1) AS new_column_name FROM table1;
select lower(name) as lower_name from rooms;



-- EXERCISE 1 --
-- Concatenate the film names and length from the films table.

SELECT CONCAT(name,": ",length_min) AS film_info FROM films;

-- Extract the customers email from the 5th character onwards.

SELECT SUBSTRING(email,5) AS email_short FROM customers;

-- Select the customers first name in lower case and their last name in upper case 
-- for each customer with a last name of ‘Smith’.  

SELECT LOWER(first_name) AS first_name, UPPER(last_name) AS last_name FROM customers
WHERE last_name = 'Smith';

-- Select the last 3 letters of each film name from the films table.

SELECT SUBSTRING(name,-3) AS film_name FROM films;

-- Concatenate the first three letters in the first_name and last_name columns together 
-- from the customers table.

SELECT CONCAT(SUBSTRING(first_name,1,3)," ",SUBSTRING(last_name,1,3)) AS short_name
FROM customers;



-- DATE FUNCTION --
-- Date function extracts the date from a DATE or DATETIME data type column

select date('2018-06-05 07:45:32'); -- only the date part is extracted of this string

select date(start_time) from screenings;

-- Select all the data from the screening table where the date is equal to october 3rd 2017
select * from screenings
where date(start_time) = '2017-10-03';

-- Select all the data from the screening table where the date between october 3rd 2017 and october 5th 2017
select * from screenings
where date(start_time) between '2017-10-03' and '2017-10-05';



-- MONTH FUNCTION --
-- Month function extracts the month from a DATE or DATETIME data type column
select month('2018-06-05 07:45:32'); -- only the month part is extracted of this string

select month(start_time) as month from screenings;

-- Select all the data from the screening table for the month of october 2017
select * from screenings
where month(start_time) = '10';
-- month function returns the months of all years


-- YEAR FUNCTION --
-- Year function extracts the year from a DATE or DATETIME data type column
select year('2018-06-05 07:45:32'); -- only the year part is extracted of this string

select year(start_time) as year from screenings;

-- Select all the data from the screening table for the year 2017
select * from screenings
where year(start_time) = '2017';



-- EXERCISE 2 --
-- Select the film id and start time from the screenings table for the date of 20th of October 2017.

SELECT film_id, start_time FROM screenings
WHERE DATE(start_time) = '2017-10-20';

-- Select all the data from the screenings table for the start time between the 6th and 13th of 
-- October 2017.

SELECT * FROM screenings
WHERE DATE(start_time) BETWEEN '2017-10-06' AND '2017-10-13';

-- Select all the data from the screenings table for October 2017.

SELECT * FROM screenings
WHERE MONTH(start_time) = '10'
AND YEAR(start_time) = '2017';























