DROP DATABASE IF EXISTS Bai6;
CREATE DATABASE Bai6;
USE Bai6;

CREATE TABLE Event (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(50) NOT NULL,
	`start_day` DATE NOT NULL,
	`location` VARCHAR(50) NOT NULL,
	`budget` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE Attendee (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
	`name` VARCHAR(100) NOT NULL,
	`email` VARCHAR(50) NOT NULL UNIQUE
);

CREATE TABLE EventAttendee (
	`event_id` INT,
    `attendee_id` INT,
    `RegistrationDate` DATE NOT NULL,
    `TicketType` VARCHAR(50) NOT NULL, 
    FOREIGN KEY (event_id) REFERENCES Event(id),
    FOREIGN KEY (attendee_id) REFERENCES Attendee(id)
);
CREATE TABLE Sponsor (
	`id` INT PRIMARY KEY AUTO_INCREMENT,
    `name` VARCHAR(100) NOT NULL,
    `sponsorship_amount` DECIMAL(10, 2) NOT NULL
);

CREATE TABLE EventSponsor (
	`event_id` INT,
	`sponsor_id` INT,
	`contribution_date` DATE NOT NULL,
    `sponsor_level` VARCHAR(50) NOT NULL,
    `notes` TEXT,
	FOREIGN KEY (event_id) REFERENCES Event(id),
    FOREIGN KEY (sponsor_id) REFERENCES Sponsor(id)
);

INSERT INTO Event (name, start_day, location, budget) VALUES
('Hội thảo Công nghệ 2024', '2024-05-15', 'Hà Nội', 50000000.00),
('Triển lãm Nghệ thuật', '2024-06-20', 'Hồ Chí Minh', 30000000.00),
('Lễ hội Ẩm thực', '2024-07-10', 'Đà Nẵng', 25000000.00);

INSERT INTO Attendee (name, email) VALUES
('Vũ Hà Trang', 'sarameotb@gmail.com'),
('Nguyễn Phi Hùng', 'raijin2306@gmail.com'),
('Vũ Minh Thư', 'thuv1907@gmail.com');

INSERT INTO Sponsor (name, sponsorship_amount) VALUES
('Công ty A', 20000000.00),
('Công ty B', 15000000.00),
('Công ty C', 30000000.00);

INSERT INTO EventAttendee (event_id, attendee_id, RegistrationDate, TicketType) VALUES
(1, 1, '2024-04-01', 'Vé VIP'),
(1, 2, '2024-04-02', 'Vé Thường'),
(2, 1, '2024-05-01', 'Vé VIP'),
(3, 3, '2024-06-01', 'Vé Thường');

INSERT INTO EventSponsor (event_id, sponsor_id, contribution_date, sponsor_level, notes) VALUES
(1, 1, '2024-04-10', 'Vàng', 'Tài trợ cho sự kiện chính'),
(3, 2, '2024-04-15', 'Bạc', 'Tài trợ bữa tiệc tối'),
(2, 3, '2024-05-15', 'Đồng', 'Tài trợ quà tặng cho khách tham dự');

-- sự kiện một khách mời tham dự
SELECT 
    Event.id AS EventID, 
    Event.name AS EventName, 
    Attendee.name AS AttendeeName
FROM Event
JOIN EventAttendee ON Event.id = EventAttendee.event_id
JOIN Attendee ON EventAttendee.attendee_id = Attendee.id
WHERE Attendee.email = 'sarameotb@gmail.com';   

-- nhà tài trợ của sự kiện
SELECT 
Sponsor.id AS SponsorID, 
Sponsor.name AS SponsorName,
Event.name AS EventName
FROM Sponsor
JOIN EventSponsor ON Sponsor.id = EventSponsor.sponsor_id
JOIN Event ON EventSponsor.event_id = Event.id
WHERE Event.id = 3; 
