-- Query -> Faturamento total por cliente (Apenas clientes que compraram)
SELECT
c.customer_id,
c.full_name,
c.email,
COUNT(o.order_id) AS total_orders,
COALESCE(SUM(o.total_amount), 0.00) AS total_spent
FROM customers c
INNER JOIN orders o ON c.customer_id = o.customer_id
GROUP BY c.customer_id, c.full_name, c.email
ORDER BY total_spent DESC;

-- Query -> Produtos mais vendidos por quantidade e receita gerada
SELECT
p.product_id,
p.product_name,
cat.category_name,
SUM(oi.quantity) AS total_units_sold,
SUM(oi.quantity * oi.unit_price) AS total_revenue
FROM products p
INNER JOIN categories cat ON p.category_id = cat.category_id
INNER JOIN order_items oi ON p.product_id = oi.product_id
GROUP BY p.product_id, p.product_name, cat.category_name
HAVING SUM(oi.quantity) >= 1
ORDER BY total_revenue DESC;

-- Query -> Pedidos pendentes ou em processamento com os dados do cliente
SELECT
o.order_id,
c.full_name AS customer_name,
c.email,
o.order_date,
o.order_status,
o.total_amount
FROM orders o
INNER JOIN customers c ON o.customer_id = c.customer_id
WHERE o.order_status IN ('Pending', 'Processing')
ORDER BY o.order_date ASC;