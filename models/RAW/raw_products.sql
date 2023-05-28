{{
    config(
        materialized='table'
    )
}}

SELECT * FROM {{ source('globalmart', 'Product') }}