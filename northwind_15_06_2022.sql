SELECT * FROM northwind_db.shippers;

select *
from shippers;

select 
category_name,
description
from categories;


SELECT
  first_name,
  last_name,
  hire_date
FROM employees
WHERE
  title = Sales Representative  country = USA;
  -- Error Code: 1054. Unknown column 'firstname' in 'field list'
  
SELECT
  order_id,
  order_date
FROM orders
where employee_id= 5;


select
supplier_id,
contact_name,
contact_title
from suppliers
where contact_title	!= 'Marketing Manager';

select
product_id,
product_name
from products
where product_name like '%queso%';

select
order_id,
customer_id,
ship_country
from orders
where ship_country = 'France' or 'Belgium';

SELECT
  order_id,
  customer_id,
  ship_country
FROM
  orders
WHERE
  ship_country in ('Brazil', 'Mexico', 'Argentina', 'Venezuela');

select
first_name,
last_name,
title,
birth_date 
from employees
order by birth_date desc;

SELECT
  first_name,
  last_name,
  title,
  birth_date
FROM employees;

select
  p.product_id,
  p.product_name,
  s.company_name
from
  products p
inner join suppliers s ON p.supplier_id = s.supplier_id;

select
o.order_id,
o.order_date,
s.company_name
from orders o
inner join shippers s on o.shipvia = shippers_id;

SELECT
  c.category_name,
  count(p.product_id) as nb_products
FROM categories c
INNER JOIN products p on c.category_id = p.category_id
GROUP BY c.category_name
ORDER BY nb_products DESC;











