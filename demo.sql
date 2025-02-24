create database if not exists demo;

use demo;

create table Products(
id int auto_increment not null primary key,
productCode varchar (30) not null,
productName varchar (30) not null,
productPrice double not null,
productAmount int,
productDescription text,
productStatus tinyint(1) not null
);

insert into Products (productCode, productName, productPrice, productAmount, productDescription, 
productStatus) values 
('A1', 'Iphone', 2000, 10, 'Luxury', 1),
('A2', 'Samsung', 1500, 8, 'Technology', 1),
('A3', 'Oppo', 1200, 2, 'Droptest',0);
select * from Products;

-- drop index index_productCode on Products;
create unique index index_productCode on Products(productCode);

create index product_name_price on Products(productName, productPrice);

explain select * from Products where productCode = 'A1';


-- create view
create view product_Code as
select productCode, productName, productPrice, productStatus from Products;
-- update view
create or replace view product_Code as
select id, productName, productPrice, productDescription from Products where productName = 'Iphone';
-- delete view
drop view product_Code;

select * from product_Code;


-- create procedure
delimiter //
create procedure allProducts()
begin
select * from Products;

end;
// delimiter ;

call allProducts();

-- add procedure

delimiter //
create procedure addProduct(
	add_productCode varchar (30) ,
	add_productName varchar (30) ,
	add_productPrice double ,
	add_productAmount int,
	add_productDescription text,
	add_productStatus tinyint(1) 
)
begin
insert into Products
(productCode, productName, productPrice, productAmount, productDescription,
productStatus) 
values
(add_productCode, add_productName, add_productPrice, add_productAmount,
 add_productDescription, add_productStatus);
 end //
 delimiter ;

call addProduct('A4', 'Nokia', 500, 3, 'Throw', 1);
select * from Products;

-- update product
delimiter //

create procedure updateProduct(
update_id int ,
update_productCode varchar (30),
update_productName varchar (30),
update_productPrice double,
update_productAmount int,
update_productDescription text,
update_productStatus tinyint(1)
)
begin
update Products
	set 
    productCode = update_productCode,
    productName = update_productName,
    productPrice = update_productPrice,
    productAmount =  update_productAmount,
    productDescription = update_productDescription,
	productStatus = update_productStatus
    where update_id = id ;
    end //
delimiter ;	

call updateProduct(4,'A4', 'Realme', 800, 5, 'call', 0);
select * from Products;

-- delete product by id

delimiter //

create procedure deleteProduct(in delete_id int)
begin 
delete from Products where delete_id = id;
end //

delimiter ;

call deleteProduct(4);
select * from Products;