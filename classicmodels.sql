delimiter //
-- drop procedure if exists allCustomer; //
create procedure allCustomer()
begin
select * from customers; -- where customerNumber = 175;
end //

call allCustomer();



delimiter // 
create procedure getNumber( in cusID int(50))
begin
select * from customers where customerNumber = cusID;
end //
delimiter ;

call getNumber(177);

delimiter //

create procedure getCustomersCountByCity
(in tinvo varchar(50), out hihi int)
begin 
	select count(customerNumber)
    into hihi
    from customers
    where city = tinvo;
end //
delimiter ;

CALL GetCustomersCountByCity('Lyon',@hihi);

select @hihi;




delimiter //

create procedure setCounter(
inout counter int,
in inc int
)
begin

set counter = counter + inc;


end //

delimiter ;

set @counter = 1;

call setCounter (@counter, 1);

select @counter;

call setCounter (@counter, 2);

select @counter;

call setCounter (@counter, 4);

select @counter;

call setCounter (@counter, 5);

select @counter;