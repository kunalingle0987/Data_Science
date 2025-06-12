 -- create a Sales Analysis Dashboard using MySQL + Excel/Tableau/Power BI, from setting up your data to building the dashboard with your three key KPIs:

create database dashboard;
 use dashboard;
 
 create table products(
 product_id int primary key,product_name varchar(100),category varchar(100),price decimal(10,2)
 );
 create table costumers(
 costumer_id int primary key,name varchar(100),email varchar(100),region varchar(100),signup_date date
 );
 create table invoice(
 invoice_id int primary key,costumer_id int,invoice_date date,total_amount decimal(10,2),
 foreign key(costumer_id)references costumers(costumer_id)
 );
 create table invoice_item(
 item_id int primary key,invoice_id int,product_id int,quantity int,item_total decimal(10,2),
 foreign key(invoice_id)references invoice(invoice_id),
 foreign key(product_id) references products(product_id)
 );
 -- select*from invoice_item;

-- Top selling products in Month&year
 select 
 p.product_name,
 month(i.invoice_date) as Month,
 year(i.invoice_date) as Year,
 sum(ii.quantity) as Total_Quantity_Sold from invoice_item ii
 join products p on ii.product_id=p.product_id
 join invoice i on ii.invoice_id=i.invoice_id
 group by p.product_name,year(i.invoice_date),month(i.invoice_date)
 order by year,month,total_quantity_sold desc;
 
 -- Reapeter or New customers
 with First_Purchase as(select costumer_id,min(invoice_date) 
 as First_Purchase_Date from invoice group by costumer_id)
 select
 i.invoice_date,
 count(distinct case when i.invoice_date=f.First_Purchase_Date then i.costumer_id end) as new_costumers,
 count(distinct case when i.invoice_date>f.first_purchase_date then i.costumer_id end)as repeater_costumers
 from invoice i
 join First_Purchase f on i.costumer_id=f.costumer_id
 group by i.invoice_date
 order by i.invoice_date;
 
 -- avg order Value by Region
 
 select c.region,
 avg(i.total_amount) as avg_order_value from invoice i
 join costumers c on i.costumer_id=c.costumer_id
 group by c.region;
 
 
 