SELECT 
o.orderid,
o.orderdate,
o.shipdate,
o.shipmode,
o.ordersellingprice-o.ordercostprice as orderprofit,
o.ordercostprice,
o.ordersellingprice,
C.customerid,
c.customername,
c.segment,
c.country,
p.category,
p.productid,
p.productname,
p.subcategory,
{{ markup() }} as markup,
d.Delivery_team
from {{ ref('raw_orders') }} as o
left join {{ref("raw_customres")}} as c
on o.customerid=c.customerid
left join {{ref("raw_products")}} as p
on o.productid=p.productid
left join {{ ref('Delivery_team') }} as d
on o.shipmode=d.shipmode