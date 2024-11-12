DROP DATABASE IF EXISTS S3_bai1;
CREATE DATABASE S3_bai1;
USE S3_bai1;

CREATE TABLE Students (
	StudentID INT PRIMARY KEY AUTO_INCREMENT,
    Name VARCHAR(50),
    Age INT,
    Major VARCHAR(255)
);

INSERT INTO Students (Name, Age, Major) VALUES
('Alice', 20, 'Computer Science'),
('Bob', 22, 'Mathematics'),
('Charlie', 21, 'Physics');

UPDATE Students
SET Age = 23
WHERE StudentID = 2;

DELETE FROM Students
WHERE StudentID = 1;

SELECT * FROM Students;
