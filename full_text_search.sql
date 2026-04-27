USE TECH_COM;

DROP TABLE IF EXISTS products;

CREATE TABLE products (
  id INT AUTO_INCREMENT PRIMARY KEY,
  name VARCHAR(100),
  description TEXT,
  FULLTEXT idx_products_description (description),
  FULLTEXT idx_products_name_description (name, description)
);

INSERT INTO products (name, description) VALUES
('Laptop', 'A high-performance laptop with a sleek design.'),
('Smartphone', 'A phone with a large display and powerful features.'),
('Headphones', 'Noise-cancelling headphones for an immersive audio experience.'),
('Camera', 'A digital camera with high resolution and advanced features.');

SELECT * FROM products;

SELECT *
FROM products
WHERE MATCH(description)
AGAINST('phone' IN NATURAL LANGUAGE MODE);

SELECT *
FROM products
WHERE MATCH(name, description)
AGAINST('phone' IN NATURAL LANGUAGE MODE);

