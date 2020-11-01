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

# Retrieve entries sorted alphabetically by person's name for a given city

select * from addressbook where city = 'Bangalore' order by first_name;

# Alter addressbook to add fields name and type

alter table addressbook add addressbook_name varchar(20) after email_id;

alter table addressbook add addressbook_type varchar(20) after addressbook_name;

update addressbook set addressbook_type = 'Friends' where first_name =  'Abhineet';

update addressbook set addressbook_name = 'College Friends' where first_name = 'Abhineet';

update addressbook set addressbook_type = 'Family' where first_name =  'Ram';

update addressbook set addressbook_name = 'Home' where first_name =  'Ram';

# Get number of contact persons by type

select addressbook_type, count(*) from addressbook group by addressbook_type;

# Ability to add persons to both friend and family

insert into addressbook
(first_name, last_name, address, city, state, zip, phone_number, email_id, addressbook_name, addressbook_type)
values
('Varun', 'Sharma', 'Y-108', 'Vadadora', 'Gujarat', 123446, 1234557891, 'abc@zt.com', 'School Friends', 'Friends'),
('Shyam', 'Rana', 'Z-989', 'Mysuru' ,'Karnataka', 356789, 7894561234, 'shyam@hello.com', 'Relatives', 'Family');

# Normalize the database according to the ER diagram

 create table address_details
(
    email_id varchar(100) not null,
    first_name varchar(150) not null,
	last_name varchar(150) not null,
    address varchar(400),
    city varchar(20),
    state varchar(20),
	zip int unsigned,
    phone_number int unsigned,
    primary key(email_id)  
);

 create table addressbook_type
 (
   type varchar(50) not null,
   primary key(type)
);

alter table addressbook_type rename column type to addressbook_type;

create table addressbook_name
(
addressbook_name varchar(50) not null,
addressbook_type varchar(50) not null,
primary key (addressbook_name),
foreign key(addressbook_type) references addressbook_type(addressbook_type)
);

create table address_details_addressbook_name
(
email_id varchar(100) not null,
addressbook_name varchar(50) not null,
foreign key(email_id) references address_details(email_id),
foreign key(addressbook_name) references addressbook_name(addressbook_name)
);

insert into address_details
values
('abc@zu.com', 'Abhineet', 'Pratyush', 'D-109', 'Bnglr', 'Karnataka', 123345, 274235467),
('a34c@zy.com', 'Ram', 'Sagar', 'E-109', 'Vadadora', 'Gujarat', 123345, 3742354537),
('afdf_c@xy.com', 'Birla', 'Nagar', '6-D Rose', 'Venice', 'France', 123345, 373454537);

insert into addressbook_type
values
('Family'),
'Friends');

insert into addressbook_name
values
('College Friends', 'Friends'),
('Home', 'Family'),
('School Friends', 'Friends'),
('Relatives', 'Family');

insert into address_details_addressbook_name
values
('a34c@zy.com', 'School Friends'),
('abc@zu.com', 'Relatives'),
('afdf_c@xy.com', 'College Friends');
