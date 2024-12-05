DROP DATABASE IF EXISTS S4_bai1;
CREATE DATABASE S4_bai1;
USE S4_bai1;

CREATE TABLE customers (
	customerID INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(100) NOT NULL,
    contactEmail VARCHAR(100) UNIQUE NOT NULL
);

CREATE TABLE orders (
	orderID INT PRIMARY KEY AUTO_INCREMENT,
    customerID INT NOT NULL, 
    orderDate DATETIME,
    totalAmount DECIMAL(10, 2) NOT NULL
);

SELECT 
	o.orderID, 
	o.orderDate, 
    o.totalAmount, 
    c.name AS customerName, c.contactEmail
FROM orders o
JOIN customers c ON o.customerID = c.customerID;
