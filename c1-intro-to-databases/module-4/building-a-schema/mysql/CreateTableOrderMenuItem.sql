CREATE TABLE IF NOT EXISTS order_menu_item (
    order_id INT AUTO_INCREMENT,
    menu_item_id INT,
    quantity INT NOT NULL,
    PRIMARY KEY (order_id, menu_item_id),
    FOREIGN KEY (menu_item_id) REFERENCES menu_item (menu_item_id),
    FOREIGN KEY (order_id) REFERENCES orders (order_id)
);
