INSERT INTO customers (full_name, email, national_id, status) VALUES
('Alice Smith', 'alice.smith@example.com', '12345678901', 'active'),
('Bob Jones', 'bob.jones@example.com', '23456789012', 'active'),
('Charlie Brown', 'charlie.brown@example.com', '34567890123', 'inactive'),
('Diana Prince', 'diana.prince@example.com', '45678901234', 'active'),
('Edward Elric', 'edward.elric@example.com', '56789012345', 'active');

INSERT INTO categories (category_name, description) VALUES
('Electronics', 'Gadgets, devices, and electronic accessories'),
('Books', 'Physical books, e-books, and audiobooks'),
('Clothing', 'Apparel, footwear, and fashion accessories'),
('Home & Kitchen', 'Furniture, appliances, and home decoration');

INSERT INTO products (category_id, product_name, price, stock_quantity) VALUES
(1, 'Wireless Headphones', 99.99, 50),
(1, 'Mechanical Keyboard', 129.50, 30),
(2, 'Database System Concepts', 75.00, 15),
(3, 'Cotton T-Shirt', 19.90, 100),
(4, 'Coffee Maker', 49.99, 25);

INSERT INTO orders (customer_id, order_date, order_status, total_amount) VALUES
(1, '2026-03-01 10:15:00', 'Delivered', 229.49),
(2, '2026-03-02 14:30:00', 'Shipped', 75.00),
(1, '2026-03-05 09:00:00', 'Processing', 19.90),
(4, '2026-03-06 16:45:00', 'Pending', 149.98);

INSERT INTO order_items (order_id, product_id, quantity, unit_price) VALUES
(1, 1, 1, 99.99),
(1, 2, 1, 129.50),
(2, 3, 1, 75.00),
(3, 4, 1, 19.90),
(4, 1, 1, 99.99),
(4, 5, 1, 49.99);

UPDATE orders
SET order_status = 'Shipped'
WHERE order_id = 3;

UPDATE products
SET price = ROUND(price * 0.90, 2)
WHERE category_id = 1;

UPDATE products
SET stock_quantity = stock_quantity - 1
WHERE product_id IN (1, 2);

DELETE FROM order_items
WHERE order_id = 4 AND product_id = 5;

UPDATE orders
SET total_amount = 99.99
WHERE order_id = 4;

DELETE FROM customers
WHERE status = 'inactive' 
  AND customer_id NOT IN (SELECT DISTINCT customer_id FROM orders);