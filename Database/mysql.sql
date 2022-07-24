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
    phone varchar(12) not null,
    password VARCHAR(50) not null,
    idRestaurant varchar(100)
);

create table address(
	id int primary key auto_increment,
    name varchar(255) not null,
    idUser int,
    foreign key (idUser) references users(id)
);

create table role_user(
	idRole int,
    idUser int,
    primary key(idRole, idUser),
    foreign key (idRole) references role(id),
    foreign key (idUser) references users(id)
);


create table category(
	id int primary key auto_increment,
    name varchar(50) not null,
    type varchar(30) not null
);

create table restaurant(
	id int primary key auto_increment,
    name varchar(100),
    operatingtime varchar(100),
    address varchar(255),
    idUser int,
    idCategory int,
    foreign key (idCategory) references category(id),
    foreign key (idUser) references users(id)
);

create table tag(
	id int primary key auto_increment,
    name varchar(50) not null,
    slug varchar(50) not null,
    innings int default 0,
    view int default 0
);

create table discount(
	id varchar(100) primary key,
	value float not null
);

create table product(
	id int auto_increment primary key,
    name varchar(100) not null,
    idCategory int,
    iddiscount varchar(100),
    idtag int,
    image varchar(50) not null,
    price varchar(50) not null,
    promotionalprice varchar(50) not null,
    serviceprice varchar(50) default 0,
    servicenote varchar(255) not null,
    preparationtime varchar(50) not null,
    usagesdiscount int default 0,
    view int default 0,
    amount int,
    creationdate date, 
    editdateend date,
    foreign key (idCategory) references category(id),
    foreign key (iddiscount) references discount(id),
    foreign key (idtag) references tag(id)
);

create table cart(
	id int auto_increment primary key,
    iduser int,
	total int default 0,
    createDay datetime,
    foreign key (iduser) references users(id)
);

create table cartdetails(
	id int auto_increment primary key,
    idproduct int,
    idcart int,
    amount int,
    price int,
    foreign key (idproduct) references product(id),
    foreign key (idcart) references cart(id)
);