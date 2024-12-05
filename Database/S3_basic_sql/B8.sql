DROP DATABASE IF EXISTS S3_bai8;
CREATE DATABASE S3_bai8;
USE S3_bai8;

CREATE TABLE invoices (
	invoiceID INT PRIMARY KEY AUTO_INCREMENT,
    invoiceDate DATETIME,
    customerName VARCHAR(100) NOT NULL
);

CREATE TABLE products (
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100),
    price DECIMAL(10, 2)
);

CREATE TABLE invoiceDetails (
	detailID INT PRIMARY KEY AUTO_INCREMENT,
    productID INT NOT NULL,
    quantity INT NOT NULL,
    price DECIMAL(10, 2),
    FOREIGN KEY (productID) REFERENCES products(productID)
);

INSERT INTO products (productName, price)
VALUES
('Sản phẩm A', 50.00),
('Sản phẩm B', 30.00),
('Sản phẩm C', 20.00);

INSERT INTO invoices (invoiceDate, customerName)
VALUES
('2024-12-05 10:00:00', 'Nguyễn Văn A'),
('2024-12-06 11:00:00', 'Lê Thị B');

INSERT INTO invoiceDetails (productID, quantity, price)
VALUES
(1, 2, 50.00),
(2, 3, 30.00), 
(1, 1, 50.00), 
(3, 5, 20.00); 

UPDATE products
SET price = 55.00
WHERE productID = 1;

UPDATE invoiceDetails
SET quantity = 10
WHERE detailID = 2;

DELETE FROM products
WHERE productID = 3;

DELETE FROM invoiceDetails
WHERE detailID = 1;

SELECT i.invoiceID, i.customerName, SUM(id.price * id.quantity) AS totalAmount
FROM invoices i
JOIN invoiceDetails id ON i.invoiceID = id.invoiceID
GROUP BY i.invoiceID, i.customerName;

SELECT i.invoiceID, i.customerName, p.productName, id.quantity, id.price
FROM invoiceDetails id
JOIN invoices i ON id.invoiceID = i.invoiceID
JOIN products p ON id.productID = p.productID;