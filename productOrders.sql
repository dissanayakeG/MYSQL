drop database product_orders;

create database if not exists product_orders;

use product_orders;


CREATE TABLE Users (
    user_id INT AUTO_INCREMENT PRIMARY KEY,
    username VARCHAR(50) NOT NULL,
    email VARCHAR(100) NOT NULL
);

CREATE TABLE Addresses (
    address_id INT AUTO_INCREMENT PRIMARY KEY,
    street VARCHAR(100) NOT NULL,
    city VARCHAR(50) NOT NULL,
    state VARCHAR(50) NOT NULL,
    user_id INT,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id)
);

CREATE TABLE Orders (
    order_id INT AUTO_INCREMENT PRIMARY KEY,
    order_date DATE NOT NULL,
    total_amount DECIMAL(10 , 2 ) NOT NULL,
    user_id INT,
    shipping_address_id INT,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (shipping_address_id)
        REFERENCES Addresses (address_id)
);

CREATE TABLE Products (
    product_id INT AUTO_INCREMENT PRIMARY KEY,
    product_name VARCHAR(100) NOT NULL,
    unit_price DECIMAL(10 , 2 ) NOT NULL
);

CREATE TABLE Order_Items (
    order_item_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    product_id INT,
    quantity INT NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id),
    FOREIGN KEY (product_id)
        REFERENCES Products (product_id)
);

CREATE TABLE Categories (
    category_id INT AUTO_INCREMENT PRIMARY KEY,
    category_name VARCHAR(50) NOT NULL
);

CREATE TABLE Product_Categories (
    product_id INT,
    category_id INT,
    PRIMARY KEY (product_id , category_id),
    FOREIGN KEY (product_id)
        REFERENCES Products (product_id),
    FOREIGN KEY (category_id)
        REFERENCES Categories (category_id)
);

CREATE TABLE Reviews (
    review_id INT AUTO_INCREMENT PRIMARY KEY,
    user_id INT,
    product_id INT,
    rating INT NOT NULL,
    comment TEXT,
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (product_id)
        REFERENCES Products (product_id)
);

CREATE TABLE Payments (
    payment_id INT AUTO_INCREMENT PRIMARY KEY,
    order_id INT,
    payment_date DATE NOT NULL,
    payment_amount DECIMAL(10 , 2 ) NOT NULL,
    FOREIGN KEY (order_id)
        REFERENCES Orders (order_id)
);

CREATE TABLE Roles (
    role_id INT AUTO_INCREMENT PRIMARY KEY,
    role_name VARCHAR(50) NOT NULL
);

CREATE TABLE User_Roles (
    user_id INT,
    role_id INT,
    PRIMARY KEY (user_id , role_id),
    FOREIGN KEY (user_id)
        REFERENCES Users (user_id),
    FOREIGN KEY (role_id)
        REFERENCES Roles (role_id)
);


DROP PROCEDURE IF EXISTS InsertSampleData;

DELIMITER //

CREATE PROCEDURE InsertSampleData()
BEGIN
	
    -- Insert users
    DECLARE i INT DEFAULT 1; 
	WHILE (i <= 15) DO
		INSERT INTO Users (username, email) VALUES (concat("user_",i), concat('user_',i,'@example.com'));
		SET i = i+1;
	END WHILE;

    -- Insert addresses
    INSERT INTO Addresses (street, city, state, user_id) VALUES 
        ('123 Main St', 'City1', 'State1', 1),
        ('456 Oak Ave', 'City2', 'State2', 2);

    -- Insert products
    INSERT INTO Products (product_name, unit_price) VALUES 
        ('Product A', 10.00),
        ('Product B', 15.00),
        ('Product C', 20.00);

    -- Insert categories
    INSERT INTO Categories (category_name) VALUES 
        ('Category X'),
        ('Category Y'),
        ('Category Z');

    -- Insert product categories (linking products to categories)
    INSERT INTO Product_Categories (product_id, category_id) VALUES 
        (1, 1),
        (1, 2),
        (2, 2),
        (3, 3);

    -- Insert orders
    INSERT INTO Orders (order_date, total_amount, user_id, shipping_address_id) VALUES 
        ('2023-10-16', 30.00, 1, 1),
        ('2023-10-16', 40.00, 2, 2);

    -- Insert order items (linking orders to products)
    INSERT INTO Order_Items (order_id, product_id, quantity) VALUES 
        (1, 1, 2),
        (1, 2, 1),
        (2, 3, 3);

    -- Insert reviews
    INSERT INTO Reviews (user_id, product_id, rating, comment) VALUES 
        (1, 1, 4, 'Great product!'),
        (2, 2, 5, 'Excellent quality.');

    -- Insert payments
    INSERT INTO Payments (order_id, payment_date, payment_amount) VALUES 
        (1, '2023-10-16', 30.00),
        (2, '2023-10-16', 40.00);

    -- Insert roles
    INSERT INTO Roles (role_name) VALUES 
        ('Admin'),
        ('User');

    -- Link users to roles
    INSERT INTO User_Roles (user_id, role_id) VALUES 
        (1, 1),
        (2, 2);
END //

DELIMITER ;

CALL InsertSampleData();


