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
    name varchar(50) not null
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

insert into tag(name) values  ('All'),
							  ('Đồ ăn'),	
							  ('Đồ uống'),
                              ('Đồ chay'),
                              ('Bánh kem'),
                              ('Tráng miệng'),
                              ('Piza/Burger'),
                              ('Món gà'),
                              ('Món lẩu'),
                              ('Mì phở'),
                              ('Cơm hộp'),
                              ('Sushi');
					
insert into category(name,type) values  ('Cơm', 'product'),
										('Bún/Phở', 'product'),
										('Đồ uống', 'product'),
										('Đồ ăn nhanh', 'product'),
										('Ăn vặt', 'product'),
                                        ('Lẩu nướng', 'product'),
										('Đặc sản', 'product'),
										('Healthy', 'product');
                                        
-- insert into discount(id,value) values   ('giảm 20k cho đơn 50k', '20000'),
-- 										('giảm 30k cho đơn 70k', '30000'),
-- 										('Giảm 50k cho đơn 120k', '50000'),
-- 										('Giảm 70k cho đơn 200k', '70000'),
-- 										('Giảm 100k cho đơn 300k', '100000');
                                        
insert into product(name, idCategory, idtag, image, price, promotionalprice, serviceprice, servicenote, preparationtime, creationdate, editdateend ) values  ('Cơm Sườn', 1,2,'11.png','40000','4000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
																																															('Cơm Gà', 1,8,'12.jpg','40000','4000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Cơm Bò', 1,2,'13.jpg','50000','5000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
																																															('Bún Bò', 2,10,'21.jpg','60000','6000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Bún Hến', 2,10,'22.jpg','30000','3000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Phở bò', 2,10,'23.jpg','45000','4500','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
																																															('Trà sữa', 3,3,'31.jpg','35000','3500','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Trà chanh', 3,3,'32.jpg','15000','1500','2000','Thơm ngon','5 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Nước sinh tố', 3,3,'33.jpg','25000','2500','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
																																															('Bánh mì', 4,2,'41.png','25000','2500','2000','Thơm ngon','5 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Gà rán', 4,8,'42.jpg','50000','5000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Hambuger', 4,7,'43.jpg','60000','6000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
																																															('Mì lắc', 5,10,'51.jpg','35000','3500','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Bánh tráng trộn', 5, 2,'52.jpg','15000','1500','2000','Thơm ngon','5 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Phô mai que', 5,2,'53.jpg','10000','1000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
																																															('Lẩu thái', 6,9,'61.jpg','250000','25000','5000','Thơm ngon','15 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Lẩu hải sản', 6,9,'62.jpg','350000','35000','5000','Thơm ngon','15 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Lẩu Tokbokki', 6, 9,'63.jpg','200000','20000','5000','Thơm ngon','15 phút','2022-07-25','22-07-25'),
																																															('NEM 36 - Đặc Sản Thanh Hóa', 7,2,'71.jpg','120000','12000','2000','Thơm ngon','5 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Trâu gác bếp Tây Bắc', 7,2,'72.jpg','400000','40000','2000','Thơm ngon','5 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            (' Đặc Sản Nem Bùi Bắc Ninh', 7,2,'73.jpg','80000','8000','2000','Thơm ngon','5 phút','2022-07-25','22-07-25'),
																																															('Gateau Healthy', 8, 4,'81.jpg','40000','4000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Salad - Healthy', 8,4,'82.jpg','30000','3000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25'),
                                                                                                                                                                                            ('Bột - Healthy Food ', 8,4,'83.jpg','40000','4000','2000','Thơm ngon','10 phút','2022-07-25','22-07-25');


                                        

                                        
