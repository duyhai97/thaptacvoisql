
create database QLTour;
use QLTour;
create table thanhpho(
                         id_thanhpho int not null primary key auto_increment,
                         ten_thanhpho varchar(100) unique not null
);

create table diemdendulich(
                              id_diemden int not null primary key auto_increment,
                              ten_diemden varchar(100) not null unique ,
                              mota varchar(250),
                              giaTrungbinh int ,
                              thanhppho_ID int not null ,
                              foreign key (thanhppho_ID) references thanhpho(id_thanhpho)
);

create table khachhang(
                          id_khachhang int not null primary key auto_increment,
                          ten_khachhang varchar(25) not null ,
                          sochungminh int,
                          namsinh year,
                          thanhpho_IDKH int ,
                          foreign key (thanhpho_IDKH) references thanhpho (id_thanhpho)
);

create table Loaitour(
                         id_loaitour int not null primary key auto_increment,
                         maloai int ,
                         tenloaitour varchar(100)
);

create table Tour(
                     id_tour int not null primary key auto_increment,
                     matour int not null unique ,
                     loaitour_id int,
                     giadiemdendulich int,
                     ngaybatdau date not null ,
                     ngayketthuc date not null,
                     foreign key (loaitour_id) references Loaitour(id_loaitour)
);


create table hoadondattour(
                              id_hoadon int not null primary key auto_increment,
                              tour_id int,
                              khachhang_id int,
                              trangthai int,
                              constraint fk_11 foreign key (tour_id) references Tour(id_tour),
                              constraint fk_22 foreign key (khachhang_id) references khachhang(id_khachhang)

);

insert thanhpho(ten_thanhpho) values
    ('Thanh Hoa'),
    ('Ha Noi'),
    ('Da Nang'),
    ('Ninh Binh'),
    ('Sai Gon');

insert diemdendulich(ten_diemden, mota, giaTrungbinh, thanhppho_ID) values
    ('Sam Son','Du lich bien',50,1),
    ('Lang Bac','Tham quan lang Bac Ho',30,2),
    ('Nui ngu hanh son','',50,3),
    ('Chua Bai Dinh','',50,4),
    ('Công viên nước Lego water park','',100,5);

insert loaitour(maloai, tenloaitour) VALUES
    (1111,'Du lich'),
    (2222,'Nghi duong');

insert tour( matour, loaitour_id, giadiemdendulich, ngaybatdau, ngayketthuc) values
    (11,1,20,'2020-03-20','2020-03-30'),
    (12,1,20,'2020-04-20','2020-04-30'),
    (13,2,20,'2020-05-20','2020-05-30'),
    (14,2,20,'2020-06-20','2020-06-30'),
    (15,1,20,'2020-03-20','2020-03-30'),
    (16,1,20,'2020-03-20','2020-03-30'),
    (17,2,20,'2020-07-20','2020-07-30'),
    (18,2,20,'2020-08-20','2020-08-30'),
    (19,1,20,'2020-09-20','2020-09-30'),
    (20,1,20,'2020-10-20','2020-10-30'),
    (21,2,20,'2020-04-20','2020-04-30'),
    (22,2,20,'2020-05-20','2020-05-30'),
    (23,1,20,'2020-06-20','2020-06-30'),
    (24,1,20,'2020-07-20','2020-07-30'),
    (25,2,20,'2020-05-20','2020-05-30');

insert khachhang( ten_khachhang, sochungminh, namsinh, thanhpho_IDKH) VALUES
    ('Nguyen Van A',174663909,'1995',1),
    ('Nguyen Van B',174663908,'1996',2),
    ('Nguyen Van C',174663907,'1997',3),
    ('Nguyen Van D',174663906,'1995',4),
    ('Nguyen Van E',174663905,'1996',5),
    ('Nguyen Van F',174663904,'1997',1),
    ('Nguyen Van G',174663903,'1995',2),
    ('Nguyen Van H',174663902,'1996',3),
    ('Nguyen Van I',174663901,'1997',4),
    ('Nguyen Van K',174663900,'1995',5);

insert into hoadondattour(tour_id, khachhang_id, trangthai) VALUES
(17,1,1),
(16,2,0),
(17,3,1),
(18,4,1),
(19,5,0),
(20,6,0),
(21,7,1),
(22,8,1),
(23,9,0),
(24,10,1);

select ten_thanhpho , ten_diemden from diemdendulich
                                           join thanhpho t on t.id_thanhpho = diemdendulich.thanhppho_ID;

# tinh so tour cua cacc thanh pho
select ten_thanhpho, count(tour_id) from hoadondattour
                                             join khachhang k on k.id_khachhang = hoadondattour.khachhang_id
                                             join thanhpho t on t.id_thanhpho = k.thanhpho_IDKH
group by ten_thanhpho;

# tinh so tuor co ngay bat dau trong thang 3
select count(month(ngaybatdau)) from Tour
where month(ngaybatdau) = 3;

# tinh so tour co ngay ket thuc trong thang 4
select count(month(ngayketthuc)) from tour
where month(ngayketthuc) = 4;

















































