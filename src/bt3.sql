create database QLBH;
use QLBH;
create table Customer(
                         customerID int not null primary key auto_increment,
                         customerName varchar(30) not null ,
                         customerAge tinyint
);

create table Oder(
                     oderID int not null primary key auto_increment,
                     customerID_ngoai int not null ,
                     oderDate date ,
                     oderTotalPrice int ,
                     foreign key (customerID_ngoai) references Customer(customerID)
);

create table Product(
                        productID int not null primary key auto_increment,
                        productName varchar(50) unique not null ,
                        productPrice int
);

create table OderDetail(
                           oderID_ngoai int not null ,
                           productID_ngoai int not null ,
                           oderQuantity int not null,
                           foreign key (oderID_ngoai) references Oder(oderID),
                           foreign key (productID_ngoai) references Product(productID)

);

insert customer( customerName, customerAge) VALUES
    ('Minh Quan',10),
    ('Ngoc Ha ',20),
    ('Hong Oanh',50),
    ('Bao Thanh',30),
    ('Ha Thanh',30);

insert oder(customerID_ngoai, oderDate, oderTotalPrice) values
    (1,03/21/2016,null),
    (2,03/22/2016,null),
    (3,03/23/2016,null),
    (4,03/24/2016,null),
    (5,03/25/2016,null);

insert product(productName, productPrice) VALUES
    ('Máy giặt', 3),
    ('Tủ lạnh', 5),
    ('Điều hòa', 7),
    ('Quạt', 1),
    ('Bếp điện', 2);

insert OderDetail(oderID_ngoai, productID_ngoai,oderQuantity) VALUES
    (1,1,3),
    (1,3,4),
    (1,4,3),
    (2,1,5),
    (3,1,3),
    (2,5,6),
    (2,3,3);

select oderID, oderDate,oderTotalPrice from oder;

select customerName, productName from oderdetail
                                          join Oder O on O.oderID = OderDetail.oderID_ngoai
                                          join Customer C on C.customerID = O.customerID_ngoai
                                          join Product P on P.productID = OderDetail.productID_ngoai;
