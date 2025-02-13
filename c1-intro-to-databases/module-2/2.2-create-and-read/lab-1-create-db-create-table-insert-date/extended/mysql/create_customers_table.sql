USE bookshop;

CREATE TABLE customers
(
    customer_id       INT PRIMARY KEY AUTO_INCREMENT,
    first_name        VARCHAR(50)         NOT NULL,
    last_name         VARCHAR(50)         NOT NULL,
    email             VARCHAR(100) UNIQUE NOT NULL,
    phone             VARCHAR(20),
    address           VARCHAR(200),
    city              VARCHAR(50),
    country           VARCHAR(50),
    registration_date DATETIME DEFAULT CURRENT_TIMESTAMP
);