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
    name VARCHAR(255) NOT NULL,
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
    description LONGTEXT DEFAULT '',
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