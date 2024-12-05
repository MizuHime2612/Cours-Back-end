create database Bai3;
use Bai3;

create table student (
MSV int primary key auto_increment,
nameStudent varchar(255) not null,
birthday date
);

create table course (
id int primary key auto_increment,
nameCourse varchar(255) not null,
price decimal(10, 2)
);

create table enrollment (
MSV int,
MKH int,
registrationDate Date,
foreign key (MSV) references student(MSV),
foreign key (MKH) references course(id)
);
