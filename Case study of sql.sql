Case study of Sql

case study 1

create database libraryDB;
use libraryDB;
#Books Table:      

create table books(id int primary key auto_increment,
title varchar(100) not null,
author varchar(60) not null,
published_year year not null,
genre varchar(30)
);
insert into books values('1','To Kill a Mockingbird','Harper Lee','1960','Fiction_Drama'),
('2','The Great Gatsby','F. Scott Fitzgerald','1925','Fiction_Classic'),
('3','Harry Potter and the Sorcerers Stone','J.K. Rowling','1997','Fantasy_Adventure');
select*from books;

#Members Table:      
create table membertable(id int primary key auto_increment,
mem_name varchar(60),
membership_date date not null);
insert into membertable values('001','omisha','2025-01-21'),
('002','tuhin','2025-02-25'),
('003','maha','2024-03-31');
select*from membertable;



#Borrowing Table
create table Borrowingtable(id int primary key auto_increment,
book_id int,
foreign key(book_id) references books(id),
mem_id int,
foreign key(mem_id) references membertable(id),
borrow_date date not null,
return_date date);
insert into Borrowingtable values('12','1','001','2025-01-23','2025-03-09'),
('13','2','002','2025-02-15','2025-04-22'),
('14','3','003','2025-03-25','2025-06-19');
select*from Borrowingtable;




CASE STUDY 2


create database studentDB;
use studentDB;


#Students Table
create table studenttable(id int primary key auto_increment,
stu_name varchar(50) not null,
age int not null,
email varchar(50) not null);
insert into studenttable values('7','moni','32','moni2000@gmail.com'),
('8','sheeba','21','sheeba1999@gmail.com'),
('9','afrin','45','afrin2001@gmail.com');
select*from studenttable;

#courses Table
create table courses(id int primary key auto_increment,
courses_nam varchar(70) not null);
insert into courses values('01','Python'),
('02','MySQL'),('03','Maths');
select*from courses;

#enrollments Table
create table enrolledment(
    student_id int,
    course_id int,
    grade char(1),
    foreign key(student_id) references studenttable(id),
    foreign key(course_id) references courses(id),
    primary key(student_id, course_id)
);
insert into enrolledment values
('7','01','A'),
('8','02','O'), 
('9','03','A');
select*from enrolledment;


CASE STUDY 3

create database RetailDB;
use RetailDB;

# Products Table
create table productstable(id int primary key auto_increment,
product_name varchar(50) not null,
price decimal(10,2) not null,
stock int not null);
insert into productstable values('21','Electronics','23.0','5'),
('22','Clothing & Apparel','33.8','6'),
('23','Home Goods','56.0','2');
select * from productstable;


#suppliers table
create table suppliestable(id int primary key auto_increment,
sup_nam varchar(50) not null,
contact varchar(50));
insert suppliestable values('21','Apple iPhone 14','omisha'),
('22','Under Armour Running Shorts','tuhin'),
('23','Vitamix 5200 Blender','maha');
select*from suppliestable;


