DROP DATABASE IF EXISTS S3_bai6;
CREATE DATABASE S3_bai6;
USE S3_bai6;

CREATE TABLE suppliers (
	supplierID INT PRIMARY KEY AUTO_INCREMENT,
    SupplierName VARCHAR(100),
    contactEmail VARCHAR(100) UNIQUE
);

CREATE TABLE products (
	productID INT PRIMARY KEY AUTO_INCREMENT,
    productName VARCHAR(100),
    supplierID INT,
    price DECIMAL(10, 2),
    stock INT,
    FOREIGN KEY (supplierID) REFERENCES suppliers(supplierID)
);

INSERT INTO suppliers (SupplierName, contactEmail)
VALUES
    ('Supplier A', 'supplierA@gmail.com'),
    ('Supplier B', 'supplierB@gmail.com'),
    ('Supplier C', 'supplierC@gmail.com');

INSERT INTO products (productName, supplierID, price, stock)
VALUES
    ('Product 1', 1, 19.99, 100),
    ('Product 2', 2, 39.99, 50),
    ('Product 3', 1, 29.99, 75),
    ('Product 4', 3, 49.99, 25);

UPDATE products
SET price = 45.99
WHERE productID = 2;

UPDATE suppliers
SET SupplierName = 'Updated Supplier A'
WHERE supplierID = 1;

DELETE FROM suppliers
WHERE supplierID = 3;

DELETE FROM products
WHERE productID = 4;

SELECT 
    p.*,
    s.*
FROM products p
JOIN suppliers s ON p.supplierID = s.supplierID;