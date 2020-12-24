
/* Create the test Database */
CREATE DATABASE test;
USE test;

CREATE TABLE addresses (
	id INT,
    house_number INT,
    city VARCHAR(20),
	postcode VARCHAR(6)
);

CREATE TABLE people (
	id INT,
    first_name VARCHAR(20),
    last_name VARCHAR(20),
    address_id INT
);

CREATE TABLE pets (
	id INT,
    name VARCHAR(20),
    species VARCHAR(20),
    owner_id INT
);

SHOW TABLES;



-- ADD AND REMOVE PRIMARY KEYS --
-- SQL to add Primary Key
/*
ALTER TABLE <tablename>
ADD PRIMARY KEY (columnname);
*/

-- SQL to remove Primary Key
/*
ALTER TABLE <tablename>
DROP PRIMARY KEY;
*/

DESCRIBE addresses; -- Gives information about addresses table

ALTER TABLE addresses
ADD PRIMARY KEY (id); -- id column is set to be Primary Key in addresses table

ALTER TABLE addresses
DROP PRIMARY KEY;

/* NOTE:
Initially all columns except Primary key column, can accept Null. Once we make a column Primary key, it can no longer accept Null value.
Even if we remove it as primary key.
*/

DESCRIBE people;
ALTER TABLE people
ADD PRIMARY KEY (id);

DESCRIBE pets;
ALTER TABLE pets
ADD PRIMARY KEY (id);



-- ADD AND REMOVE FOREIGN KEYS --
-- SQL to add a Foreign Key
/*
ALTER TABLE <tablename>
ADD CONSTRAINT <constraintname>
FOREIGN KEY (<columnname>) REFERENCES <tablename>(<columnname>);
*/

-- SQL to remove a Foreign Key
/*
ALTER TABLE <tablename>
DROP FOREIGN KEY <constraintname>;
-- Remove the Foreign key index explicitly
alter table <tablename>
drop index <constraintname>;
*/

DESCRIBE addresses;
DESCRIBE people;

ALTER TABLE people
ADD CONSTRAINT FK_PeopleAddress -- This is the name of the Foreign key that has beed added as a new constraint
FOREIGN KEY (address_id) REFERENCES addresses(id); -- The referenced column must be a Primary Key
-- address_id is the referencing column and id is the referenced column

ALTER TABLE people
DROP FOREIGN KEY FK_PeopleAddress;

alter table people
drop index FK_PeopleAddress;



-- ADD UNIQUE CONSTRAINT -- 
-- A column with UNIQUE CONSTRAINT means that there will be no duplicate values in that column
-- SQL to add a UNIQUE CONSTRAINT to a Column
/*
alter table <tablename>
add constraint <constraintname> unique (<columnname>);
*/

-- SQL to remove a UNIQUE CONSTRAINT from a column
/*
alter table <tablename>
drop index <constraintname>
*/

select * from pets; -- all the rows and columns are selected
describe pets;

alter table pets
add constraint u_species unique (species);

alter table pets
drop index u_species;



-- CHANGE COLUMN NAME --
-- SQL to rename a column
/*
alter table <tablename> change `old_column_name` `new_column_name` <data type>
*/

select * from pets;

alter table pets change `species` `animal_type` VARCHAR(20);
alter table pets change `animal_type` `species` VARCHAR(20);



-- CHANGE COLUMN DATA TYPE --
-- SQL to change a column's Data Type
/*
alter table <tablename> modify <columnname> <data type>
*/

describe addresses;

alter table addresses modify city varchar(20);

-- We need to be carefu of changing the data type of a column. If there is any data in the column then if the data is not compatible to our
-- changes then it will not be modified.. So, forchanging the data type of a column, take into consideration of the data that is already in it.



-- EXERCISE --
-- Add a primary key to the id fields in the pets and people tables
describe pets; -- ALready added
describe people; -- Already added

-- Add a foreign key to the owner_id field in the pets table referencing the id field in the people table
alter table pets
add constraint fk_peoplePets
foreign key (owner_id) references people(id);

-- Add a column named email to the people table
alter table people
add column email varchar(100);

-- Add a unique constraint to the email column in the people table
alter table people
add constraint u_email unique (email);

-- rename the name column in the pets table to 'first_name'
alter table pets change `name` `first_name` varchar(20);

-- change the postcode data type to char(6) in the addresses table
describe addresses;
alter table addresses modify postcode char(6);


















