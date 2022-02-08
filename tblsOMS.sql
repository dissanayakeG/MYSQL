drop database if exists order_management_system;
create database if not exists order_management_system;

use order_management_system;
CREATE TABLE if not exists countries (
    id int AUTO_INCREMENT,
    name varchar(25),
    PRIMARY KEY (id)
);

CREATE TABLE if not exists states (
    id int AUTO_INCREMENT,
    country_id int,
    name varchar(25),
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES countries(id)
);

CREATE TABLE if not exists postal_codes (
    id int AUTO_INCREMENT,
    country_id int,
    state_id int,
    name varchar(25),
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (state_id) REFERENCES states(id)
);


CREATE TABLE if not exists customers (
    id int AUTO_INCREMENT,
    first_name varchar(50),
    last_name varchar(50),
    phone varchar(50),
    email varchar(50),
    address1 varchar(50),
    address2 varchar(50),
    country_id int,
    state_id int,
    postal_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (country_id) REFERENCES countries(id),
    FOREIGN KEY (state_id) REFERENCES states(id),
    FOREIGN KEY (postal_id) REFERENCES postal_codes(id)
);

CREATE TABLE if not exists categories (
    id int AUTO_INCREMENT,
    category_name varchar(25),
    PRIMARY KEY (id)
);

CREATE TABLE if not exists products (
    id int AUTO_INCREMENT,
    product_name varchar(25),
    category_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (category_id) REFERENCES categories(id)
);

CREATE TABLE if not exists orders (
    id int AUTO_INCREMENT,
    order_name varchar(25),
    customer_id int,
    product_id int,
    PRIMARY KEY (id),
    FOREIGN KEY (customer_id) REFERENCES customers(id),
    FOREIGN KEY (product_id) REFERENCES products(id)
);