DROP DATABASE IF EXISTS eManagement;
CREATE DATABASE eManagement;
USE eManagement;

CREATE TABLE employee (
	employeeID INT PRIMARY KEY AUTO_INCREMENT,
    employeeName VARCHAR(100),
    age INT,
    salary DECIMAL(10, 3)
);

CREATE TABLE department (
	departmentID INT PRIMARY KEY AUTO_INCREMENT,
    departmentName VARCHAR(100)
);

CREATE TABLE employee_department (
	employeeID INT,
    departmentID INT,
    FOREIGN KEY (employeeID) REFERENCES employee(employeeID),
    FOREIGN KEY (departmentID) REFERENCES department(departmentID)
);

INSERT INTO employee (employeeName, age, salary) VALUES
('Hà Minh Châu', 30, 80.000),
('Trần Kim Linh', 25, 42.000),
('Lê Minh Mẫn', 21, 100.000),
('Lê Minh Mẫn', 21, 90.000),
('Nguyễn Thị Mai', 27, 75.000),
('Trần Anh Tuấn', 29, 49.000),
('Phan Minh Quân', 32, 95.000),
('Nguyễn Văn Duy', 24, 45.000),
('Lê Thanh Thảo', 26, 72.000),
('Trần Minh Quân', 28, 100.000),
('Nguyễn Thị Thanh', 30, 32.00),
('Lê Duy Hùng', 22, 56.00);

INSERT INTO department (departmentName) VALUES
('Kinh doanh'),
('Kỹ thuật'),
('Marketing'),
('Kế toán');

INSERT INTO employee_department (employeeID, departmentID) VALUES
(1, 1),
(2, 2),
(3, 3),
(4, 3),
(5, 4),
(6, 2),
(7, 1),
(8, 1),
(9, 2),
(10, 3),
(11, 4),
(12, 2),
(10, 4),
(11, 2),
(12, 3),
(1, 4),
(1, 2),
(10, 1);

-- a.liệt kê tất cả các nhân viên trong bộ phận có tên là "Kế toán".
-- Kết quả cần hiển thị mã nhân viên và tên nhân viên.
SELECT 
	e.employeeID,
    e.employeeName
FROM employee_department ed
JOIN 
	employee e ON ed.employeeID = e.employeeID
JOIN
	department d ON ed.departmentID = d.departmentID
WHERE d.departmentName = 'Kế toán';

-- b.tìm các nhân viên có mức lương lớn hơn 50,000
-- Kết quả trả về cần bao gồm mã nhân viên, tên nhân viên và mức lương.
SELECT 
	employeeID,
	employeeName, 
    salary
FROM employee
WHERE salary > 50.000;

-- c.hiển thị tất cả các bộ phận và số lượng nhân viên trong từng bộ phận
-- Kết quả trả về cần bao gồm tên bộ phận và số lượng nhân viên.
SELECT 
	d.departmentName AS 'Department Name',
    COUNT(ed.employeeID) AS 'Total employee'
FROM employee_department ed
JOIN
	department d ON ed.departmentID = d.departmentID
GROUP BY d.departmentName;

-- d.tìm ra các thành viên có mức lương cao nhất theo từng bộ phận 
-- Kết quả trả về là một danh sách theo bất cứ thứ tự nào.
SELECT 
  d.departmentName AS 'Department Name',
  e.employeeName AS 'Employee Name',
  e.salary AS 'Salary'
FROM employee e
JOIN 
	employee_department ed ON e.employeeID = ed.employeeID
JOIN 
	department d ON ed.departmentID = d.departmentID
WHERE e.salary = (
    SELECT MAX(e.salary)
    FROM employee e
    JOIN 
		employee_department ed ON e.employeeID = ed.employeeID
    WHERE ed.departmentID = d.departmentID
)
ORDER BY e.salary;

-- e.tìm các bộ phận có tổng mức lương của nhân viên vượt quá 200,000
--  Kết quả trả về bao gồm tên bộ phận và tổng mức lương của bộ phận đó.
SELECT 
    d.departmentName AS 'Department Name',
    SUM(e.salary) AS 'Total Salary'
FROM employee e
JOIN 
	employee_department ed ON e.employeeID = ed.employeeID
JOIN 
	department d ON ed.departmentID = d.departmentID
GROUP BY d.departmentID
HAVING SUM(e.salary) > 200.000;
-- f.liệt kê tất cả các nhân viên làm việc trong hơn 2 bộ phận khác nhau. 
-- Kết quả cần hiển thị mã nhân viên, tên nhân viên và số lượng bộ phận mà họ tham gia.
SELECT 
    e.employeeID,
    e.employeeName,
    COUNT(DISTINCT ed.departmentID) AS 'Department'
FROM employee e
JOIN 
	employee_department ed ON e.employeeID = ed.employeeID
GROUP BY e.employeeID
HAVING COUNT(DISTINCT ed.departmentID) > 2;
