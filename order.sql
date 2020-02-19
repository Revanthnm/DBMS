create table customer(
    cust_no int,cname varchar2(25),city varchar2(20),
    primary key(cust_no)
    );
    
create table orders(order_no int,odate date,cust_no int,order_amt int,
    primary key(order_no),
    foreign key(cust_no)REFERENCES customer(cust_no)
    );  
    
create table item(item_no int,unit_price int,
    primary key(item_no)
    );
    
create table order_item(
   order_no int,item_no int,qnt int,
   foreign key(order_no)REFERENCES orders(order_no),
   foreign key (item_no)REFERENCES item(item_no)
   );

create table warehouse(
    warehouse_no int,city varchar2(20),
    primary key (warehouse_no)
    );
    
create table SHIPMENT(Order_no int,Warehouse_no int,oDate date,
    foreign key(order_no) REFERENCES orders(order_no),
    foreign key(warehouse_no) REFERENCES warehouse(warehouse_no)
    );
    
insert into customer VALUES(&cust_no,'&cname','&city');
insert into orders VALUES(&order_no,'&odate',&cust_no,&order_amt);
insert into item VALUES(&item_no,&unit_price);
insert into order_item VALUES(&order_no,&item_no,&qnt);
insert into warehouse VALUES(&warehouse_no,'&city');
insert into SHIPMENT VALUES(&Order_no,&Warehouse_no,'&oDate');

select * from customer;
select * from orders;
select * from item;
select * from order_item;
select * from warehouse;
select * from SHIPMENT;

select cu.cname from CUSTOMER cu,orders o where o.cust_no = cu.CUST_NO;
