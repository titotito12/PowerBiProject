

Which German store type had the highest revenue for 2022?
SELECT dim_store.store_type, SUM(orders.product_quantity*dim_product.sale_price) AS revenue

FROM orders
JOIN dim_product on dim_product.product_code = orders.product_code
JOIN dim_store on orders.store_code = dim_store.store_code

WHERE country = 'Germany'
AND
EXTRACT(YEAR FROM orders.order_date::date) = 2022
