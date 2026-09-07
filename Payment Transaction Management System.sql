CREATE DATABASE PaymentTransactionDB;
USE PaymentTransactionDB;
CREATE TABLE Customer (
    customer_id INT PRIMARY KEY,
    customer_name VARCHAR(100),
    email VARCHAR(100),
    phone VARCHAR(15)
);
CREATE TABLE Payment (
    payment_id INT PRIMARY KEY,
    customer_id INT,
    payment_mode VARCHAR(30),
    payment_date DATE,
    amount DECIMAL(10,2),
    payment_status VARCHAR(20),

    FOREIGN KEY (customer_id)
    REFERENCES Customer(customer_id)
);
INSERT INTO Customer VALUES
(1, 'Yuvasri', 'yuvasri@gmail.com', '9876543210'),
(2, 'Anitha', 'anitha@gmail.com', '9876543211'),
(3, 'Priya', 'priya@gmail.com', '9876543212'),
(4, 'Kaviya', 'kaviya@gmail.com', '9876543213');
INSERT INTO Payment VALUES
(101, 1, 'UPI', '2026-09-01', 1500.00, 'Success'),
(102, 2, 'Credit Card', '2026-09-02', 2500.00, 'Success'),
(103, 3, 'Debit Card', '2026-09-03', 1200.00, 'Failed'),
(104, 1, 'UPI', '2026-09-04', 800.00, 'Success'),
(105, 4, 'Net Banking', '2026-09-05', 3000.00, 'Failed'),
(106, 2, 'UPI', '2026-09-06', 1800.00, 'Success');
SELECT * FROM Customer;
SELECT * FROM Payment;
SELECT *
FROM Payment
WHERE payment_status = 'Success';
SELECT *
FROM Payment
WHERE payment_status = 'Failed';
SELECT payment_mode, COUNT(*) AS total_transactions
FROM Payment
GROUP BY payment_mode;
SELECT
    p.payment_id,
    c.customer_name,
    p.payment_mode,
    p.payment_date,
    p.amount,
    p.payment_status
FROM Payment p
JOIN Customer c
ON p.customer_id = c.customer_id;

