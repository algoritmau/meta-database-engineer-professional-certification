-- Task 1: Create a database named bookshop
CREATE
    DATABASE bookshop;

USE bookshop;

-- Task 2: Create a table named customers
CREATE TABLE customers
(
    customer_id      INT PRIMARY KEY AUTO_INCREMENT,
    customer_name    VARCHAR(100) NOT NULL,
    customer_address VARCHAR(100) NOT NULL
);

SHOW
    TABLES;

-- Task 3: Insert data into the table
INSERT INTO customers (customer_name, customer_address)
VALUES ('Alice', '123 Main St'),
       ('Bob', '456 Elm St'),
       ('Charlie', '789 Maple St');
