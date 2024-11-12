DROP DATABASE IF EXISTS ECommerceDB;
CREATE DATABASE ECommerceDB;
USE ECommerceDB;

CREATE TABLE Users (
	`UserId` INT PRIMARY KEY AUTO_INCREMENT,
    `UserName` VARCHAR(50) UNIQUE NOT NULL,
    `PasswordHash` VARCHAR(255) NOT NULL,
    `email` VARCHAR(100) NOT NULL,
    `createAt` DATETIME
);

CREATE TABLE Orders (
	`OrderID` INT PRIMARY KEY AUTO_INCREMENT,
    `OrderDate` DATE,
    `UserId` INT,
    `TotalAmount` DECIMAL(10,2),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

CREATE TABLE Products (
	`ProductId` INT PRIMARY KEY AUTO_INCREMENT,
    `ProductName` VARCHAR(50) UNIQUE,
    `description` TEXT,
    `price` DECIMAL(10, 2) ,
    `stock` INT 
);

CREATE TABLE OrderDetails (
	`OrderDetailID` INT PRIMARY KEY AUTO_INCREMENT,
    `OrderID` INT,
    `ProductID` INT, 
    `Quantity` INT NOT NULL,
    `PriceAtOrder` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (OrderID) REFERENCES Orders(OrderID),
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId)
);

CREATE TABLE Reviews (
	`ReviewId` INT PRIMARY KEY AUTO_INCREMENT,
    `ProductID` INT,
    `UserId` INT,
    `rating` INT,
    `reviewText` text,
    `createAt` DATETIME,
    FOREIGN KEY (ProductId) REFERENCES Products(ProductId),
    FOREIGN KEY (UserId) REFERENCES Users(UserId)
);

ALTER TABLE Users
ADD CONSTRAINT UNIQUE (Username);

ALTER TABLE Users
ADD CONSTRAINT UNIQUE (email);

ALTER TABLE Products
MODIFY COLUMN ProductName VARCHAR(255) NOT NULL;

ALTER TABLE Products
MODIFY COLUMN Price DECIMAL(10, 2) NOT NULL;

ALTER TABLE Products
MODIFY COLUMN Stock INT NOT NULL;

ALTER TABLE Orders
ADD CONSTRAINT CHECK (TotalAmount >= 0);

ALTER TABLE OrderDetails 
ADD CONSTRAINT CHECK (Quantity >= 0);

ALTER TABLE OrderDetails 
ADD CONSTRAINT CHECK (PriceAtOrder >= 0);

ALTER TABLE Reviews
ADD CONSTRAINT CHECK (Rating BETWEEN 1 AND 5);
