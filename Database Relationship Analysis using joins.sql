CREATE DATABASE ShopDB;
USE ShopDB;
CREATE TABLE Customer (
    Customer_ID INT PRIMARY KEY,
    Customer_Name VARCHAR(50)
);

CREATE TABLE Product (
    Product_ID INT PRIMARY KEY,
    Product_Name VARCHAR(50),
    Price DECIMAL(10,2)
);

CREATE TABLE Orders (
    Order_ID INT PRIMARY KEY,
    Customer_ID INT,
    Product_ID INT,
    Quantity INT
);

CREATE TABLE Payment (
    Payment_ID INT PRIMARY KEY,
    Order_ID INT,
    Payment_Mode VARCHAR(20)
);
INSERT INTO Customer VALUES
(101, 'Ravi'),
(102, 'Priya'),
(103, 'Kumar');

INSERT INTO Product VALUES
(201, 'Laptop', 50000),
(202, 'Mobile', 20000),
(203, 'Headphones', 2000);

INSERT INTO Orders VALUES
(301, 101, 201, 1),
(302, 102, 202, 2),
(303, 101, 203, 1);

INSERT INTO Payment VALUES
(401, 301, 'UPI'),
(402, 302, 'Card'),
(403, 303, 'Cash');
SELECT * FROM Customer;
SELECT Customer.Customer_Name,
       Orders.Order_ID,
       Product.Product_Name,
       Product.Price,
       Orders.Quantity,
       Payment.Payment_Mode
FROM Customer
INNER JOIN Orders
ON Customer.Customer_ID = Orders.Customer_ID
INNER JOIN Product
ON Orders.Product_ID = Product.Product_ID
LEFT JOIN Payment
ON Orders.Order_ID = Payment.Order_ID;