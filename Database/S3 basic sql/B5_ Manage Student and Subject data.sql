DROP DATABASE IF EXISTS S3_bai4;
CREATE DATABASE S3_bai4;
USE S3_bai4;

CREATE TABLE students (
	 studentID INT PRIMARY KEY AUTO_INCREMENT,
     studentName VARCHAR(50) NOT NULL,
     major VARCHAR(50) NOT NULL
);

CREATE TABLE courses (
	courseID INT PRIMARY KEY AUTO_INCREMENT,
    courseName VARCHAR(100) NOT NULL,
    instructor VARCHAR(50) NOT NULL
);

INSERT INTO students (studentName, major) VALUES
('Vũ Hà Trang', 'công nghệ thông tin Việt Nhật'),
('Nguyễn Phi Hùng', 'công nghệ thông tin Việt Nhật'),
('Vũ Minh Thư', 'khoa học máy tính'),
('Trân Châu', 'Ngôn ngữ Anh');

INSERT INTO courses (courseName, instructor) VALUES
('Mathematics', 'Dr. John Doe'),
('Physics', 'Dr. Jane Smith'),
('Chemistry', 'Dr. Emily Brown');

UPDATE courses
SET courseName = 'Advanced Mathematics'
WHERE courseID = 2;

UPDATE students
SET major = 'Engineering'
WHERE studentID = 3;

DELETE FROM students
WHERE studentID = 1;

DELETE FROM courses
WHERE courseID = 3;

SELECT * FROM students;
SELECT * FROM courses;
