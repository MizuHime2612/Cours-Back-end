create database Bai2;
use Bai2;

create table Author (
    id int primary key auto_increment,
    nameAuthor varchar(255) not null,
    Bio text
);

create table Publisher (
    id int primary key auto_increment,
    namePublisher varchar(255) not null,
    address varchar(255)
);

create table Book (
    id int primary key auto_increment,
    title varchar(255) not null,
    publicationDate date,
    price decimal(10, 2),
    authorID int,
    publisherID int,
    foreign key (authorID) references Author(id),
    foreign key (publisherID) references Publisher(id)
);
