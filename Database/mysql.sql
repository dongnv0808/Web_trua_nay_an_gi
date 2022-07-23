create database db;
use db;
drop database db;

create TABLE role (
    id INT PRIMARY KEY,
    name VARCHAR(10)
);

create table users(
    id int AUTO_INCREMENT PRIMARY KEY,
    name VARCHAR(50) not null,
    email VARCHAR(50) not null,
    password VARCHAR(50) not null,
    idAddress int,
    nameRestaurant varchar(100),
    foreign key (idAddress) references address(id)
);

create table roleid(
	idRole int,
    idUser int,
    primary key(idRole, idUser),
    foreign key (idRole) references role(id),
    foreign key (idUser) references users(id)
);

create table address(
	id int primary key auto_increment,
    name varchar(255) not null
);

create table category(
	id int primary key auto_increment,
    name varchar(50)
);

create table tag(
	id int primary key auto_increment,
    name varchar(50) not null
);

create table discount(
	id int primary key auto_increment,
    name varchar(50) not null,
	value float not null
);

create table menu(
	id int primary key auto_increment,
    name varchar(50) not null
);

create table restaurant(
	id int primary key auto_increment,
    name varchar(100),
    operatingtime varchar(100),
    address varchar(255)
);

create table menu(
	id int primary key auto_increment,
    name varchar(50)
);

create food