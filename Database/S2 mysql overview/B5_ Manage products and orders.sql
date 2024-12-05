DROP DATABASE IF EXISTS S2_bai5;
CREATE DATABASE S2_bai5;
USE S2_bai5;

CREATE TABLE Products (
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100) NOT NULL,
    Category VARCHAR(50),
    Price DECIMAL(10, 2),
    StockQuantity INT
);

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT,
    OrderDate DATE,
    ProductID INT,
    Quantity INT,
    TotalAmount DECIMAL(10,2),
    CHECK (TotalAmount > 0),
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Gà rán', 'Đồ ăn nhanh', 35.00, 100),
('Bánh mỳ pate', 'Đồ ăn sáng', 15.00, 120),
('Bánh kem', 'Đồ ngọt', 20.00, 50);

INSERT INTO Orders (OrderDate, ProductID, Quantity, TotalAmount) VALUES
('2024-11-03', 1, 2, 70.00),
('2024-11-04', 2, 1, 15.00);

-- Cập nhật giá của một sản phẩm cụ thể trong bảng Products.
UPDATE Products
Set Price = 40.00
WHERE ProductID = '1';
SELECT * FROM Products;

-- Tính toán và cập nhật TotalAmount trong bảng Orders dựa trên Quantity và Price của sản phẩm liên quan.Tính toán và cập nhật TotalAmount trong bảng Orders dựa trên Quantity và Price của sản phẩm liên quan.
INSERT INTO Orders (OrderDate, ProductID, Quantity) VALUES
('2024-11-03', 3, 3),
('2024-11-04', 1, 4);
UPDATE Orders o
JOIN Products p ON o.ProductID = p.ProductID
SET o.TotalAmount = o.Quantity * p.Price
WHERE o.ProductID IS NOT NULL;

SELECT * FROM Orders;

-- Viết truy vấn để lấy danh sách tất cả sản phẩm và số lượng còn lại trong kho.
SELECT ProductName, StockQuantity FROM Products;

-- Viết truy vấn để lấy thông tin về tất cả các đơn hàng cùng với tên sản phẩm, số lượng, và tổng số tiền của từng đơn hàng.
SELECT o.OrderID, o.OrderDate, p.ProductName, o.Quantity, o.TotalAmount
FROM Orders o
JOIN Products p ON o.ProductID = p.ProductID;
