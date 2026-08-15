CREATE DATABASE OrderDB;
USE OrderDB;

CREATE TABLE Orders (
    order_id INT PRIMARY KEY,
    customer_name VARCHAR(50),
    order_date DATE,
    total_amount INT
);

CREATE TABLE Order_Details (
    detail_id INT PRIMARY KEY,
    order_id INT,
    product_name VARCHAR(50),
    quantity INT
);

INSERT INTO Orders VALUES
(1, 'Yuvasri', '2026-08-14', 5000),
(2, 'Priya', '2026-08-14', 3000);

INSERT INTO Order_Details VALUES
(101, 1, 'Laptop', 1),
(102, 1, 'Mouse', 2),
(103, 2, 'Keyboard', 1);

-- Display Orders
SELECT * FROM Orders;

-- Display Order Details
SELECT * FROM Order_Details;

-- Update Order
UPDATE Orders
SET total_amount = 5500
WHERE order_id = 1;

-- Customer Order History
SELECT * FROM Orders
WHERE customer_name = 'Yuvasri';