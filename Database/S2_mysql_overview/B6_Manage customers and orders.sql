DROP DATABASE IF EXISTS S2_bai6;
CREATE DATABASE S2_bai6;
USE S2_bai6;

CREATE TABLE Customers (
	CustomerID INT PRIMARY KEY AUTO_INCREMENT,
    CustomerName VARCHAR(100),
    Email VARCHAR(100),
    Phone VARCHAR(15) UNIQUE
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
	CustomerID INT,
	OrderDate DATE,
	FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE OrderDetails (
	OrderDetailID INT PRIMARY KEY AUTO_INCREMENT,
    OrderID INT,
    ProductID INT, 
    Quantity INT NOT NULL,
    UnitPrice DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID)
);

INSERT INTO Customers (CustomerName, Email, Phone) VALUES
('Trân Châu', 'tranchau@gmail.com', '0123 456 789'),
('Mai Hồng', 'maihong@gmail.com', '0987 654 321');

INSERT INTO Orders (CustomerID, OrderDate) VALUES
(1, '2024-11-05'),
(2, '2024-11-02'),
(1, '2024-11-05');

INSERT INTO OrderDetails (OrderID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 15.00),
(2, 3, 1, 20.00),
(3, 2, 2, 10.00),
(1, 4, 3, 25.00),
(3, 5, 4, 18.00);

UPDATE Customers
SET Phone = '0145 567 213'
WHERE CustomerID = 1;
SELECT * FROM Customers;

-- DELETE FROM Orders
-- WHERE CustomerID NOT IN (SELECT CustomerID FROM Customers);

SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

SELECT c.CustomerID, c.CustomerName, COUNT(o.OrderID) AS TotalOrders
FROM Customers c
LEFT JOIN Orders o ON c.CustomerID = o.CustomerID
GROUP BY c.CustomerID, c.CustomerName;

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100)
);
INSERT INTO Products (ProductName) VALUES
('Product 1'),
('Product 2'),
('Product 3'),
('Product 4'),
('Product 5');

SELECT o.OrderID, p.ProductName, 
       SUM(od.Quantity) AS Quantity,
       SUM(od.Quantity * od.UnitPrice) AS TotalAmount
FROM OrderDetails od
JOIN Products p ON od.ProductID = p.ProductID
JOIN Orders o ON od.OrderID = o.OrderID
GROUP BY o.OrderID, p.ProductName;
