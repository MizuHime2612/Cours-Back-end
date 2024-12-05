create database Bai4;
use Bai4;

create table customer (
id int primary key auto_increment,
nameCustomer varchar(225) not null,
address varchar(255) not null
);

create table orders (
id int primary key auto_increment,
orderDate date not null,
totalAmount decimal(10, 2),
idCustomer int,
foreign key (idCustomer) references customer(id)
);

create table product (
id int primary key auto_increment,
nameProduct varchar(225) not null,
price decimal(10, 2),
idOrder int,
foreign key (idOrder) references orders(id)
);
