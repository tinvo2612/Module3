-- create database QuanLyBanHang;

use QuanLyBanHang;

create table if not exists  Customer(
customerID int ,
customerName varchar(30),
customerAge varchar(20),
primary key (customerID)
);

create table if not exists  Orders(
orderID int ,
customerID int,
oderDate varchar(20),
orderTotalPrice varchar(30),
primary key(orderID)
);

create table if not exists  OrderDetail(
orderID int ,
productID int ,
orderQuantity int ,
primary key(orderID, productID)
);

create table if not exists  Product(
productID int ,
productName varchar(30),
productPrice varchar(30),
primary key(productID)
);

alter table Orders add constraint fk_orders_customers foreign key(customerID) references Customer(customerID);
alter table OrderDetail add constraint fk_OrderDetail_Orders foreign key(orderID) references Orders(orderID);
alter table OrderDetail add constraint fk_OrderDetail_Order foreign key(productID) references Product(productID);