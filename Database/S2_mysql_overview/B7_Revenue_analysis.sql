DROP DATABASE IF EXISTS S2_bai7;
CREATE DATABASE S2_bai7;
USE S2_bai7;

CREATE TABLE Sales (
	SaleId INT PRIMARY KEY AUTO_INCREMENT,
    SaleDate DATE,
    CustomerID INT,
    TotalAmount DECIMAL(10,2)
);

CREATE TABLE Products (
    ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(255),
    Category VARCHAR(255),
    Price DECIMAL(10, 2)
);

CREATE TABLE SalesDetails (
	SalesDetailID INT PRIMARY KEY AUTO_INCREMENT,
    SaleId INT,
    ProductID INT,
    Quantity INT,
    UnitPrice DECIMAL(10, 2),
    FOREIGN KEY (SaleId) REFERENCES Sales(SaleId),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Sales (SaleDate, CustomerID, TotalAmount) VALUES
('2024-10-05', 1, 150.00),
('2024-10-15', 2, 200.00),
('2024-09-20', 3, 250.00),
('2024-07-30', 4, 300.00);

INSERT INTO Products (ProductName, Category, Price) VALUES
('Product A', 'Electronics', 50.00),
('Product B', 'Electronics', 75.00),
('Product C', 'Clothing', 20.00),
('Product D', 'Clothing', 30.00),
('Product E', 'Furniture', 100.00);

INSERT INTO SalesDetails (SaleId, ProductID, Quantity, UnitPrice) VALUES
(1, 1, 2, 50.00),
(1, 3, 1, 20.00), 
(2, 2, 3, 75.00), 
(2, 4, 2, 30.00),
(3, 5, 1, 100.00), 
(4, 1, 1, 50.00); 

SELECT 
    p.Category,
    SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM Sales s
JOIN SalesDetails sd ON s.SaleId = sd.SaleId
JOIN Products p ON sd.ProductID = p.ProductID
WHERE QUARTER(s.SaleDate) = (SELECT QUARTER(MAX(SaleDate)) FROM Sales)
  AND YEAR(s.SaleDate) = (SELECT YEAR(MAX(SaleDate)) FROM Sales)
GROUP BY p.Category;

SELECT p.Category,
       SUM(sd.Quantity * sd.UnitPrice) AS TotalRevenue
FROM Sales s
JOIN SalesDetails sd ON s.SaleId = sd.SaleId
JOIN Products p ON sd.ProductID = p.ProductID
GROUP BY p.Category
ORDER BY TotalRevenue DESC
LIMIT 1;
