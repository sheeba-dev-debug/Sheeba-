 EMPLOYEE MANAGEMENT
CREATE DATABASE EmployeeManagement;
USE EmployeeManagement;

CREATE TABLE Departments (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL
);

CREATE TABLE Employees (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    age INT NOT NULL CHECK (age > 18),
    gender VARCHAR(10) DEFAULT 'Unknown',
    email VARCHAR(100) UNIQUE,
    salary INT NOT NULL CHECK (salary > 30000),
    department_id INT,
    FOREIGN KEY (department_id) REFERENCES Departments(id)
);

CREATE TABLE Projects (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    budget INT NOT NULL CHECK (budget > 10000)
);

CREATE TABLE Employee_Projects (
    employee_id INT,
    project_id INT,
    PRIMARY KEY (employee_id, project_id),
    FOREIGN KEY (employee_id) REFERENCES Employees(id),
    FOREIGN KEY (project_id) REFERENCES Projects(id)
);

CREATE TABLE Attendance (
    id INT PRIMARY KEY AUTO_INCREMENT,
    employee_id INT,
    date DATE NOT NULL,
    status ENUM('Present', 'Absent', 'On Leave'),
    FOREIGN KEY (employee_id) REFERENCES Employees(id)
);

INSERT INTO Departments (name) VALUES ('IT'), ('HR'), ('Finance');

INSERT INTO Employees (name, age, gender, email, salary, department_id) VALUES
('Alice', 25, 'Female', 'alice@example.com', 50000, 1),
('Bob', 30, 'Male', 'bob@example.com', 60000, 2),
('Charlie', 28, 'Male', 'charlie@example.com', 40000, 1);

INSERT INTO Projects (name, budget) VALUES ('Project A', 70000), ('Project B', 20000);

INSERT INTO Employee_Projects (employee_id, project_id) VALUES (1, 1), (2, 2);

INSERT INTO Attendance (employee_id, date, status) VALUES (1, '2025-02-01', 'Present'), (2, '2025-02-01', 'Absent');


#Retrieve all employees
SELECT * FROM Employees;

#Retrieve all employees in the 'IT' department
SELECT * FROM Employees WHERE department_id = (SELECT id FROM Departments WHERE name = 'IT');

#List all projects with a budget greater than 50000
SELECT * FROM Projects WHERE budget > 50000;

#Show the names of employees and the projects they are working on
SELECT e.name, p.name FROM Employees e
JOIN Employee_Projects ep ON e.id = ep.employee_id
JOIN Projects p ON ep.project_id = p.id;

# Count the number of employees in each department
SELECT d.name, COUNT(e.id) AS employee_count FROM Departments d
LEFT JOIN Employees e ON d.id = e.department_id
GROUP BY d.name;

#Find employees with a salary greater than 50000
SELECT * FROM Employees WHERE salary > 50000;

#Get attendance records for a specific employee
SELECT * FROM Attendance WHERE employee_id = 1;

# Increase the salary of employees in the 'HR' department by 10%
UPDATE Employees SET salary = salary * 1.1 WHERE department_id = (SELECT id FROM Departments WHERE name = 'HR');
# Change the department of an employee
UPDATE Employees SET department_id = (SELECT id FROM Departments WHERE name = 'Finance') WHERE id = 1;


#Remove an employee who has resigned
DELETE FROM Employees WHERE id = 3;

#Delete a project that is completed
DELETE FROM Projects WHERE id = 2;
