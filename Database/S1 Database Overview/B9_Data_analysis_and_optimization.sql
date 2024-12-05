DROP DATABASE IF EXISTS Bai9;
CREATE DATABASE Bai9;
USE Bai9;

CREATE TABLE Stores (
	 `StoreID` INT PRIMARY KEY AUTO_INCREMENT,
     `StoreName` VARCHAR(50) NOT NULL
);

CREATE TABLE Customers (
	`CustomerID` INT PRIMARY KEY AUTO_INCREMENT,
    `CustomerName` VARCHAR(50) NOT NULL
);

CREATE TABLE  Sales (
	`SaleID` INT PRIMARY KEY AUTO_INCREMENT,
    `SaleDate` DATE NOT NULL,
    `StoreID` INT NOT NULL,
    `CustomerID` INT NOT NULL,
    `TotalAmount` DECIMAL(10, 2),
    FOREIGN KEY (StoreID) REFERENCES Stores(StoreID),
    FOREIGN KEY (CustomerID) REFERENCES Customers(CustomerID)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL
);

CREATE TABLE SalesDetails (
	`SaleDetailID` INT PRIMARY KEY AUTO_INCREMENT,
    `SaleID` INT NOT NULL,
    `ProductID` INT NOT NULL,
    `Quantity` INT NOT NULL,
    `UnitPrice` DECIMAL(10, 2),
    FOREIGN KEY (SaleID) REFERENCES Sales(SaleID),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Stores (StoreName) VALUES
('Cửa hàng 1'),
('Cửa hàng 2'),
('Cửa hàng 3'),
('Cửa hàng 4'),
('Cửa hàng 5');

INSERT INTO Customers (CustomerName) VALUES
('Vũ Hà Trang'),
('Nguyễn Phi Hùng'),
('Lê Hoa Nhài'),
('Trần Trân Châu'),
('Ngô Minh Trang');

INSERT INTO Products (ProductName) VALUES
('Sản phẩm A'),
('Sản phẩm B'),
('Sản phẩm C'),
('Sản phẩm D'),
('Sản phẩm E');

INSERT INTO Sales (SaleDate, StoreID, CustomerID, TotalAmount) VALUES
('2023-01-05', 5, 1, 1500.00),
('2023-02-10', 5, 2, 2000.00),
('2023-03-15', 5, 3, 1000.00),
('2023-04-20', 5, 4, 3000.00),
('2023-05-25', 5, 5, 2500.00),
('2023-06-30', 5, 1, 2200.00),
('2023-07-10', 5, 2, 1800.00),
('2023-08-20', 5, 3, 1600.00),
('2023-09-30', 5, 4, 1700.00),
('2023-10-25', 5, 5, 2000.00),
('2024-01-15', 1, 1, 5000.00),
('2024-02-20', 1, 1, 8000.00),
('2024-03-10', 1, 2, 3000.00),
('2024-04-05', 1, 3, 1500.00),
('2024-05-12', 2, 1, 6000.00),
('2024-06-22', 2, 2, 15000.00),
('2024-07-30', 3, 2, 7000.00),
('2024-08-18', 3, 3, 12000.00),
('2024-09-25', 1, 4, 500.00),
('2024-10-10', 1, 5, 2500.00),
('2024-11-01', 2, 1, 3000.00),
('2024-10-01', 1, 1, 1500.00),
('2024-10-02', 2, 2, 2000.00),
('2024-10-05', 3, 3, 750.00),
('2024-11-01', 4, 4, 300.00),
('2024-11-01', 5, 5, 1200.00),
('2024-11-01', 1, 1, 1800.00),
('2024-11-01', 2, 2, 2200.00);

INSERT INTO SalesDetails (SaleID, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 1, 1500.00),
(1, 2, 2, 750.00),
(2, 1, 1, 2000.00),
(3, 4, 3, 250.00),
(4, 5, 2, 150.00),
(5, 3, 5, 240.00),
(1, 5, 1, 1800.00),
(1, 1, 2, 900.00),
(2, 4, 1, 1200.00),
(3, 2, 1, 2500.00),
(5, 4, 2, 400.00),
(5, 5, 5, 600.00),
(2, 3, 2, 750.00),
(3, 5, 3, 300.00);

-- B1
SELECT 
    s.StoreName, 
    SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM 
    Sales sa
JOIN 
    SalesDetails sd ON sa.SaleID = sd.SaleID
JOIN 
    Stores s ON sa.StoreID = s.StoreID
WHERE 
    sa.SaleDate >= DATE_FORMAT(NOW(), '%Y-%m-01') - INTERVAL (MONTH(NOW()) - 1) % 3 MONTH  
    AND sa.SaleDate < DATE_FORMAT(NOW(), '%Y-%m-01') + INTERVAL (3 - MONTH(NOW()) % 3) MONTH 
GROUP BY 
    s.StoreName
ORDER BY 
    TotalRevenue DESC
LIMIT 3;

-- B2
SELECT 
    p.ProductID, 
    p.ProductName,
    SUM(sd.Quantity * sd.UnitPrice) AS ProductRevenue,
    (SUM(sd.Quantity * sd.UnitPrice) / total.TotalRevenue) * 100 AS ContributionPercentage
FROM 
    Sales s
JOIN 
    SalesDetails sd ON s.SaleID = sd.SaleID
JOIN 
    Products p ON sd.ProductID = p.ProductID
JOIN 
    (SELECT SUM(TotalAmount) AS TotalRevenue
     FROM Sales
     WHERE StoreID = 5 AND YEAR(SaleDate) = YEAR(CURDATE()) - 1) AS total ON 1 = 1
WHERE 
    s.StoreID = 5  
    AND YEAR(s.SaleDate) = YEAR(CURDATE()) - 1
GROUP BY 
    p.ProductID, p.ProductName, total.TotalRevenue
ORDER BY 
    ProductRevenue DESC
LIMIT 0, 1000;

-- B3
SELECT 
    c.CustomerID, 
    c.CustomerName, 
    COUNT(s.SaleID) AS TotalOrders, 
    SUM(s.TotalAmount) AS TotalSpending
FROM 
    Customers c
JOIN 
    Sales s ON c.CustomerID = s.CustomerID
WHERE 
    YEAR(s.SaleDate) = 2024
GROUP BY 
    c.CustomerID, c.CustomerName
HAVING 
    SUM(s.TotalAmount) > 10000
ORDER BY 
    TotalSpending DESC;
