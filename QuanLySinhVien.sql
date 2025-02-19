-- create database QuanLySinhVien;

use QuanLySinhVien;

create table if not exists Class(
ClassID	 int AUTO_INCREMENT not null,
ClassName varchar(60) not null,
StartDate DateTime not null,
Status bit,

primary key (ClassID)
);

insert into Class values (1, 'A1', '2008-12-20', 1);
insert into Class values (2, 'A2', '2008-12-22', 1);
insert into Class values (3, 'B3', current_date(), 0);





create table if not exists Student(
StudentId int not null auto_increment,
StudentName varchar(30) not null,
Address varchar(50),
Phone varchar(20),	
Status bit,
ClassID int  not null,

primary key (StudentID)
);

alter table Student add constraint Fk_Student_Class foreign key (ClassID) references Class(ClassID);


insert into Student (StudentName, Address, Phone, Status, ClassID) values  ('Hung', 'Ha Noi', '0912113113', 1, 1);
insert into Student (StudentName, Address, Status, ClassID) values ('Hoa', 'Hai Phong', 1, 1);
insert into Student (StudentName, Address, Phone, Status, ClassID) values ('Manh', 'HCM', '0123123123', 0, 2);




create table if not exists Subject(
SubID int not null auto_increment,
SubName varchar(30) not null,
Credit Tinyint not null default 1 check (Credit >= 1),
Status bit default 1,

primary key (SubID)
);

insert into Subject values (1, 'CF', 5, 1),
(2, 'C', 6, 1),
(3, 'HDJ', 5, 1),
(4, 'RDBMS', 10, 1);

create table if not exists Mark(
MarkID int not null auto_increment,
SubID int not null ,
StudentID int not null ,
Mark float default 0 check(Mark between 0 and 100),
ExamTimes Tinyint default 1,
unique(SubID, StudentID),

primary key (MarkID)
);

alter table Mark add constraint Fk_Mark_Subject_SubID foreign key (SubID) references Subject(SubID);
alter table Mark add constraint Fk_Mark_Student_StudentID foreign key (StudentID) references Student(StudentID);

insert into Mark(SubID, StudentID, Mark, ExamTimes) values (1, 1, 8, 1), (1, 2, 10, 2), (2, 1, 12, 1);

select * from Student;

select * from Student where Status = true ;

select * from Subject where Credit < 10;

select B.StudentID, B.StudentName, A.ClassName from Student B 
join Class A on B.ClassID = A.ClassID where A.ClassName = 'A1';

select A.StudentID, A.StudentName, B.SubName, C.Mark from Student A
join Mark C on A.StudentID = C.StudentID
join Subject B on B.SubID = C.SubID 
where B.SubName = 'CF';
