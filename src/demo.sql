create database QLSV;
use QLSV;


create table address(
                        id int not null primary key auto_increment,
                        address varchar(250) not null
);

create table classes (
                         id_class int not null primary key ,
                         name_class varchar(100) not null ,
                         language varchar(100) not null,
                         description varchar(100)
);

create table student (
                         id_student int not null primary key auto_increment,
                         fullName varchar(100) not null ,
                         phone varchar(10) unique,
                         address_id int ,
                         class_id int,
                         foreign key (address_id) references address(id),
                         foreign key (class_id) references classes(id_class)
);

create table course(
                       course_id int not null primary key ,
                       course_name varchar(100) ,
                       course_description varchar(100)
);

create table point(
                      point_id int not null primary key auto_increment,
                      id_course int not null ,
                      id_student int not null ,
                      points int not null ,
                      foreign key (id_course) references course(course_id),
                      foreign key (id_student) references student(id_student)
);

insert into address(address) VALUES
('Hà Nội'), ('Thanh Hóa'),('Ninh Bình'),('Nghệ An'),('Hà Nam');

insert into classes(id_class, name_class, language, description) values
(1,'C0221i1','Java',''),
(2,'C0221i2','PHP',''),
(3,'C0221i3','C#',''),
(4,'C0221i4','JavaScript',''),
(5,'C0221i5','C+','');

insert into student( fullName, phone, address_id, class_id) VALUES
('Nguyễn Văn A' ,'0123450',1,1),
('Nguyễn Văn B' ,'0123451',1,1),
('Nguyễn Văn C' ,'0123452',1,1),
('Nguyễn Văn D' ,'0123453',2,2),
('Nguyễn Văn E' ,'0123454',2,2),
('Nguyễn Văn F' ,'0123455',2,2),
('Nguyễn Văn G' ,'0123456',2,2),
('Nguyễn Văn H' ,'0123457',3,3),
('Nguyễn Văn I' ,'0123458',3,3),
('Nguyễn Văn K' ,'0123459',3,3);

insert into course(course_id, course_name, course_description) VALUES
(1,'Bootcamp Preparation 2.0',''),
(2,'Advanced Programming with Java 2.0',''),
(3,'Java Web Back-end Development 2.0',''),
(4,'Web Front-end Development Angular 2.1',''),
(5,'Professional Java Project with Scrum 2.0','');

insert into point(id_course, id_student, points) values
(1,1,98),
(2,1,92),
(1,2,97),
(2,2,98),
(1,3,95),
(2,3,96),
(1,4,94),
(2,4,95),
(1,5,93),
(2,5,99);

select fullName,address,name_class,course_name,points from address,student,course,classes,point
where point.id_student = student.id_student
  and point.id_course = course.course_id
  and student.class_id = classes.id_class
  and student.address_id = address.id;

select count(*) from student;

select avg(points) from point;

select count(*) from student
where address_id = 2;




















