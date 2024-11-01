DROP DATABASE IF EXISTS Bai8;
CREATE DATABASE Bai8;
USE Bai8;

CREATE TABLE Project (
	`Project_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Project _name` VARCHAR(50) NOT NULL,
    `start_day` DATE NOT NULL,
    `end_day` DATE NOT NULL,
    `Budget` DECIMAL(10, 2)
);

CREATE TABLE Employee (
	`Employee_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Employee_name` VARCHAR(50) NOT NULL,
    `Position` VARCHAR(50) NOT NULL
);

CREATE TABLE Assignment (
	`Assignment_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Employee_id` INT NOT NULL,
    `Project_id` INT NOT NULL,
    `start_day` DATE NOT NULL,
    `end_day` DATE NOT NULL,
    FOREIGN KEY (Employee_id) REFERENCES Employee(Employee_id),
    FOREIGN KEY (Project_id) REFERENCES Project(Project_id)
);

CREATE TABLE Task (
	`Task_id` INT PRIMARY KEY AUTO_INCREMENT,
    `Task_name` VARCHAR(50) NOT NULL,
    `Project_id` INT NOT NULL,
    `start_day` DATE NOT NULL,
    `end_day` DATE NOT NULL,
    FOREIGN KEY (Project_id) REFERENCES Project(Project_id)
);
