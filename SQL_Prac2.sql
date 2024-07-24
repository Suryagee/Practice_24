/*Tasks
1. Create Database:
○ Create a database named TechBooks.

2. Create Tables:
○ Create a table named Authors with the following columns:
■ author_id (INT, PRIMARY KEY, AUTO_INCREMENT)
■ name (VARCHAR(100))
■ country (VARCHAR(50))
○ Create a table named Books with the following columns:
■ book_id (INT, PRIMARY KEY, AUTO_INCREMENT)
■ title (VARCHAR(100))
■ author_id (INT, FOREIGN KEY referencing Authors)
■ publication_year (YEAR)
■ genre (VARCHAR(50))
■ price (DECIMAL(10,2))
○ Create a table named Sales with the following columns:
■ sale_id (INT, PRIMARY KEY, AUTO_INCREMENT)
■ book_id (INT, FOREIGN KEY referencing Books)*/
--------------------------------------------------
# Create a database named TechBooks.
create database TechBooks;
use TechBooks;
# Create Tables:Authors
Create table Authors (
author_id INT PRIMARY KEY AUTO_INCREMENT,
 name VARCHAR(100),
 country VARCHAR(50));
 select* from Authors;
 
 # Create a table named Books with the following columns:
 Create table Books(
 book_id INT PRIMARY KEY AUTO_INCREMENT,
 author_id INT ,
 title VARCHAR(100),
 publication_year YEAR,
 genre VARCHAR(50),
 price DECIMAL(10,2),
 foreign key (author_id) references  Authors(author_id)
 );


 select* from Books;
 /* Create a table named Sales with the following columns:
 sale_id (INT, PRIMARY KEY, AUTO_INCREMENT)
 book_id (INT, FOREIGN KEY referencing Books)*/
 
create table Sales (
sale_id INT PRIMARY KEY AUTO_INCREMENT,
book_id  INT,
sale_date DATE,
quantity INT,
foreign key (book_id) references Books(book_id));

select * from sales;
# ----------------------------Analysis----------------------

-- Insert records into the Authors table
INSERT INTO Authors (name, country) VALUES 
('John Doe', 'USA'),
('Jane Smith', 'UK'),
('Alice Johnson', 'Canada'),
('Robert Brown', 'Australia'),
('Emily Davis', 'USA');

-- Insert records into the Books table
INSERT INTO Books (title, author_id, publication_year, genre, price) VALUES 
('Learning SQL', 1, 2020, 'Technology', 29.99),
('Mastering Python', 2, 2018, 'Programming', 39.99),
('JavaScript Essentials', 3, 2019, 'Web Development', 24.99),
('Advanced Algorithms', 4, 2021, 'Computer Science', 49.99),
('Data Structures', 5, 2017, 'Computer Science', 34.99);

-- Insert records into the Sales table
INSERT INTO Sales (book_id, sale_date, quantity) VALUES 
(1, '2024-01-15', 10),
(2, '2024-02-20', 5),
(3, '2024-03-25', 8),
(4, '2024-04-30', 3),
(5, '2024-05-10', 7);
select* from books;
select* from authors;
select * from sales;
/*4.Select Data:
○ Select all books with their authors.
○ Select all sales data with book titles.*/

select b.title,a.name from authors a join books b
on a.author_id= b.author_id
;

select b.title , s.quantity, b.price*s.quantity as revenue from books b join sales s
on b.book_id= s.book_id
order by s.quantity;
/* 5. Conditional Queries:
○ Select books published after the year 2015.
○ Select sales records where the quantity sold is greater than 10 */
select b.title , b.publication_year from books b where  b.publication_year > '2015';
select * from sales s where s.quantity>=10;
/*Aggregation and Grouping:
○ Find the total number of books sold.
○ Find the total sales amount for each book*/

select sum(s.quantity) from sales s;
select b.book_id, b.title, sum(b.price* s.quantity) 
from books b join sales s
on b.book_id= s.book_id
group by b.book_id, b.title;
---------------------------------------
/* Filtering Groups:
○ Find authors who have more than 5 books.
○ Find books with total sales amount greater than $500 */

select a.author_id , count(book_id) as count from authors a join books b
on a.author_id=b.author_id
group by a.author_id
 having count>5;
 
select b.title, sum(b.price * s.quantity) as rev from books b
 join sales s on b.book_id= s.book_id
 group by b.title
 having rev > 200;
 /* Write a query to fetch book titles along with the names of their authors.
○ Write a query to fetch sales records with book titles and author names*/

select b.title, a.name from books b 
join authors a 
on b.author_id = a.author_id;

select b.title, a.name , s.quantity 
from books b join authors a
on b.author_id= a.author_id
join sales s on b.book_id=s.book_id;
# ----------------------------------------The End------------------------










