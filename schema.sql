--Create main_statement table--
create table main_statement(
name varchar(255),
price decimal,
date date,
payment_type varchar(255),
    dept varchar(255)
);

drop table main_statement;
drop table invoices;

--Create invoices table--
create table invoices(
name varchar(255),
invoice_num varchar(255),
price decimal,
	PRIMARY KEY (invoice_num)
);

--Import main_statement.csv to main_statement--
copy main_statement(name, price, date, payment_type, dept)
from 'C:\data\main_statement.csv'
DELIMITER ','
CSV HEADER;

--Import invoices.csv to invoices--
copy invoices(name, invoice_num, price)
from 'C:\data\invoices.csv'
DELIMITER ','
CSV HEADER;

--To see each tables-- 
select * from main_statement;
select * from invoices;

--Check the total amount paid/received, group by vender--
select name, sum(price)
from main_statement
group by name;

--Check the amount paid/received in date range, group by vender--
select name, count(name)
from main_statement
where date between '5/1/2022' and '5/10/2022'
group by name;


--Merge two tables to see invoice number together--
select main_statement.name, invoices.invoice_num, main_statement.price,
main_statement.date
from main_statement
join invoices ON main_statement.name = invoices.name;
