CREATE DATABASE shopapp;
USE shopapp;

-- Khách hàng muốn mua hàng phải đăng ký tài khoản trước => Tạo bảng khách hàng (users)

CREATE TABLE users (
    id INT PRIMARY KEY AUTO_INCREMENT,
    fullname VARCHAR(255) DEFAULT '',
    phone_number VARCHAR(50) NOT NULL,
    address VARCHAR(255) DEFAULT '',
    password VARCHAR(255) NOT NULL DEFAULT '', 
    created_at DATETIME,
    updated_at DATETIME,
    is_active  TINYINT(1) DEFAULT 1,
    date_of_birth DATE,
    facebook_account_id INT DEFAULT 0,
    google_account_id INT DEFAULT 0
);
ALTER TABLE users ADD COLUMN role_id INT;


-- Tạo bảng tokens để lưu token của user
CREATE TABLE tokens (
    id INT PRIMARY KEY AUTO_INCREMENT,
    token VARCHAR(255) UNIQUE NOT NULL,
    token_type  VARCHAR(255) NOT NULL,
    expiration_date DATETIME ,
    revoked TINYINT(1) NOT NULL,
    expired TINYINT(1) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)   
);


-- Tạo bảng vai trò (roles) để phân quyền cho user
CREATE TABLE roles (
    id INT PRIMARY KEY ,
    name VARCHAR(255) NOT NULL
);
ALTER TABLE users ADD FOREIGN KEY (role_id) REFERENCES roles(id);

-- Hổ trợ đăng nhập bằng Facebook và Google
CREATE TABLE social_accounts (
    id INT PRIMARY KEY AUTO_INCREMENT,
    provider VARCHAR(255) NOT NULL COMMENT 'Tên nhà social network',
    provider_id VARCHAR(255) NOT NULL,
    email VARCHAR(255) NOT NULL COMMENT 'Email của tài khoản',
    name VARCHAR(255) NOT NULL COMMENT 'Tên của người dùng',
    user_id INT,
    FOREIGN KEY (user_id) REFERENCES users(id)
);


-- Bảng danh mục sản phẩm
CREATE TABLE categories (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(255) NOT NULL DEFAULT '' COMMENT 'Tên danh mục, vd: Đồ điện tử'
);


-- Bảng sản phẩm
CREATE TABLE products (
    id INT PRIMARY KEY AUTO_INCREMENT,
    name VARCHAR(350) NOT NULL DEFAULT '' COMMENT 'Tên sản phẩm',
    price FLOAT NOT NULL CHECK (price >= 0),
    image_url VARCHAR(300) DEFAULT '' ,
    description LONGTEXT ,
    created_at TIMESTAMP,
    updated_at TIMESTAMP,
    category_id INT,
    FOREIGN KEY (category_id) REFERENCES categories(id)
);


-- Đặt hàng - orders
CREATE TABLE orders (
    id INT PRIMARY KEY AUTO_INCREMENT,
    user_id INT,
    fullname VARCHAR(255) DEFAULT '',
    email VARCHAR(255) DEFAULT '',
    phone_number VARCHAR(50) NOT NULL,
    address VARCHAR(255) NOT NULL,
    note VARCHAR(255) DEFAULT '',
    order_date DATETIME DEFAULT CURRENT_TIMESTAMP,
    status  VARCHAR(50) DEFAULT 'PENDING',
    total_money FLOAT CHECK (total_money >= 0),
    FOREIGN KEY (user_id) REFERENCES users(id)
);

ALTER TABLE orders ADD COLUMN payment_method VARCHAR(100);
ALTER TABLE orders ADD COLUMN shipping_method VARCHAR(100);
ALTER TABLE orders ADD COLUMN shipping_date DATE;
ALTER TABLE orders ADD COLUMN shipping_address VARCHAR(200);
ALTER TABLE orders ADD COLUMN tracking_number VARCHAR(100);

-- Xóa đơn hàng => xóa mềm => thêm trường active
ALTER TABLE orders ADD COLUMN is_active TINYINT(1);

-- Trạng thái đơn hàng chỉ nhận một số giá trị cụ thể
ALTER TABLE orders MODIFY COLUMN status ENUM('PENDING', 'PROCESSING','SHIPPING', 'DELIVERED', 'CANCELED') COMMENT 'Trạng thái đơn hàng';

-- Chi tiết đơn hàng - order_details
CREATE TABLE order_details (
    id INT PRIMARY KEY AUTO_INCREMENT,
    order_id INT,
    product_id INT,
    price FLOAT CHECK (price >= 0),
    number_of_products INT CHECK (number_of_products > 0),
    total_money FLOAT CHECK (total_money >= 0),
    color VARCHAR(50) DEFAULT '',
    FOREIGN KEY (order_id) REFERENCES orders(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);

-- Thêm dữ liệu cho bảng roles
INSERT INTO roles (id, name) VALUES 
(1, 'user'),
(2, 'admin');

-- Thêm dữ liệu cho bảng users
INSERT INTO users (fullname, phone_number, address, password, created_at, updated_at, is_active, role_id) VALUES
('Admin', '0123456789', 'Hà Nội', '$2a$10$0G3Jk4RkXyf1xqX9X9X9XeX9X9X9X9X9X9X9X9X9X9X9X9X9X9X9X', NOW(), NOW(), 1, 2),
('Nguyễn Văn A', '0987654321', 'TP.HCM', '$2a$10$0G3Jk4RkXyf1xqX9X9X9XeX9X9X9X9X9X9X9X9X9X9X9X9X9X9X9X', NOW(), NOW(), 1, 1),
('Trần Thị B', '0912345678', 'Đà Nẵng', '$2a$10$0G3Jk4RkXyf1xqX9X9X9XeX9X9X9X9X9X9X9X9X9X9X9X9X9X9X9X', NOW(), NOW(), 1, 1);

-- Thêm dữ liệu cho bảng categories
INSERT INTO categories (name) VALUES 
('Pin sạc dự phòng'),
('Ốp lưng'),
('Sạc, cáp');

-- Thêm dữ liệu cho bảng products
INSERT INTO products (name, price, thumbnail, description, created_at, updated_at, category_id) VALUES
('Pin sạc dự phòng Baseus Airpow Fast Charge 20000mAh 20W', 440000, 'pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-9.png', 'Pin sạc dự phòng Baseus Airpow Fast Charge 20000mAh 20W', NOW(), NOW(), 1),
('Pin dự phòng Anker Zolo 20000mAh 30W 1A1C tích hợp cáp C, L A1689', 760000, 'pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_4_.png', 'Pin dự phòng Anker Zolo 20000mAh 30W 1A1C tích hợp cáp C, L A1689', NOW(), NOW(), 1),
('Ốp lưng iPhone 11 Filada trong viền màu', 105000, 'op-lung-iphone-11-filada-trong-vien-mau.png', 'Ốp lưng iPhone 11 Filada trong viền màu', NOW(), NOW(), 2),
('Ốp lưng Samsung Galaxy A14 2023 Clear Transparency', 59000, 'op-lung-samsung-galaxy-a14-2023-clear-transparency.png', 'Ốp lưng Samsung Galaxy A14 2023 Clear Transparency', NOW(), NOW(), 2),
('Sạc nhanh 20W Apple MHJE3ZA', 490000, 'adapter-20w-apple-5_1.png', 'Sạc nhanh 20W Apple MHJE3ZA | Chính hãng Apple Việt Nam', NOW(), NOW(), 3),
('Củ sạc nhanh Anker 2 cổng 1C1A/20W A2348', 150000, 'sac-anker-1c-20w-a2347-a-04.png', 'Củ sạc nhanh Anker 2 cổng 1C1A/20W A2348', NOW(), NOW(), 3);

-- Thêm dữ liệu cho bảng product_images
INSERT INTO product_images (product_id, image_url) VALUES
(1, 'pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-9.png'),
(1, 'pin-sac-du-phong-baseus-airpow-fast-charge-20000mah-20w-7.png'),
(2, 'pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_4_.png'),
(2, 'pin-sac-du-phong-anker-zolo-a1689-20000mah-30w_3_.png'),
(3, 'op-lung-iphone-11-filada-trong-vien-mau.png'),
(3, 'op-lung-iphone-11-filada-trong-vien-mau-2.png'),
(4, 'op-lung-samsung-galaxy-a14-2023-clear-transparency.png'),
(4, 'op-lung-samsung-galaxy-a14-2023-clear-transparency-2.png'),
(5, 'adapter-20w-apple-5_1.png'),
(5, 'adapter-20w-apple-1_1.png'),
(6, 'sac-anker-1c-20w-a2347-a-04.png'),
(6, 'sac-anker-1c-20w-a2347-a-05.png');

-- Thêm dữ liệu cho bảng orders
INSERT INTO orders (user_id, fullname, email, phone_number, address, note, order_date, status, total_money, payment_method, shipping_method, is_active) VALUES
(2, 'Nguyễn Văn A', 'nguyenvana@email.com', '0987654321', '123 Đường ABC, Quận 1, TP.HCM', 'Giao giờ hành chính', NOW(), 'PENDING', 440000, 'cod', 'express', 1),
(3, 'Trần Thị B', 'tranthib@email.com', '0912345678', '456 Đường XYZ, Quận Hải Châu, Đà Nẵng', 'Giao buổi tối', NOW(), 'PROCESSING', 760000, 'bank_transfer', 'standard', 1);

-- Thêm dữ liệu cho bảng order_details
INSERT INTO order_details (order_id, product_id, price, number_of_products, total_money, color) VALUES
(1, 1, 440000, 1, 440000, NULL),
(2, 2, 760000, 1, 760000, NULL);