USE restaurant;

CREATE TABLE IF NOT EXISTS waiter (
    waiter_id INT AUTO_INCREMENT PRIMARY KEY,
    waiter_name VARCHAR(255),
    contact_number VARCHAR(255),
    shift ENUM('morning', 'afternoon', 'evening')
);
