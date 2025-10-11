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