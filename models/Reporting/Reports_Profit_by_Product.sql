SELECT 
    productid,
    productname,
    category,
    subcategory,
    SUM(orderprofit) as Profit
from {{ ref('stg_orders') }}
group by
    productid,
    productname,
    category,
    subcategory