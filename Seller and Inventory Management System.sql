USE SellerDB;

CREATE TABLE Seller (
    seller_id INT PRIMARY KEY,
    seller_name VARCHAR(50),
    phone VARCHAR(15)
);

CREATE TABLE Inventory (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(50),
    stock INT,
    seller_id INT,
    FOREIGN KEY (seller_id) REFERENCES Seller(seller_id)
);

INSERT INTO Seller VALUES
(1, 'Ravi', '9876543210'),
(2, 'Kumar', '9876543211');

INSERT INTO Inventory VALUES
(101, 'Laptop', 10, 1),
(102, 'Mobile', 5, 2),
(103, 'Keyboard', 0, 1),
(104, 'Mouse', 8, 2);

SELECT * FROM Seller;
SELECT * FROM Inventory;