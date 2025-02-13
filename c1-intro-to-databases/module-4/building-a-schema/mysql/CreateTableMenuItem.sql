CREATE TABLE IF NOT EXISTS menu_item (
    menu_item_id INT PRIMARY KEY AUTO_INCREMENT,
    description VARCHAR(255) NOT NULL,
    price FLOAT NOT NULL,
    availability TINYINT(1) NOT NULL,
    menu_id INT NOT NULL,
    FOREIGN KEY (menu_id) REFERENCES menu (menu_id)
);
