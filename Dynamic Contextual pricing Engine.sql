CREATE DATABASE pricing_db;
USE pricing_db;

CREATE TABLE pricing (
    id INT PRIMARY KEY,
    product VARCHAR(50),
    price INT,
    competitor_price INT,
    conversion INT,
    revenue INT
);

INSERT INTO pricing VALUES
(1, 'Watch', 3000, 2800, 1, 3000),
(2, 'Watch', 2900, 2800, 1, 2900),
(3, 'Watch', 3200, 2800, 0, 0),
(4, 'Watch', 2800, 2600, 1, 2800),
(5, 'Watch', 2700, 2500, 0, 0);

SELECT * FROM pricing;

SELECT product, MAX(price) AS best_price
FROM pricing
WHERE conversion = 1
GROUP BY product;

SELECT product, SUM(revenue) AS total_revenue
FROM pricing
GROUP BY product;

SELECT *
FROM pricing
WHERE competitor_price < price;

UPDATE pricing
SET price = competitor_price
WHERE competitor_price < price;

SELECT * FROM pricing;