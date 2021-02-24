create database food

create table orders
(id int primary key,
brand varchar(50),
order_date date,
amount int,
store_id int foreign key references stores(store_id),
customer_id int foreign key references customers(customer_id),
product_id int foreign key references products(product_id))


select * from orders

create table Stores
(
store_id int primary key,
Store varchar(50),
City varchar(50)
)


create table Customers 
(
customer_id int primary key,
Name varchar(50),
Number int
)

select * from Customers

create table Products
(
product_id int primary key,
Name varchar(50),
Is_Veg varchar(50)
)


create table Order_lines
(
id int primary key,
order_id int ,
product_id int,
amount int
)

select * from Order_lines


Insert into Orders values(124251,'Ovenstory','03/02/2020',300,7,45,1)
insert into Orders values(423452,'Faasos','03/07/2020',250,10,53,2)

insert into stores values(7,'CST','Mumbai')
insert into stores values(10,'Kormangala','Bangalore')

insert into Customers values(45,'Mufaddal',9825)
insert into Customers values(53,'Rohan',9826)



insert into Products values(1,'Farmhouse Pizza','Veg')
insert into Products values(2,'Chicken Pizza','Non-veg')
insert into Products values(3,'Veg Wrap','Veg')


insert into Order_lines values(1,124251,1,100)
insert into Order_lines values(2,124251,2,200)


select * from orders

--Question 1

select brand,datename(month,order_date)+'-' +datename(yyyy,order_date), ol.amount as sales, count(o.id) as orders,
p.Is_Veg as menu from orders o
join Stores s
on o.store_id = s.store_id
join Products p
on o.product_id = p.product_id
join Order_lines ol
on p.product_id = ol.product_id
where Is_Veg='non-veg'
 group by o.brand,o.order_date,o.product_id,ol.amount,p.Is_Veg

select * from Products