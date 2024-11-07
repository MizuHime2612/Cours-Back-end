DROP DATABASE IF EXISTS S2_bai4;
CREATE DATABASE S2_bai4;
USE S2_bai4;

CREATE TABLE Orders (
	OrderID INT PRIMARY KEY AUTO_INCREMENT, 
    OrderDate DATE NOT NULL, 
    CustomerID INT,
    TotalAmount DECIMAL(10,2),
    FOREIGN KEY (CustomerID) REFERENCES Customers(customer_id),
    CHECK (TotalAmount >= 0)
);
