CREATE TABLE invoices (
    order_id INT PRIMARY KEY,
    customer_id INT,
    order_date DATE NOT NULL DEFAULT CURRENT_DATE,
    quantity INT NOT NULL,
    price DECIMAL(10, 0) NOT NULL
);
