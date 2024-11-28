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

-- EX1
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
SET Quantity = 150
WHERE ProductID = 1;

-- EX2
DELIMITER $$
CREATE TRIGGER BeforeProductDelete
BEFORE DELETE ON Products
FOR EACH ROW
BEGIN
    IF OLD.Quantity > 10 THEN
        SIGNAL SQLSTATE '45000'
        SET MESSAGE_TEXT = 'Số lượng sản phẩm lớn hơn 10, không thể xóa!';
    END IF;
END $$
DELIMITER ;

DELETE FROM Products
WHERE ProductID = 1;

-- EX3
ALTER TABLE Products
ADD COLUMN LastUpdated DATETIME DEFAULT NULL;

DELIMITER $$
CREATE TRIGGER AfterProductUpdateSetDate
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    SET LastUpdated = NOW();
END $$
DELIMITER ;

UPDATE Products
SET Quantity = 160
WHERE ProductID = 1;

-- EX4
CREATE TABLE ProductSummary(
	SummaryID INT PRIMARY KEY AUTO_INCREMENT,
    TotalQuantity INT
);
INSERT INTO ProductSummary (TotalQuantity)
VALUES (0);

DELIMITER $$
CREATE TRIGGER AfterProductUpdateSummary
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
	UPDATE ProductSummary
    SET TotalQuantity = (SELECT SUM(Quantity) FROM Products);
END $$
DELIMITER ;
DROP TRIGGER AfterProductUpdateSummary;
SET SQL_SAFE_UPDATES = 0;
UPDATE Products
SET Quantity = 130
WHERE ProductID = 1;

-- EX5
CREATE TABLE InventoryChangeHistory(
	HistoryID INT PRIMARY KEY AUTO_INCREMENT,
    ProductID INT,
    OldQuantity INT,
    NewQuantity INT,
    ChangeType ENUM( "INCREASE", "DECREASE"),
    ChangeDate DATETIME,
    FOREIGN KEY (ProductID) REFERENCES Products(ProductID)
);

DELIMITER $$
CREATE TRIGGER AfterProductUpdateHistory
AFTER UPDATE ON Products
FOR EACH ROW
BEGIN
    DECLARE change_type ENUM('INCREASE', 'DECREASE');
    IF NEW.Quantity > OLD.Quantity THEN
        SET change_type = 'INCREASE';
    ELSEIF NEW.Quantity < OLD.Quantity THEN
        SET change_type = 'DECREASE';
    ELSE
        SET change_type = 'NO CHANGE';
    END IF;

    INSERT INTO InventoryChangeHistory (ProductID, OldQuantity, NewQuantity, ChangeType, ChangeDate)
    VALUES (OLD.ProductID, OLD.Quantity, NEW.Quantity, change_type, NOW());
END $$
DELIMITER ;

UPDATE Products
SET Quantity = 200
WHERE ProductID = 1;
