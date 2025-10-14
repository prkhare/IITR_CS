
--Q31

-- Create Employees Table
CREATE TABLE employees (
    employee_id INT PRIMARY KEY,
    first_name VARCHAR(50),
    last_name VARCHAR(50),
    email VARCHAR(100),
    department VARCHAR(50),
    position VARCHAR(50),
    hire_date DATE,
    salary DECIMAL(10, 2),
    manager_id INT,
    city VARCHAR(50)
);

delete  from \  employees;

-- Insert Sample Data
INSERT INTO employees VALUES
(101, 'John', 'Smith', 'john.smith@company.com', 'Sales', 'Sales Manager', '2019-03-15', 75000.00, NULL, 'New York'),
(102, 'Sarah', 'Johnson', 'sarah.j@company.com', 'Sales', 'Sales Representative', '2020-06-01', 52000.00, 101, 'New York'),
(103, 'Michael', 'Brown', 'michael.b@company.com', 'Sales', 'Sales Representative', '2021-01-10', 48000.00, 101, 'Boston'),
(104, 'Emily', 'Davis', 'emily.d@company.com', 'Engineering', 'Senior Developer', '2018-09-20', 95000.00, NULL, 'San Francisco'),
(105, 'David', 'Wilson', 'david.w@company.com', 'Engineering', 'Developer', '2020-11-05', 72000.00, 104, 'San Francisco'),
(106, 'Lisa', 'Anderson', 'lisa.a@company.com', 'Engineering', 'Developer', '2021-03-12', 68000.00, 104, 'San Francisco'),
(107, 'James', 'Taylor', 'james.t@company.com', 'Engineering', 'Junior Developer', '2022-07-18', 55000.00, 104, 'Austin'),
(108, 'Jennifer', 'Martinez', 'jennifer.m@company.com', 'HR', 'HR Manager', '2017-05-22', 82000.00, NULL, 'Chicago'),
(109, 'Robert', 'Garcia', 'robert.g@company.com', 'HR', 'HR Specialist', '2021-09-30', 58000.00, 108, 'Chicago'),
(110, 'Maria', 'Rodriguez', 'maria.r@company.com', 'Marketing', 'Marketing Manager', '2019-08-14', 78000.00, NULL, 'Los Angeles'),
(111, 'William', 'Lee', 'william.l@company.com', 'Marketing', 'Marketing Specialist', '2020-12-03', 54000.00, 110, 'Los Angeles'),
(112, 'Linda', 'White', 'linda.w@company.com', 'Marketing', 'Marketing Specialist', '2021-04-25', 52000.00, 110, 'Seattle'),
(113, 'Thomas', 'Harris', 'thomas.h@company.com', 'Finance', 'Financial Analyst', '2020-02-17', 67000.00, NULL, 'New York'),
(114, 'Patricia', 'Clark', 'patricia.c@company.com', 'Finance', 'Accountant', '2021-06-08', 61000.00, 113, 'New York'),
(115, 'Daniel', 'Lewis', 'daniel.l@company.com', 'Engineering', 'Developer', '2022-01-20', 70000.00, 104, 'Austin');


select * from employees;

--1. Write an SQL query to display first_name, last_name, and salary of all employees whose salary is greater than 60000. Sort the results by salary in ascending order.

select 
first_name, last_name,  salary
from employees
where salary>60000
ORDER BY salary
;

--2. Write an SQL query to find out how many employees work in each department. Display the department name and count of employees. Sort the results by department name.

SELECT
department, count(employee_id) num_emp
from employees
group by department
ORDER BY department
;

--3. Write an SQL query to calculate the total salary expense and average salary for the Engineering department only. 
--Your output should show two columns: total_salary and average_salary.

SELECT sum(salary) total_salary, avg(salary) average_salary from employees
where department='Engineering'
;

--4. Write an SQL query to find all cities where the average salary is greater than 65000. Display the city name and the average salary.
-- Sort by average salary in descending order.

select city, avg(salary)  avg_sal
from employees
group by city
having avg(salary)>65000
order by avg(salary) desc
;

--5. Write an SQL query to display employee information along with their department budget. Show the following columns:
--first_name
--last_name
--department (from employees table)
--budget (from departments table)
--Use an INNER JOIN to combine both tables where employees.department = departments.department_name. Limit the output to 5 records only.

--Q32

-- Create Orders Table
CREATE TABLE orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    product_name VARCHAR(100),
    category VARCHAR(50),
    quantity INT,
    price_per_unit DECIMAL(10, 2),
    order_date DATE,
    shipping_city VARCHAR(50),
    payment_method VARCHAR(50),
    status VARCHAR(30)
);

-- Insert Sample Data
INSERT INTO orders VALUES
(1001, 'Alice Williams', 'Laptop', 'Electronics', 1, 85000.00, '2024-01-15', 'Mumbai', 'Credit Card', 'Delivered'),
(1002, 'Bob Thompson', 'Smartphone', 'Electronics', 2, 45000.00, '2024-01-18', 'Delhi', 'UPI', 'Delivered'),
(1003, 'Carol Martinez', 'Office Chair', 'Furniture', 3, 8500.00, '2024-02-05', 'Bangalore', 'Debit Card', 'Delivered'),
(1004, 'David Kumar', 'Desk Lamp', 'Furniture', 5, 1200.00, '2024-02-10', 'Mumbai', 'Cash on Delivery', 'Shipped'),
(1005, 'Emma Davis', 'Tablet', 'Electronics', 1, 35000.00, '2024-02-20', 'Chennai', 'Credit Card', 'Delivered'),
(1006, 'Frank Wilson', 'Headphones', 'Electronics', 4, 2500.00, '2024-03-01', 'Pune', 'UPI', 'Delivered'),
(1007, 'Grace Lee', 'Study Table', 'Furniture', 2, 12000.00, '2024-03-12', 'Hyderabad', 'Credit Card', 'Delivered'),
(1008, 'Henry Brown', 'Bookshelf', 'Furniture', 1, 15000.00, '2024-03-15', 'Mumbai', 'Debit Card', 'Processing'),
(1009, 'Ivy Chen', 'Smart Watch', 'Electronics', 3, 18000.00, '2024-04-02', 'Delhi', 'UPI', 'Delivered'),
(1010, 'Jack Robinson', 'Mouse', 'Electronics', 10, 800.00, '2024-04-10', 'Bangalore', 'Cash on Delivery', 'Delivered'),
(1011, 'Karen White', 'Keyboard', 'Electronics', 6, 1500.00, '2024-04-18', 'Chennai', 'Credit Card', 'Shipped'),
(1012, 'Liam Garcia', 'Wardrobe', 'Furniture', 1, 25000.00, '2024-05-05', 'Pune', 'Debit Card', 'Delivered'),
(1013, 'Mia Anderson', 'Monitor', 'Electronics', 2, 22000.00, '2024-05-12', 'Mumbai', 'UPI', 'Delivered'),
(1014, 'Noah Taylor', 'Sofa Set', 'Furniture', 1, 45000.00, '2024-05-20', 'Delhi', 'Credit Card', 'Processing'),
(1015, 'Olivia Martin', 'Printer', 'Electronics', 1, 18000.00, '2024-06-01', 'Hyderabad', 'UPI', 'Delivered');

-- Create Categories Table
CREATE TABLE categories (
    category_id INT PRIMARY KEY,
    category_name VARCHAR(50),
    tax_rate DECIMAL(5, 2),
    warehouse_location VARCHAR(50)
);

-- Insert Category Data
INSERT INTO categories VALUES
(1, 'Electronics', 18.00, 'Bangalore'),
(2, 'Furniture', 12.00, 'Mumbai');


--1. Write an SQL query to display customer_name, product_name, and price_per_unit of all orders where price_per_unit is greater than 10000. 
--Sort the results by price_per_unit in ascending order.

select customer_name, product_name,  price_per_unit
from orders
where price_per_unit>10000
order by price_per_unit
;

--2. Write an SQL query to find out how many orders were placed in each city. Display the shipping_city and count of orders. Sort the results by shipping_city.

select shipping_city,count(order_id) count_orders
 from orders
 group by shipping_city
 ORDER BY shipping_city
 ;


--3. Write an SQL query to calculate the total revenue (sum of quantity * price_per_unit) and average order value (average of quantity * price_per_unit) 
--for the Electronics category only. Your output should show two columns: total_revenue and average_order_value.

select
sum(quantity*price_per_unit) as total_revenue,
avg(quantity*price_per_unit) as average_order_value
from orders
where category='Electronics'
GROUP BY category
;

--4. Write an SQL query to find all payment methods where the total quantity of products ordered is greater than 5. 
--Display the payment_method and the total quantity. Sort by total quantity in descending order.

select 
payment_method,
sum(quantity) total_quantity
from orders
group by payment_method
order by sum(quantity) DESC
;

--5. Write an SQL query to display order information along with their category tax rate. Show the following columns:
--customer_name
--product_name
--category (from orders table)
--tax_rate (from categories table)
--Use an INNER JOIN to combine both tables where orders.category = categories.category_name. Limit the output to 5 records only.

SELECT
o.customer_name,
o.product_name,
o.category,
c.tax_rate
from orders o join categories c
on o.category=c.category_name
limit 5
;


--Q33

-- Create Students Table
CREATE TABLE students (
    student_id INT PRIMARY KEY,
    student_name VARCHAR(100),
    course_name VARCHAR(100),
    instructor VARCHAR(100),
    enrollment_date DATE,
    fees_paid DECIMAL(10, 2),
    attendance_percentage DECIMAL(5, 2),
    city VARCHAR(50),
    batch VARCHAR(20),
    grade VARCHAR(2)
);

-- Insert Sample Data
INSERT INTO students VALUES
(2001, 'Rahul Sharma', 'Data Science', 'Dr. Patel', '2024-01-10', 45000.00, 92.50, 'Mumbai', 'Morning', 'A'),
(2002, 'Priya Singh', 'Web Development', 'Prof. Kumar', '2024-01-15', 35000.00, 88.00, 'Delhi', 'Evening', 'B'),
(2003, 'Amit Verma', 'Data Science', 'Dr. Patel', '2024-01-20', 45000.00, 95.00, 'Bangalore', 'Morning', 'A'),
(2004, 'Sneha Reddy', 'Machine Learning', 'Dr. Shah', '2024-02-01', 50000.00, 90.00, 'Hyderabad', 'Morning', 'A'),
(2005, 'Vikram Joshi', 'Web Development', 'Prof. Kumar', '2024-02-05', 35000.00, 78.50, 'Pune', 'Evening', 'C'),
(2006, 'Anjali Gupta', 'Cyber Security', 'Prof. Mehta', '2024-02-10', 42000.00, 85.00, 'Mumbai', 'Morning', 'B'),
(2007, 'Karan Malhotra', 'Data Science', 'Dr. Patel', '2024-02-15', 45000.00, 89.00, 'Delhi', 'Evening', 'B'),
(2008, 'Deepika Nair', 'Machine Learning', 'Dr. Shah', '2024-03-01', 50000.00, 93.00, 'Chennai', 'Morning', 'A'),
(2009, 'Rohan Das', 'Web Development', 'Prof. Kumar', '2024-03-05', 35000.00, 82.00, 'Kolkata', 'Evening', 'B'),
(2010, 'Pooja Iyer', 'Cyber Security', 'Prof. Mehta', '2024-03-10', 42000.00, 91.00, 'Bangalore', 'Morning', 'A'),
(2011, 'Arjun Kapoor', 'Data Science', 'Dr. Patel', '2024-03-15', 45000.00, 87.50, 'Mumbai', 'Morning', 'B'),
(2012, 'Neha Rao', 'Machine Learning', 'Dr. Shah', '2024-04-01', 50000.00, 96.00, 'Hyderabad', 'Evening', 'A'),
(2013, 'Siddharth Bose', 'Web Development', 'Prof. Kumar', '2024-04-05', 35000.00, 75.00, 'Delhi', 'Morning', 'C'),
(2014, 'Kavya Pillai', 'Cyber Security', 'Prof. Mehta', '2024-04-10', 42000.00, 88.50, 'Chennai', 'Evening', 'B'),
(2015, 'Aditya Jain', 'Machine Learning', 'Dr. Shah', '2024-04-15', 50000.00, 94.50, 'Pune', 'Morning', 'A');

-- Create Courses Table
CREATE TABLE courses (
    course_id INT PRIMARY KEY,
    course_name VARCHAR(100),
    duration_months INT,
    difficulty_level VARCHAR(20)
);

-- Insert Course Data
INSERT INTO courses VALUES
(101, 'Data Science', 6, 'Intermediate'),
(102, 'Web Development', 4, 'Beginner'),
(103, 'Machine Learning', 8, 'Advanced'),
(104, 'Cyber Security', 5, 'Intermediate');

--1. Write an SQL query to display student_name, course_name, and attendance_percentage of all students whose attendance is less than 85%. 
--Sort the results by attendance_percentage in descending order.

select 
student_name, course_name,  attendance_percentage
 from students
 where attendance_percentage<85
 order by attendance_percentage desc;

--2. Write an SQL query to find out how many students are enrolled in each course. Display the course_name and count of students. 
--Sort the results by count of students in descending order.

select 
course_name, count(student_id) total_students
from students
group by course_name
ORDER BY count(student_id) DESC
;

--3. Write an SQL query to display student_name, course_name, and fees_paid for all students who are enrolled in 
--either 'Data Science' or 'Machine Learning' courses AND have paid fees greater than 40000. Sort by student_name.

select 
student_name, course_name,  fees_paid
from students
where course_name in ('Data Science' , 'Machine Learning' )
and fees_paid>40000
order by student_name
;

--4. Write an SQL query to calculate the total fees collected and average fees for the 'Web Development' course only. 
--Your output should show two columns: total_fees and average_fees.

SELECT
sum(fees_paid) total_fees,
avg(fees_paid) average_fees
from students
where course_name='Web Development'
; 

--5. Write an SQL query to find all instructors where the average attendance percentage of their students is greater than 88%. 
--Display the instructor name and the average attendance percentage. Sort by average attendance in descending order.

SELECT
instructor,
avg(attendance_percentage) avg_att_perc
from students
group by instructor
HAVING avg(attendance_percentage)>88
order by avg(attendance_percentage) DESC
;



--Q34

-- Create Books Table
CREATE TABLE books (
    book_id INT PRIMARY KEY,
    book_title VARCHAR(150),
    author_name VARCHAR(100),
    genre VARCHAR(50),
    publication_year INT,
    price DECIMAL(10, 2),
    copies_sold INT,
    publisher VARCHAR(100),
    language VARCHAR(50),
    rating DECIMAL(3, 2)
);

-- Insert Sample Data
INSERT INTO books VALUES
(3001, 'The Great Adventure', 'John Smith', 'Fiction', 2020, 450.00, 1200, 'Penguin Books', 'English', 4.5),
(3002, 'Learn Python Programming', 'Sarah Johnson', 'Technology', 2021, 650.00, 2500, 'Tech Publications', 'English', 4.7),
(3003, 'Mystery of the Night', 'Robert Brown', 'Mystery', 2019, 380.00, 980, 'Mystery House', 'English', 4.2),
(3004, 'Data Science Handbook', 'Emily Davis', 'Technology', 2022, 750.00, 3200, 'Tech Publications', 'English', 4.8),
(3005, 'Historical Tales', 'Michael Wilson', 'History', 2018, 520.00, 650, 'History Press', 'English', 4.0),
(3006, 'Cooking Masterclass', 'Lisa Anderson', 'Lifestyle', 2021, 420.00, 1800, 'Life Books', 'English', 4.6),
(3007, 'Space Exploration', 'David Martinez', 'Science', 2020, 680.00, 1100, 'Science World', 'English', 4.4),
(3008, 'Romantic Stories', 'Jennifer Taylor', 'Romance', 2022, 350.00, 2200, 'Love Publishing', 'English', 4.3),
(3009, 'Web Development Guide', 'James Garcia', 'Technology', 2023, 720.00, 2800, 'Tech Publications', 'English', 4.9),
(3010, 'Thriller Nights', 'Patricia White', 'Thriller', 2021, 390.00, 1500, 'Thriller House', 'English', 4.1),
(3011, 'Business Strategy', 'Thomas Harris', 'Business', 2020, 580.00, 890, 'Business Press', 'English', 4.2),
(3012, 'Yoga and Wellness', 'Maria Rodriguez', 'Lifestyle', 2022, 460.00, 1300, 'Life Books', 'English', 4.5),
(3013, 'Artificial Intelligence', 'Daniel Lee', 'Technology', 2023, 820.00, 3500, 'Tech Publications', 'English', 4.8),
(3014, 'Adventure Stories', 'Linda Clark', 'Fiction', 2019, 410.00, 1050, 'Penguin Books', 'English', 4.3),
(3015, 'Photography Basics', 'William Lewis', 'Arts', 2021, 550.00, 720, 'Art Publications', 'English', 4.0);

-- Create Publishers Table
CREATE TABLE publishers (
    publisher_id INT PRIMARY KEY,
    publisher_name VARCHAR(100),
    country VARCHAR(50),
    established_year INT
);

-- Insert Publisher Data
INSERT INTO publishers VALUES
(501, 'Penguin Books', 'United Kingdom', 1935),
(502, 'Tech Publications', 'USA', 2005),
(503, 'Mystery House', 'USA', 1998),
(504, 'History Press', 'United Kingdom', 1988),
(505, 'Life Books', 'India', 2010);


--1. Write an SQL query to display book_title, author_name, and price of all books where the price is between 400 and 600 (inclusive). 
--Sort the results by price in ascending order.
select book_title, author_name,  price
from books
where price BETWEEN 400 and 600
order by price
;


--2. Write an SQL query to calculate the total number of copies sold (SUM) and the total revenue generated (SUM of copies_sold * price) for all books. 
--Your output should show two columns: total_copies_sold and total_revenue.

SELECT
sum(copies_sold) total_copies_sold,
sum(copies_sold*price) total_revenue
from books
;

--3. Write an SQL query to find out how many books are published by each publisher. Display the publisher name and count of books. 
--Sort the results by count of books in descending order.

select 
publisher,
count(book_id) count_of_books
from books
GROUP BY publisher
order by count(book_id)
;

--4. Write an SQL query to find all genres where the average rating is greater than or equal to 4.5. 
--Display the genre name and the average rating. Sort by average rating in descending order.

SELECT
genre,
avg(rating) average_rating
FROM books
group by genre
order by avg(rating) DESC
;

--5. Write an SQL query to display the top 3 best-selling books (highest copies_sold). 
--Show book_title, author_name, copies_sold, and genre. Use LIMIT to get only 3 records and sort by copies_sold in descending order.

SELECT
book_title, author_name, copies_sold,  genre
from books
order by copies_sold DESC
limit 3
;


--Q35

-- Create Patients Table
CREATE TABLE patients (
    patient_id INT PRIMARY KEY,
    patient_name VARCHAR(100),
    age INT,
    gender VARCHAR(10),
    disease VARCHAR(100),
    doctor_name VARCHAR(100),
    admission_date DATE,
    discharge_date DATE,
    treatment_cost DECIMAL(10, 2),
    room_type VARCHAR(50),
    city VARCHAR(50)
);

-- Insert Sample Data
INSERT INTO patients VALUES
(4001, 'Rajesh Kumar', 45, 'Male', 'Diabetes', 'Dr. Sharma', '2024-01-10', '2024-01-15', 25000.00, 'General Ward', 'Mumbai'),
(4002, 'Sunita Devi', 38, 'Female', 'Hypertension', 'Dr. Mehta', '2024-01-12', '2024-01-18', 18000.00, 'General Ward', 'Delhi'),
(4003, 'Anil Gupta', 52, 'Male', 'Heart Disease', 'Dr. Verma', '2024-01-15', '2024-01-25', 85000.00, 'ICU', 'Bangalore'),
(4004, 'Meena Sharma', 29, 'Female', 'Fever', 'Dr. Patel', '2024-01-20', '2024-01-23', 8500.00, 'General Ward', 'Chennai'),
(4005, 'Ramesh Singh', 61, 'Male', 'Pneumonia', 'Dr. Sharma', '2024-02-01', '2024-02-10', 42000.00, 'Private Room', 'Mumbai'),
(4006, 'Kavita Reddy', 34, 'Female', 'Thyroid', 'Dr. Mehta', '2024-02-05', '2024-02-08', 15000.00, 'General Ward', 'Hyderabad'),
(4007, 'Suresh Yadav', 48, 'Male', 'Diabetes', 'Dr. Sharma', '2024-02-10', '2024-02-17', 32000.00, 'Private Room', 'Pune'),
(4008, 'Pooja Jain', 56, 'Female', 'Arthritis', 'Dr. Verma', '2024-02-15', '2024-02-22', 28000.00, 'General Ward', 'Mumbai'),
(4009, 'Vikram Desai', 42, 'Male', 'Asthma', 'Dr. Patel', '2024-03-01', '2024-03-05', 22000.00, 'General Ward', 'Delhi'),
(4010, 'Anjali Nair', 31, 'Female', 'Migraine', 'Dr. Mehta', '2024-03-05', '2024-03-07', 12000.00, 'General Ward', 'Bangalore'),
(4011, 'Manoj Tiwari', 59, 'Male', 'Heart Disease', 'Dr. Verma', '2024-03-10', '2024-03-22', 95000.00, 'ICU', 'Chennai'),
(4012, 'Rekha Pillai', 44, 'Female', 'Diabetes', 'Dr. Sharma', '2024-03-15', '2024-03-20', 26000.00, 'General Ward', 'Hyderabad'),
(4013, 'Amit Bose', 37, 'Male', 'Fever', 'Dr. Patel', '2024-04-01', '2024-04-04', 9500.00, 'General Ward', 'Kolkata'),
(4014, 'Deepa Menon', 50, 'Female', 'Hypertension', 'Dr. Mehta', '2024-04-05', '2024-04-12', 19000.00, 'Private Room', 'Mumbai'),
(4015, 'Ravi Kulkarni', 46, 'Male', 'Asthma', 'Dr. Patel', '2024-04-10', '2024-04-15', 24000.00, 'General Ward', 'Pune');

-- Create Doctors Table
CREATE TABLE doctors (
    doctor_id INT PRIMARY KEY,
    doctor_name VARCHAR(100),
    specialization VARCHAR(100),
    experience_years INT
);

-- Insert Doctor Data
INSERT INTO doctors VALUES
(101, 'Dr. Sharma', 'General Medicine', 15),
(102, 'Dr. Mehta', 'Cardiology', 12),
(103, 'Dr. Verma', 'Cardiac Surgery', 20),
(104, 'Dr. Patel', 'Pulmonology', 10);


--1. Write an SQL query to display patient_name, disease, and treatment_cost for all patients whose 
--treatment_cost is less than 20000. Sort the results by treatment_cost in descending order.

SELECT
patient_name, disease,  treatment_cost 
from patients
where treatment_cost<20000
order by treatment_cost DESC
;

--2. Write an SQL query to find the total number of patients treated by each doctor. 
--Display the doctor_name and count of patients. Sort the results by count of patients in descending order.

SELECT
doctor_name,
count(patient_id) count_of_patients
from patients
group by doctor_name
order by count(patient_id) DESC
;

--3. Write an SQL query to display all male patients who are older than 40 years AND have a treatment cost greater than 25000. 
--Show patient_name, age, disease, and treatment_cost. Sort by age in ascending order.

SELECT
patient_name, age, disease,  treatment_cost
from patients
where gender='Male'
order by age DESC;

--4. Write an SQL query to calculate the minimum treatment cost, maximum treatment cost, 
--and average treatment cost for patients admitted in 'General Ward'. Your output should show three columns: min_cost, max_cost, and avg_cost.

SELECT
min(treatment_cost) min_cost,
max(treatment_cost) max_cost,
avg(treatment_cost) avg_cost
from patients
where room_type='General Ward'
;

--5. Write an SQL query to find all cities where more than 2 patients were admitted. 
--Display the city name and the count of patients. Sort by count of patients in descending order.

SELECT
city,
count(patient_id) count_of_patients
from patients
GROUP BY city
having count(patient_id) >2
order by  count(patient_id) DESC
;



--Q36

-- Create Products Table
CREATE TABLE products (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    category VARCHAR(50),
    brand VARCHAR(50),
    price DECIMAL(10, 2),
    stock_quantity INT,
    supplier_name VARCHAR(100),
    manufacturing_date DATE,
    expiry_date DATE,
    warehouse_location VARCHAR(50),
    rating DECIMAL(3, 2)
);

-- Insert Sample Data
INSERT INTO products VALUES
(5001, 'Samsung Galaxy S23', 'Electronics', 'Samsung', 79999.00, 45, 'Tech Suppliers Ltd', '2023-02-15', '2026-02-15', 'Mumbai', 4.5),
(5002, 'iPhone 14 Pro', 'Electronics', 'Apple', 129999.00, 30, 'Apple India', '2023-01-20', '2026-01-20', 'Delhi', 4.8),
(5003, 'OnePlus 11', 'Electronics', 'OnePlus', 56999.00, 60, 'Tech Suppliers Ltd', '2023-03-10', '2026-03-10', 'Bangalore', 4.3),
(5004, 'Whirlpool Refrigerator', 'Appliances', 'Whirlpool', 35000.00, 25, 'Home Appliances Co', '2023-01-05', '2028-01-05', 'Chennai', 4.2),
(5005, 'LG Washing Machine', 'Appliances', 'LG', 28000.00, 18, 'Home Appliances Co', '2023-02-20', '2028-02-20', 'Mumbai', 4.4),
(5006, 'Sony Bravia TV 55 inch', 'Electronics', 'Sony', 85000.00, 35, 'Tech Suppliers Ltd', '2023-03-15', '2026-03-15', 'Delhi', 4.6),
(5007, 'HP Laptop 15s', 'Electronics', 'HP', 52000.00, 50, 'Computer World', '2023-04-01', '2026-04-01', 'Pune', 4.1),
(5008, 'Dell Inspiron', 'Electronics', 'Dell', 58000.00, 40, 'Computer World', '2023-03-25', '2026-03-25', 'Bangalore', 4.3),
(5009, 'Godrej Almirah', 'Furniture', 'Godrej', 15000.00, 22, 'Furniture Mart', '2023-02-10', '2033-02-10', 'Hyderabad', 4.0),
(5010, 'Nilkamal Plastic Chair', 'Furniture', 'Nilkamal', 1200.00, 150, 'Furniture Mart', '2023-01-15', '2028-01-15', 'Mumbai', 3.8),
(5011, 'Study Table Wooden', 'Furniture', 'HomeTown', 8500.00, 35, 'Furniture Mart', '2023-03-05', '2033-03-05', 'Chennai', 4.2),
(5012, 'Boat Headphones', 'Electronics', 'Boat', 2500.00, 200, 'Audio Suppliers', '2023-04-10', '2025-04-10', 'Delhi', 4.0),
(5013, 'JBL Speaker', 'Electronics', 'JBL', 4500.00, 80, 'Audio Suppliers', '2023-03-20', '2026-03-20', 'Mumbai', 4.5),
(5014, 'Voltas Air Conditioner', 'Appliances', 'Voltas', 42000.00, 15, 'Home Appliances Co', '2023-02-28', '2028-02-28', 'Bangalore', 4.3),
(5015, 'Prestige Induction Cooktop', 'Appliances', 'Prestige', 3200.00, 65, 'Kitchen Supplies', '2023-03-12', '2026-03-12', 'Pune', 4.1);


--1. Write an SQL query to display product_name, brand, and price of all products where the price is greater than 50000. 
--Sort the results by price in descending order.

select 
product_name, brand,  price
from products
where price>50000
ORDER BY price desc
;


--2. Write an SQL query to find out how many products are available in each category. 
--Display the category name and count of products. Sort the results by category name.

SELECT
category,
count(product_id) count_of_products
from products
group by category
order by category
;

--3. Write an SQL query to calculate the total stock quantity (SUM) and average price (AVG) for all products in the 'Electronics' category.
-- Your output should show two columns: total_stock and average_price.

select 
sum(stock_quantity) total_stock,
avg(price) average_price
from products
where category='Electronics'
;

--4. Write an SQL query to find all warehouse locations where the total stock quantity of products is greater than 100. 
--Display the warehouse_location and total stock quantity. Sort by total stock quantity in descending order.

select 
warehouse_location,
sum(stock_quantity) total_stock_quantity
from products
GROUP BY warehouse_location
ORDER BY sum(stock_quantity) DESC
;

--5. Write an SQL query to display the top 5 highest-rated products. Show product_name, category, price, and rating. 
--Use LIMIT to get only 5 records and sort by rating in descending order, then by price in descending order.

SELECT
product_name, category, price,  rating
from products
order by rating desc, price DESC
limit 5
;