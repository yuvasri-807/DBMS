CREATE DATABASE ProductReviewDB;
USE ProductReviewDB;

-- 1. Product Table
CREATE TABLE Product (
    product_id INT PRIMARY KEY,
    product_name VARCHAR(100),
    price DECIMAL(10,2)
);

-- 2. Review Table
CREATE TABLE Review (
    review_id INT PRIMARY KEY,
    product_id INT,
    customer_name VARCHAR(100),
    review_text VARCHAR(255),
    review_date DATE,
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- 3. Rating Table
CREATE TABLE Rating (
    rating_id INT PRIMARY KEY,
    product_id INT,
    customer_name VARCHAR(100),
    rating INT CHECK (rating BETWEEN 1 AND 5),
    FOREIGN KEY (product_id) REFERENCES Product(product_id)
);

-- Insert Products
INSERT INTO Product VALUES
(1, 'Laptop', 55000),
(2, 'Smartphone', 25000),
(3, 'Headphones', 3000),
(4, 'Smart Watch', 5000);

-- Insert Reviews
INSERT INTO Review VALUES
(101, 1, 'Arun', 'Excellent laptop', '2026-09-01'),
(102, 2, 'Priya', 'Good phone', '2026-09-02'),
(103, 3, 'Kumar', 'Very good sound', '2026-09-03'),
(104, 4, 'Divya', 'Nice watch', '2026-09-04');

-- Insert Ratings
INSERT INTO Rating VALUES
(201, 1, 'Arun', 5),
(202, 2, 'Priya', 4),
(203, 3, 'Kumar', 5),
(204, 4, 'Divya', 4);

-- 4. Retrieve Product Reviews
SELECT * FROM Review;

-- 5. Calculate Average Rating
SELECT 
    product_id,
    AVG(rating) AS average_rating
FROM Rating
GROUP BY product_id;

-- 6. Identify Highly Rated Products
SELECT 
    product_id,
    AVG(rating) AS average_rating
FROM Rating
GROUP BY product_id
HAVING AVG(rating) >= 4;