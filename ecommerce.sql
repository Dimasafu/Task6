-- membuat database baru
CREATE database ecommerce;

-- menggunakan database ecommerce
USE ecommerce;

-- membuat tabel products
CREATE TABLE products (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama_produk VARCHAR(100) NOT NULL,
    harga INT NOT NULL,
    deskripsi TEXT,
    stock INT NOT NULL,
);

--menambahkan data ke tabel products
INSERT INTO products (nama_produk, harga, deskripsi, stock) VALUES
('Laptop', 15000000, 'Laptop gaming dengan spesifikasi tinggi', 10),
('Smartphone', 5000000, 'Smartphone dengan kamera terbaik', 20),
('Headphone', 1000000, 'Headphone noise-cancelling', 30),
('Smartwatch', 2000000, 'Smartwatch dengan berbagai fitur kesehatan', 15),
('Tablet', 3000000, 'Tablet dengan layar besar dan baterai tahan lama', 25);

-- mengecek data
SELECT * FROM products;

-- membuat tabel users 
    CREATE TABLE users (
    id INT AUTO_INCREMENT PRIMARY KEY,
    nama VARCHAR(100) NOT NULL,
    email VARCHAR(100) NOT NULL,
    password VARCHAR(100) NOT NULL,
);

--menambahkan data ke tabel users
INSERT INTO users (nama, email, password) VALUES
('dimas', 'dimas@gmail.com', 'admin123'),
('budi', 'budi@gmail.com', 'admin321'),
('siti', 'siti@yahoo.com', 'admin456');

-- mengecek data users
SELECT * FROM users;

-- membuat tabel orders
CREATE TABLE orders (
    id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT NOT NULL,
    product_id INT NOT NULL,
    quantity INT NOT NULL,
    total INT NOT NULL,

-- Untuk mengkoneksikan user_id dari tabel user, dan product_id dari tabel products
    FOREIGN KEY (user_id) REFERENCES users(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- tambah data ke tabel orders
INSERT INTO orders (user_id, product_id, quantity, total) VALUES
(1, 1, 1, 15000000),
(2, 2, 2, 10000000),
(3, 3, 3, 3000000),
(1, 4, 1, 2000000),
(2, 5, 2, 6000000);

-- mengecek data orders
SELECT * FROM orders;

-- CRUD
-- CREATE atau INSERT DATA KE TABLE products
INSERT INTO products (nama_produk, harga, deskripsi, stock) VALUES
('Kamera', 8000000, 'Kamera DSLR dengan lensa berkualitas tinggi', 5),
('Printer', 1500000, 'Printer multifungsi untuk kebutuhan kantor', 10);

-- CREATE atau INSERT DATA KE TABLE users
INSERT INTO users (nama, email, password) VALUES
('budi', 'budi@gmail.com', 'admin321'),
('siti', 'siti@yahoo.com', 'admin456');

-- CREATE atau INSERT DATA KE TABLE orders
INSERT INTO orders (user_id, product_id, quantity, total) VALUES
(1, 1, 1, 15000000),
(2, 2, 2, 10000000);

-- READ atau MENAMPILKAN DATA DARI TABLE products
SELECT * FROM products;
-- READ atau MENAMPILKAN DATA DARI TABLE users
SELECT * FROM users;
-- READ atau MENAMPILKAN DATA DARI TABLE orders
SELECT * FROM orders;

-- UPDATE atau MENGUBAH DATA DI TABLE products
UPDATE products
SET harga = 12000000, stock = 8
WHERE id = 1;  
-- UPDATE atau MENGUBAH DATA DI TABLE users
UPDATE users
SET password = 'admin789'
WHERE id = 2;
-- UPDATE atau MENGUBAH DATA DI TABLE orders
UPDATE orders
SET quantity = 2, total = 30000000
WHERE id = 1;

-- DELETE atau MENGHAPUS DATA DI TABLE products
DELETE FROM products
WHERE id = 2;
-- DELETE atau MENGHAPUS DATA DI TABLE users
DELETE FROM users
WHERE id = 3;
-- DELETE atau MENGHAPUS DATA DI TABLE orders
DELETE FROM orders
WHERE id = 3;

-- Tambahan
-- untuk menampilkan data orders dengan nama user dan produk  
SELECT i.id, n.nama AS user_name, p.nama_produk AS product_name, o.quantity, o.total
FROM orders o  
JOIN users u ON o.user_id = u.id
JOIN products p ON o.product_id = p.id;