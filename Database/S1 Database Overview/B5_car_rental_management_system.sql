DROP DATABASE IF EXISTS Bai5;
CREATE DATABASE Bai5;
USE Bai5;

CREATE TABLE customer (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `phone` VARCHAR(100) UNIQUE
);

CREATE TABLE car (
    `id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `vehicle_type` VARCHAR(100) NOT NULL,
    `price` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE rental(
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `customer_id` INT,
    `car_id` INT,
    `start_day` DATE NOT NULL,
    `end_day` DATE NOT NULL,
    `total_amount` DECIMAL(10, 2),
    FOREIGN KEY (customer_id) REFERENCES customer(id),
    FOREIGN KEY (car_id) REFERENCES car(id)
);

DELIMITER //

CREATE TRIGGER calculate_total_amount
BEFORE INSERT ON rental
FOR EACH ROW
BEGIN
    DECLARE daily_price DECIMAL(10, 2);
    -- Lấy giá thuê theo ngày từ bảng car
    SELECT price INTO daily_price FROM car WHERE id = NEW.car_id;
    -- Tính tổng số tiền thuê
    SET NEW.total_amount = DATEDIFF(NEW.end_day, NEW.start_day) * daily_price;
END;
//

DELIMITER ;

INSERT INTO customer (name, address, phone) VALUES
('Vũ Hà Trang', 'Thái Bình', '0388 xxx 291'),
('Nguyễn Phi Hùng', 'Thái Bình', '0392 xxx 996'),
('Vũ Minh Thư', 'Thái Bình', '0934 xxx 890'),
('Trần Trân Châu', 'Hà Nội', '0935 xxx 810'),
('Ngô Hương Sen', 'Nghệ An', '0735 xxx 815');

INSERT INTO car (name, vehicle_type, price) VALUES
('Toyota Camry', 'Sedan', 500.00),
('Honda Civic', 'Sedan', 450.00),
('Ford Ranger', 'Truck', 700.00),
('Hyundai Tucson', 'SUV', 550.00),
('Mazda CX-5', 'SUV', 600.00);

INSERT INTO rental (customer_id, car_id, start_day, end_day) VALUES
(1, 1, '2024-10-01', '2024-10-05'), 
(2, 2, '2024-10-03', '2024-10-06'), 
(3, 3, '2024-10-04', '2024-10-10'),
(4, 4, '2024-10-03', '2024-10-11'),
(5, 5, '2024-10-07', '2024-10-15');

SELECT * FROM customer;

SELECT * FROM car;

SELECT * FROM rental;
