SELECT 
    customerid,
    segment,
    country,
SUM(orderprofit) AS Profit
FROM {{ ref('stg_orders') }}
GROUP by
    customerid,
    segment,
    country