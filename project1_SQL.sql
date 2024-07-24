create database Online_Retail;
use Online_retail;
-- Relationships
/* Customers to Orders: One-to-Many (One customer can have many orders). -- This is multiple line comment
Orders to OrderDetails: One-to-Many (One order can have many order details).
Products to OrderDetails: Many-to-Many (A product can appear in many order details, and an order detail can contain many products) */

CREATE TABLE Customers (
    CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    FirstName VARCHAR(50) NOT NULL,
    LastName VARCHAR(50) NOT NULL,
    Email VARCHAR(100) NOT NULL UNIQUE,
    PhoneNumber VARCHAR(15),
    Address VARCHAR(255),
    City VARCHAR(50),
    State VARCHAR(50),
    ZipCode VARCHAR(10),
    Country VARCHAR(50)
);
-- Products Table

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Descriptions TEXT,
    Price DECIMAL(10, 2) NOT NULL,
    StockQuantity INT NOT NULL
);
-- Orders Table

CREATE TABLE Orders (
    OrderID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerID INT,
    OrderDate DATETIME NOT NULL,
    TotalAmount DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);
-- OrderDetails Table

CREATE TABLE OrderDetails (
    OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT,
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    Subtotal DECIMAL(10, 2) GENERATED ALWAYS AS (Quantity * UnitPrice) STORED,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID) ON DELETE CASCADE,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);
# This schema ensures referential integrity and defines clear relationships between the tables.
/*Insert Sample Data:


Populate the tables with sample data to simulate a variety of products, customers, and orders.


Query for Sales Reporting:


Write SQL queries to retrieve:

Total sales for each product.
Top-selling products.
Total revenue for a specific time period*/

-- Customer Analytics:
---------------------------------------------------------------------------------
INSERT INTO Customers (FirstName, LastName, Email, PhoneNumber, Address, City, State, ZipCode, Country) VALUES
('John', 'Doe', 'john.doe@example.com', '1234567890', '123 Main St', 'Anytown', 'Anystate', '12345', 'USA'),
('Jane', 'Smith', 'jane.smith@example.com', '2345678901', '456 Elm St', 'Othertown', 'Otherstate', '23456', 'USA'),
('Alice', 'Johnson', 'alice.johnson@example.com', '3456789012', '789 Oak St', 'Sometown', 'Somestate', '34567', 'USA'),
('Bob', 'Williams', 'bob.williams@example.com', '4567890123', '101 Pine St', 'Yourtown', 'Yourstate', '45678', 'USA'),
('Charlie', 'Brown', 'charlie.brown@example.com', '5678901234', '202 Maple St', 'Heretown', 'Herestate', '56789', 'USA'),
('David', 'Davis', 'david.davis@example.com', '6789012345', '303 Birch St', 'Thistown', 'Thisstate', '67890', 'USA'),
('Emily', 'Wilson', 'emily.wilson@example.com', '7890123456', '404 Cedar St', 'Thatown', 'Thatstate', '78901', 'USA'),
('Frank', 'Miller', 'frank.miller@example.com', '8901234567', '505 Spruce St', 'Someothertown', 'Someotherstate', '89012', 'USA'),
('Grace', 'Moore', 'grace.moore@example.com', '9012345678', '606 Fir St', 'Yetanothertown', 'Yetanotherstate', '90123', 'USA'),
('Hannah', 'Taylor', 'hannah.taylor@example.com', '0123456789', '707 Walnut St', 'Lasttown', 'Laststate', '01234', 'USA');
Insert Records into Products Table

INSERT INTO Products (ProductName, Description, Price, StockQuantity) VALUES
('Product A', 'Description for Product A', 10.99, 100),
('Product B', 'Description for Product B', 15.99, 200),
('Product C', 'Description for Product C', 20.99, 150),
('Product D', 'Description for Product D', 25.99, 80),
('Product E', 'Description for Product E', 30.99, 120),
('Product F', 'Description for Product F', 35.99, 90),
('Product G', 'Description for Product G', 40.99, 60),
('Product H', 'Description for Product H', 45.99, 110),
('Product I', 'Description for Product I', 50.99, 130),
('Product J', 'Description for Product J', 55.99, 70);
#Insert Records into Orders Table

INSERT INTO Orders (CustomerID, OrderDate, TotalAmount) VALUES
(1, '2024-01-01 10:00:00', 100.00),
(2, '2024-02-01 11:00:00', 150.00),
(3, '2024-03-01 12:00:00', 200.00),
(4, '2024-04-01 13:00:00', 250.00),
(5, '2024-05-01 14:00:00', 300.00),
(6, '2024-06-01 15:00:00', 350.00),
(7, '2024-07-01 16:00:00', 400.00),
(8, '2024-08-01 17:00:00', 450.00),
(9, '2024-09-01 18:00:00', 500.00),
(10, '2024-10-01 19:00:00', 550.00);
#Insert Records into OrderDetails Table

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 10.99),
(1, 2, 1, 15.99),
(2, 3, 3, 20.99),
(2, 4, 1, 25.99),
(3, 5, 4, 30.99),
(3, 6, 1, 35.99),
(4, 7, 2, 40.99),
(4, 8, 1, 45.99),
(5, 9, 5, 50.99),
(5, 10, 1, 55.99),
(6, 1, 6, 10.99),
(6, 2, 1, 15.99),
(7, 3, 7, 20.99),
(7, 4, 1, 25.99),
(8, 5, 8, 30.99),
(8, 6, 1, 35.99),
(9, 7, 9, 40.99),
(9, 8, 1, 45.99),
(10, 9, 10, 50.99),
(10, 10, 1, 55.99);
# These queries insert 10 records into each of the Customers, Products, Orders, and OrderDetails tables, ensuring each table has data for further operations or analysis.



/*Identify customers with the highest order frequency.

Find customers who made the largest single purchase.



Inventory Management:


Implement queries to track product inventory levels.

Identify products that need restocking */
