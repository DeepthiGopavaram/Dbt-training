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
{{ markup() }} as markup
from {{ ref('raw_orders') }} as o
left join {{ref("raw_customres")}} as c
on o.customerid=c.customerid
left join {{ref("raw_products")}} as p
on o.productid=p.productid