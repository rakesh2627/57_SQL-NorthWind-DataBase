SELECT * FROM northwind_db.products;



select 
product_id,
product_name,
units_in_stock,
reorder_level
from products
where units_in_stock < reorder_level
order by product_id;

select
product_id,
product_name,
units_in_stock,
units_on_order,
reorder_level
from products
where (units_in_stock + units_on_order) <= reorder_level
and discontinued = 0
order by product_id;

select
c.customer_id,
c.company_name,
c.region
from customers c
order by c.region,c.customer_id;

select 
ship_country,
avg(freight) as mean_freight
from orders
group by ship_country
order by mean_freight DESC
limit 3 ;

select 
ship_country,
avg(freight) as mean_freight
from orders
where order_date('year', 'order_date') = 2015
group by ship_country
order by mean_freight DESC
limit 3 ;

select 
ship_country,
avg(freight) as mean_freight
from orders
where Order_Date between '1997-01-01' and '1998-01-01'
group by ship_country
order by mean_freight DESC
limit 3 ;


select 
ship_country,
avg(freight) as mean_freight
from orders
where order_date >= (select max(order_date) - interval '12 month' from orders)
group by ship_country
order by mean_freight DESC
limit 3 ;

select 
	o.employee_id,
    e.last_name,
    o.order_id,
    p.product_name,
    od.quantity
from orders o
inner join 
employees e on o.employee_id = e.employee_id
inner join
order_details od on od.order_id = o.order_id
inner join
products p on p.product_id = od.product_id
order by order_id,od.product_id;

select 
c.customer_id,
c.company_name
from customers c
left join 
orders o on c.customer_id =o.customer_id
where o.order_id is null; 



select
  c.customerid,
  c.companyname,
  o.orderid,
  round(sum(od.unitprice * od.quantity)::numeric, 2) as total_amount
from
  customers c
inner join
  orders o on c.customerid = o.customerid
inner join
  order_details od on o.orderid = od.orderid
where
  date_part('year', o.orderdate) = 1998
group by
  c.customerid, c.companyname, o.orderid
having
  sum(od.unitprice * od.quantity) >= 10000
Oorder by
  total_amount DESC;
  
  select
  c.customerid,
  c.companyname,
  o.orderid,
  round(sum(od.unitprice * od.quantity)::numeric, 2) as total_amount
from
  customers c
inner join
  orders o on c.customerid = o.customerid
inner join
  order_details od on o.orderid = od.orderid
where
  date_part('year', o.orderdate) = 1998
group by
  c.customerid, c.companyname, o.orderid
having
  sum(od.unitprice * od.quantity) >= 15000
Oorder by
  total_amount DESC;
  
  
  SELECT
  c.customer_id,
  c.company_name,
  round(sum(
            (od.unit_price * od.quantity) * (1 - od.discount)
  )::numeric, 2) as total_amount
FROM
  customers c
INNER JOIN
  orders o on c.customer_id = o.customer_id
INNER JOIN
  order_details od on o.order_id = od.order_id
WHERE
  date_part('year', o.order_date) = 1998
GROUP BY
  c.customer_id, c.company_name
HAVING
  sum(od.unit_price * od.quantity * (1 - od.discount)) >= 10000
ORDER BY
  total_amount DESC;
  
  
  SELECT
  employee_id,
  order_id,
  order_date
FROM
  orders
WHERE
order_date = ((date_trunc('MONTH', order_date) + INTERVAL '1 MONTH - 1 day') ::order_date)
ORDER BY
  employee_id, order_date;
  

select
  order_id
from
  orders
  TABLESAMPLE barnoulli  (2);
 
 
 select
 from 
 oders
 inner join 
 orders o on od.order_id = o.order_id
 where od.ouantity >= 60
 group by
 od.order_id, od.ouantity
 having count(od.ouantity) > 1
 order by od.order_id;
 

