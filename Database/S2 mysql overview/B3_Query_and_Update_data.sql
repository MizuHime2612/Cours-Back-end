DROP DATABASE IF EXISTS S2_bai3;
CREATE DATABASE S2_bai3;
USE S2_bai3;

CREATE TABLE Departments (
    department_id INT PRIMARY KEY AUTO_INCREMENT,        
    department_name VARCHAR(50) NOT NULL  
);

CREATE TABLE Employees (
    employee_id INT PRIMARY KEY AUTO_INCREMENT,        
    name VARCHAR(100) NOT NULL,           
    salary DECIMAL(10, 2) NOT NULL,       
    department_id INT,               
    FOREIGN KEY (department_id) REFERENCES Departments(department_id)
);

INSERT INTO Departments (department_name) VALUES 
('Sales'),
('HR'),
('IT'),
('Marketing');

INSERT INTO Employees (name, salary, department_id) VALUES 
('Nguyễn Hoàng An', 55000, 1),
('Trân Châu', 45000, 2),
('Lê Việt', 70000, 1),
('Phạm Phù Dung', 80000, 3),
('Bùi Êm Đềm', 40000, 4),
('Hoàng Thị Phương', 65000, 1);

SELECT * FROM Employees
WHERE department_id = '1';

UPDATE Employees
SET salary = 60000
WHERE employee_id = 1;

DELETE FROM Employees
WHERE `salary` < 50000;

SELECT * FROM Employees;
