#AddressbookService

# Create database

create database addressbook_service;

# Use the database

use addressbook_service;

# Create addressbook table

create table addressbook
(
   first_name    varchar(150) not null,
   last_name     varchar(150) not null,
   address       varchar(400), 
   city	   	 varchar(20),
   state	 varchar(20),
   zip		 int unsigned,
   phone_number	 int unsigned,
   email_id    	 varchar(100) not null,
   primary key   (email_id)
);

# Insert new contacts to address book

insert into addressbook
(first_name, last_name, address, city, state, zip, phone_number, email_id)
values
('Abhineet', 'Pratyush', 'D-108', 'Bangalore', 'Karnataka', 123456, 1234567891, 'abc@zy.com'),
('Ram', 'Kumar', 'X-989', 'Tumbaktu' ,'Eurasia', 456789, 7894561235, 'ram@hello.com');

# Edit existing contact using their name

update addressbook
set city = 'Gangtok' where first_name = 'Ram' and last_name = 'Kumar';

# Delete record using person's name

delete from addressbook where first_name = 'Ram' and last_name = 'Kumar';

# Ability to retrieve person belonging from a city or state

select * from addressbook where city = 'Bangalore' or state = 'Eurasia';

# Size of addressbook by city or state

select city, count(*) from addressbook group by city;

select state, count(*) from addressbook group by state;
