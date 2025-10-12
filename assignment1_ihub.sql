
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



--2. Write an SQL query to find out how many students are enrolled in each course. Display the course_name and count of students. Sort the results by count of students in descending order.
--
--3. Write an SQL query to display student_name, course_name, and fees_paid for all students who are enrolled in either 'Data Science' or 'Machine Learning' courses AND have paid fees greater than 40000. Sort by student_name.
--
--4. Write an SQL query to calculate the total fees collected and average fees for the 'Web Development' course only. Your output should show two columns: total_fees and average_fees.
--
--5. Write an SQL query to find all instructors where the average attendance percentage of their students is greater than 88%. Display the instructor name and the average attendance percentage. Sort by average attendance in descending order.