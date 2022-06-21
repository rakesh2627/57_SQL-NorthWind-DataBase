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
 od.order_id
 from 
 oder_details od
 inner join 
 orders o on od.order_id = o.order_id
 where od.ouantity >= 60
 group by
 od.order_id, od.ouantity
 having count(od.ouantity) > 1
 order by od.order_id;
 
 
 select
 od.order_id
 from 
 oder_details od
 inner join 
 orders o on od.order_id = o.order_id
 where od.ouantity >= 60
 group by
 od.order_id, od.ouantity
 having count(od.ouantity) > 1
 order by od.order_id
 SELECT
  od.orderid,
  od.productid,
  od.unitprice,
  od.quantity,
  od.discount
FROM
  order_details od
WHERE
  od.orderid in (SELECT orderid FROM repeated_quantities);
  
  select 
  order_id,
  order_date,
  required_date,
  shipped_date
  from orders
  where
  required_date < = shipped_date; 
  
  
  
  SELECT
  o.employee_id,
  e.last_name,
  count(o.employee_id) as total_late_orders
FROM
  orders o
INNER JOIN
  employees e on o.employee_id = e.employee_id
WHERE
  o.required_date <= o.shipped_date
GROUP BY
  o.employee_id, e.last_name
ORDER BY
  total_late_orders DESC;


 SELECT
    o.employee_id,
    count(o.employee_id) as total
  FROM
    orders o
  WHERE
    o.required_date <= o.shipped_date
  GROUP BY
    ('o.employee_id')
    , orders_summary as  (
   SELECT
    o.employee_id,
    count(o.employee_id) as total
  FROM
    orders o
  GROUP BY
    o.employee_id
)
SELECT
  os.employee_id,
  e.last_name,
  os.total,
  lo.total as late_orders
FROM
  orders_summary os
INNER JOIN
  employees e on os.employee_id = e.employee_id
INNER JOIN
  late_orders lo on os.employee_id = lo.employee_id
ORDER BY
  os.total DESC;
