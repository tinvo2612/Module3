create database company;

use company;

create table employees(
id int auto_increment primary key,
name varchar (50) not null,
department varchar (50) not null,
salary decimal (10, 2) not null
);

insert into employees (id, name, department, salary) values 
( 1, 'Tín','C10 ' , 50000),
( 2, 'Việt', 'C10', 30000),
( 3, 'Võ', 'C20', 70000);

select * from employees; 



delimiter //
create trigger update_department before insert on employees 
for each row
begin
	if new.salary > 50000 then set new.department = 'Management';
	elseif new.salary = 50000 then set new.department = 'Sales';
	else set new.department = 'support';
    end if;

end //

delimiter ;


SHOW TRIGGERS;
