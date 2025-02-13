CREATE TABLE IF NOT EXISTS reservations (
    reservation_id INT AUTO_INCREMENT PRIMARY KEY,
    reservation_date DATETIME NOT NULL,
    no_of_guests INT NOT NULL,
    order_id INT NOT NULL,
    table_id INT NOT NULL,
    customer_id INT NOT NULL,
    FOREIGN KEY (order_id) REFERENCES orders (order_id),
    FOREIGN KEY (table_id) REFERENCES tbl (table_id),
    FOREIGN KEY (customer_id) REFERENCES customers (customer_id)
);
