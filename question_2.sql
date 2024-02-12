question_2.sql
SELECT ROUND(SUM(orders.product_quantity*dim_product.sale_price)::numeric, 1) AS monthly_revenue,
EXTRACT(MONTH FROM orders.order_date::date) AS month
FROM orders
JOIN dim_product on dim_product.product_code = orders.product_code
WHERE EXTRACT(YEAR FROM orders.order_date::date) = 2022
GROUP BY EXTRACT(MONTH FROM orders.order_date::date)
ORDER BY monthly_revenue DESC;