DROP DATABASE IF EXISTS InventoryManagement;
CREATE DATABASE InventoryManagement;
USE InventoryManagement;

CREATE TABLE Products(
	ProductID INT PRIMARY KEY AUTO_INCREMENT,
    ProductName VARCHAR(100),
	Quantity INT
);

CREATE TABLE InventoryChanges(
	ChangeID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    OldQuantity INT,
    NewQuantity INT,
    ChangeDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

INSERT INTO Products(ProductName, Quantity) VALUES
("Gà rán", 120),
("Khoai tây chiên", 110),
("Coca", 100);

DELIMITER $$
CREATE TRIGGER AfterProductUpdate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    INSERT INTO InventoryChanges (ProductID, OldQuantity, NewQuantity, ChangeDate)
    VALUES (OLD.ProductID, OLD.Quantity, NEW.Quantity, NOW());
END $$
DELIMITER ;

UPDATE Products
SET Quantity = 130
WHERE ProductID = 1;

UPDATE Products
SET Quantity = 90
WHERE ProductID = 1;
