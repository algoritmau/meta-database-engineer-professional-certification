CREATE TABLE IF NOT EXISTS orders (
    order_id INT PRIMARY KEY AUTO_INCREMENT,
    order_date DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
    table_id INT NOT NULL,
    waiter_id INT NOT NULL,
    FOREIGN KEY (table_id) REFERENCES tbl (table_id),
    FOREIGN KEY (waiter_id) REFERENCES waiter (waiter_id)
);
