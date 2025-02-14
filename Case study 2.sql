Case study 2

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
