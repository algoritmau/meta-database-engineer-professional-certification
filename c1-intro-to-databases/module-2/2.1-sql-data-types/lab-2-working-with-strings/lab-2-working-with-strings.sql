USE cm_devices;

CREATE TABLE customers
(
    username CHAR(9)             NOT NULL PRIMARY KEY UNIQUE,
    fullName VARCHAR(100)        NOT NULL,
    email    VARCHAR(255) UNIQUE NOT NULL
);

SHOW TABLES;

SHOW columns FROM customers;

-- Additional task
CREATE TABLE feedback (
    feedback_id INT NOT NULL PRIMARY KEY AUTO_INCREMENT,
    feedback_type VARCHAR(100) NOT NULL,
    comment TEXT
);

SHOW TABLES;

SHOW columns FROM feedback;