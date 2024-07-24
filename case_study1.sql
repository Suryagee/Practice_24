create database e_commerce;
use e_commerce;


CREATE TABLE customers (
	customer_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(20),
    address VARCHAR(255)
);


INSERT INTO customers(name , email , phone ,address) VALUES 
('Alice','alice@gmail.com','1234567890','123 Elm Street'),
('Jack Doe','jack@gmail.com','0987654321','789 Oak Avenue');


SELECT *
FROM customers;


CREATE TABLE products (
	product_id INT AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(100),
    description  TEXT,
    price DECIMAL(10,2),
    stock INT
);

-- no values needed to insert for primary key which is auto incremented (this is how we comment in mysql)
INSERT INTO products (name , description , price , stock) VALUES 
('Laptop','High Performance Laptop',999.99 , 50),
('Smartphone','Latest model smartphone',799.99 , 100),
('Headphones','Noise-cancelling headphones' , 199.99 , 200);


SELECT *
FROM products;


CREATE TABLE orders (
	order_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_id INT,
    product_id INT,
    quantity INT,
    total_price DECIMAL(10,2),
    order_date DATE,
    FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
    FOREIGN KEY (product_id) REFERENCES products(product_id)
);


INSERT INTO orders(customer_id , product_id , quantity , total_price , order_date) VALUES
(1,1,1,999.99 , '2024-06-20'),
(1,2,2,1599.99,'2024-06-21'),
(2,3,1,199.99,'2024-06-22');

SELECT *
FROM orders;


CREATE TABLE shipments(
	shipment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    ship_date DATE,
    ship_status VARCHAR(50),
    FOREIGN KEY (order_id) REFERENCES orders(order_id)
);

INSERT INTO shipments(order_id,ship_date,ship_status) VALUES 
(1,'2024-06-21','Shipped'),
(2,'2024-06-22','Shipped'),
(3,'2024-06-23','Shipped');

SELECT *
FROM shipments;
select*from customers;
select* from products;
select*from orders;
-----------------------------------
-- Write SQL queries to calculate:

-- Total sales revenue.
SELECT SUM(total_price) AS total_revenue
FROM orders;



-- top selling products .
SELECT p.name , SUM(o.quantity) AS total_quantity_sold
FROM orders o
JOIN products p ON o.product_id = p.product_id
GROUP BY p.name
ORDER BY total_quantity_sold DESC;

-- Monthly sales trends
SELECT DATE_FORMAT(order_date , '%Y-%m') AS month , SUM(total_price) AS monthly_sales
FROM orders
GROUP BY month
ORDER BY month;

-- Customer Segmentation:
-- Develop queries to segment customers based on:

-- Purchase frequency.
select c.customer_id,c.name, count(o.order_id) as Purchase_frequency from customers c
join orders o 
on c.customer_id=o.customer_id
group by c.customer_id,c.name
order by purchase_frequency;

-- Total amount spent.
select c.name, c.customer_id,sum(o.total_price ) as total_amount_spent  from 
customers c join orders o
on c.customer_id= o.customer_id
group by c.name,c.customer_id;


-- Inventory Management: 

-- Create queries to track product inventory levels and identify products that need restocking.
select p.product_id,p.name,p.stock
from products p 
order by product_id;
---------- case study 2-(Henry Harvin) -------------
Table Structures:
Patients Table:
PatientID (Primary Key)
FirstName, LastName
DateOfBirth
Gender
ContactNumber
Address
-------------
Create table patients (
patient_id int Auto_increment primary Key,
first_name varchar(100),
Last_name  varchar(100),
Dob        Date,
Gender     char(3),
Contact_no varchar (20),
Adress     varchar(100));
select* from patients;
-- Doctors Table:
create table Doctors(
DoctorID int auto_increment Primary Key,
First_Name  varchar(100),
Last_Name  varchar(100),
Specialization varchar(50),
Contact_No  varchar(20),
Email     Varchar(255));
select* from doctors;
alter table doctors rename column DoctorID to Doctor_id;
INSERT INTO Doctors (Doctor_ID, First_Name, Last_Name, Specialization, Contact_NO, Email)
VALUES 
(1, 'Emily', 'Clark', 'Cardiology', '555-8765', 'eclark@example.com'),
(2, 'Michael', 'Brown', 'Neurology', '555-4321', 'mbrown@example.com');

-- Nurses Table:
NurseID (Primary Key)
FirstName, LastName
ContactNumber
Email
CREATE TABLE Nurses (
    Nurse_ID INT AUTO_INCREMENT PRIMARY KEY,
    First_Name VARCHAR(50) NOT NULL,
    Last_Name VARCHAR(50) NOT NULL,
    Contact_No VARCHAR(20),
    Email VARCHAR(100)
);
select* from nurses;
INSERT INTO Nurses (Nurse_ID, First_Name, Last_Name, Contact_NO, Email)
VALUES 
(1, 'Nancy', 'Johnson', '555-7890', 'njohnson@example.com'),
(2, 'Alice', 'Davis', '555-3456', 'adavis@example.com');


-- Departments Table:

DepartmentID (Primary Key)
DepartmentName
CREATE TABLE Departments (
    Department_ID INT AUTO_INCREMENT PRIMARY KEY,
    Department_Name VARCHAR(100) NOT NULL
);
select* from departments;
INSERT INTO Departments (Department_ID, Department_Name)
VALUES 
(1, 'Cardiology'),
(2, 'Neurology');
commit;
-- Appointments Table:
AppointmentID (Primary Key)
PatientID (Foreign Key)
DoctorID (Foreign Key)
AppointmentDate
Diagnosis
---------------
CREATE TABLE Appointments (
    Appointment_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Appointment_Date DATE NOT NULL,
    Diagnosis TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID)
);
-- foreign key column_name references to parenttable_name(column_name)
select* from Appointments;
-- MedicalRecords Table:
RecordID (Primary Key)
PatientID (Foreign Key)
DoctorID (Foreign Key)
RecordDate
Diagnosis
Prescription
CREATE TABLE Medical_Records (
    Record_ID INT AUTO_INCREMENT PRIMARY KEY,
    Patient_ID INT NOT NULL,
    Doctor_ID INT NOT NULL,
    Record_Date DATE NOT NULL,
    Diagnosis TEXT,
    FOREIGN KEY (Patient_ID) REFERENCES Patients(Patient_ID),
    FOREIGN KEY (Doctor_ID) REFERENCES Doctors(Doctor_ID));
select*from Medical_records;
-----------------------------------------------------------------------------Analysis-----------
-- Write SQL queries to register new patients into the system::
INSERT INTO Patients (First_Name, Last_Name, Dob, Gender, contact_no, adress)
VALUES ('John', 'Doe', '1980-05-15', 'M', '555-123-4567', 'john.doe@example.com'),
			('Jane', 'Smith', '1990-07-25', 'F', '555-234-5678', 'jane.smith@example.com'),
			('Alice', 'Johnson', '1975-12-30', 'F','555-345-6789','alice.johnson@example.com'),
            ('Robert', 'Brown', '1985-11-20', 'M', '555-456-7890', 'robert.brown@example.com');
commit;
select* from patients;
select distinct* from Patients;-- vvi to validate unique records
--------------------------------------------------------------------------------
# Insert a new appointment
select* from appointments;
INSERT INTO appointments (appointment_id, patient_id, doctor_id, appointment_date,Diagnosis)
VALUES (1, 1, 1, '2024-06-30','covid'),
(2, 2, 2, '2024-07-02', 'Migraine');
select* from medical_records;
alter table medical_records add column prescription Text;

-- Insert a new medical record for the appointment
INSERT INTO medical_records (record_id, patient_id, doctor_id, record_date, diagnosis,prescription)
VALUES (1, 1, 1, '2024-07-01', 'Hypertension', 'Lisinopril 10mg daily'),
(2, 2, 2, '2024-07-02', 'Migraine', 'Sumatriptan 50mg as needed');
commit;
-- question::update medical_record for a patient after appointment
update medical_records set record_date ='2024-07-05' 
where record_id=1;
select* from medical_records;
-----------------------------------------------------------------------------------
-- Write SQL queries to analyze patient demographics, appointment patterns, and popular diagnoses.
-- Extract insights that can aid decision-making for resource allocation and service improvement.
-- By gender
SELECT Gender, COUNT(*) AS Number_Of_Patients
FROM Patients
GROUP BY Gender;
-- BY AGE GROUP
SELECT 
    CASE
        WHEN TIMESTAMPDIFF(YEAR, Dob, CURDATE()) < 18 THEN '0-17'
        WHEN TIMESTAMPDIFF(YEAR, Dob, CURDATE()) BETWEEN 18 AND 35 THEN '18-35'
        WHEN TIMESTAMPDIFF(YEAR, Dob, CURDATE()) BETWEEN 36 AND 55 THEN '36-55'
        WHEN TIMESTAMPDIFF(YEAR, Dob, CURDATE()) BETWEEN 56 AND 75 THEN '56-75'
        ELSE '76+'
    END AS AgeGroup,
    COUNT(*) AS NumberOfPatients
FROM
    Patients
GROUP BY AgeGroup
ORDER BY AgeGroup;
-- if there is city as a column then we can group by city and count patients citywise as given below
SELECT 
  SUBSTRING_INDEX(Address, ' ', -2) AS City,## look at substring_index() function in mysql
  COUNT(*) AS NumberOfPatients
FROM Patients
GROUP BY City
ORDER BY NumberOfPatients DESC;
--------------------------------------------
-- Appointment Patterns
-- Number of Appointments by Month:
SELECT 
  DATE_FORMAT(Appointment_Date, '%Y-%m') AS Month, ## look function Date_format to extract month
  COUNT(*) AS NumberOfAppointments
FROM Appointments
GROUP BY Month
ORDER BY Month;
-- Average Number of Appointments per Doctor:

SELECT 
  d.First_Name, 
  d.Last_Name, 
  COUNT(a.Appointment_ID) / COUNT(DISTINCT DATE(a.Appointment_Date)) AS AverageAppointmentsPerDay
FROM Doctors d
JOIN Appointments a ON d.Doctor_ID = a.Doctor_ID
GROUP BY d.Doctor_ID, d.First_Name, d.Last_Name
ORDER BY AverageAppointmentsPerDay DESC;
-- Number of Appointments by Department:

SELECT 
  dep.Department_Name, 
  COUNT(a.Appointment_ID) AS NumberOfAppointments
FROM Departments dep
JOIN Doctors d ON dep.department_name = d.specialization
JOIN Appointments a ON d.Doctor_ID = a.Doctor_ID
GROUP BY dep.Department_Name
ORDER BY NumberOfAppointments DESC;
select* from doctors;
-- Popular Diagnoses
-- Top 10 Diagnoses:

SELECT 
  Diagnosis, 
  COUNT(*) AS Occurrences
FROM Medical_Records
GROUP BY Diagnosis
ORDER BY Occurrences DESC
LIMIT 10;
-- Number of Patients with Multiple Diagnoses:

SELECT 
  Patient_ID, 
  COUNT(DISTINCT Diagnosis) AS NumberOfDiagnoses
FROM Medical_Records
GROUP BY Patient_ID
HAVING NumberOfDiagnoses > 1
ORDER BY NumberOfDiagnoses DESC;
---------------------------------------------------------------------
-- Diagnoses by Department:

SELECT 
  dep.Department_Name, 
  mr.Diagnosis, 
  COUNT(*) AS Occurrences
FROM Departments dep
JOIN Doctors d ON dep.Department_name = d.Specialization
JOIN Medical_Records mr ON d.Doctor_ID = mr.Doctor_ID
GROUP BY dep.Department_Name, mr.Diagnosis
ORDER BY dep.Department_Name, Occurrences DESC;






Is this conversation helpful so far?




Security and Access Control:


Implement user roles and permissions to ensure only authorized personnel can access sensitive patient information.
Protect against SQL injection and other security vulnerabilities.


Backup and Recovery:


Design a strategy for regular database backups and implement recovery procedures.
Ensure data integrity and availability in case of system failures.


Reporting and Visualization:


Dashboard Creation:


Utilize SQL queries to extract relevant data for creating a dashboard.
Present key performance indicators, appointment statistics, and patient demographics.


Data Visualization:


Explore SQL-based visualization tools or integrate SQL with external visualization tools like Tableau or Power BI. (You can continue this after you learn the PowerBI that is the next module)
Generate graphs and charts for intuitive data representation.

Appointment Scheduling:
Develop SQL queries to schedule appointments for patients with specific doctors.----- these are questions to ask
Avoid scheduling conflicts and manage appointment availability.































