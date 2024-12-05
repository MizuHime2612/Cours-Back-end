DROP DATABASE IF EXISTS S3_bai7;
CREATE DATABASE S3_bai7;
USE S3_bai7;

CREATE TABLE customers (
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(50) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    joinDate DATE
);

CREATE TABLE orders (
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT NOT NULL, 
    orderDate DATETIME,
    totalAmount DECIMAL(10, 2) NOT NULL
);

INSERT INTO customers (name, email, joinDate) VALUES
('Nguyen Van A', 'a@gmail.com', '2024-12-01'),
('Le Thi B', 'b@gmail.com', '2024-12-02'),
('Tran Van C', 'c@gmail.com', '2024-12-03'),
('Pham Thi D', 'd@gmail.com', '2024-12-04');

INSERT INTO orders (customerID, orderDate, totalAmount)
VALUES
(1, '2024-12-01 10:00:00', 100.00),
(2, '2024-12-02 11:00:00', 200.00),
(3, '2024-12-03 12:00:00', 300.00),
(2, '2024-12-03 13:00:00', 150.00),
(4, '2024-12-04 14:00:00', 250.00);

UPDATE orders
SET totalAmount = 350.00
WHERE orderID = 3;

UPDATE customers
SET email = 'b1@gmail.com'
WHERE customerID = 2;

DELETE FROM customers
WHERE customerID = 4;

DELETE FROM orders
WHERE orderID = 1;

SELECT o.orderID, o.orderDate, o.totalAmount, c.name AS customerName
FROM orders o
JOIN customers c ON o.customerID = c.customerID;

SELECT c.customerID, c.name, SUM(o.totalAmount) AS totalOrderAmount
FROM orders o
JOIN customers c ON o.customerID = c.customerID
GROUP BY c.customerID, c.name;