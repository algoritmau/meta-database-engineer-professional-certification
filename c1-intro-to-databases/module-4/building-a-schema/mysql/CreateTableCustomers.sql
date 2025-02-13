CREATE TABLE IF NOT EXISTS customers (
    customer_id INT AUTO_INCREMENT PRIMARY KEY,
    customer_name VARCHAR(100) NOT NULL,
    nic_number VARCHAR(12) NOT NULL,
    phone_number VARCHAR(10) NOT NULL
);
