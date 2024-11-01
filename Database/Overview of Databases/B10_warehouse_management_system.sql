DROP DATABASE IF EXISTS Bai10;
CREATE DATABASE Bai10;
USE Bai10;

CREATE TABLE Product (
	`Product_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Product_name` VARCHAR(50) NOT NULL,
    `Product_type` VARCHAR(50) NOT NULL,
    `Product_price` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Warehouse (
	`Warehouse_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Warehouse_name` VARCHAR(50) NOT NULL,
    `Warehouse_address` VARCHAR(50) NOT NULL
);

CREATE TABLE Stock (
	`Warehouse_id` INT NOT NULL,
    `Product_id` INT NOT NULL,
    `quantity` INT NOT NULL,
    FOREIGN KEY (Warehouse_id) REFERENCES Warehouse(Warehouse_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);

CREATE TABLE Orders (
	`Order_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Order_day` DATE NOT NULL,
    `Delivery_day` DATE NOT NULL,
    `TotalOrderValue` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE OrderDetail (
	`Order_id` INT NOT NULL,
    `Product_id` INT NOT NULL,
    `Quantity` INT NOT NULL,
    `UnitPrice` DECIMAL(10, 2) NOT NULL,
    FOREIGN KEY (Order_id) REFERENCES Orders(Order_id),
    FOREIGN KEY (Product_id) REFERENCES Product(Product_id)
);
