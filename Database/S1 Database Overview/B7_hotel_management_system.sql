DROP DATABASE IF EXISTS Bai7;
CREATE DATABASE Bai7;
USE Bai7;

CREATE TABLE Guest (
	`guest_id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `address` VARCHAR(100) NOT NULL,
    `email` VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE Room (
	`room_id` INT PRIMARY KEY AUTO_INCREMENT,
    `room_type` VARCHAR(50) NOT NULL,
    `room_price` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Reservation  (
	`reservation_id` INT PRIMARY KEY AUTO_INCREMENT,
    `guest_id` INT NOT NULL,
    `room_id` INT NOT NULL,
    `start_day` DATE NOT NULL,
    `end_day` DATE NOT NULL,
     FOREIGN KEY (guest_id) REFERENCES Guest(guest_id),
     FOREIGN KEY (room_id) REFERENCES Room(room_id)
);

CREATE TABLE Service (
	`service_id` INT PRIMARY KEY AUTO_INCREMENT,
    `service_name` VARCHAR(50) NOT NULL,
    `service_price` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE ServiceUsage (
	`serviceUsage_id` INT PRIMARY KEY AUTO_INCREMENT,
    `reservation_id` INT NOT NULL,
    `service_id` INT NOT NULL,
    `date_use` DATE NOT NULL,
    FOREIGN KEY (reservation_id) REFERENCES Reservation(reservation_id),
	FOREIGN KEY (service_id) REFERENCES Service(service_id)
);
