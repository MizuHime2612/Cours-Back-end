DROP DATABASE IF EXISTS S2_bai2;
CREATE DATABASE S2_bai2;
USE S2_bai2;

CREATE TABLE Products (
	`ProductID` INT PRIMARY KEY AUTO_INCREMENT,
    `ProductName` VARCHAR(100) NOT NULL,
    `Category` VARCHAR(100) NOT NULL,
    `Price` DECIMAL(10, 2) NOT NULL,
    `StockQuantity` INT NOT NULL
);

INSERT INTO Products (ProductName, Category, Price, StockQuantity) VALUES
('Chocopie', 'Bánh', 20.00, 150),
('Kẹo dẻo', 'Kẹo', 15.00, 200),
('Socola', 'Kẹo', 50.00, 100);
