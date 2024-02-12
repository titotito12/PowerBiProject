

Which product category generated the most profit for the "Wiltshire, UK" region in 2021?
WITH cte AS (SELECT dim_product.sale_price,
            dim_product.cost_price,
            dim_product.category,
            dim_store.country_region,
            orders.product_quantity
 
 FROM orders
JOIN dim_product on dim_product.product_code = orders.product_code
JOIN dim_store on orders.store_code = dim_store.store_code

WHERE dim_product.cost_price IS NOT NULL AND dim_store.country_region LIKE 'Wiltshire')
SELECT category,
       SUM((sale_price - cte.cost_price) * product_quantity) AS profit
FROM cte
GROUP BY category
ORDER BY profit DESC;