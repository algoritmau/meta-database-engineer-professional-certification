-- Exercise: Working with numbers
-- Task 1: Create a database called "cm_devices"
CREATE DATABASE cm_devices;

USE cm_devices;

-- Task 2: Create a SQL statement with relevant attributes and data types
-- to create the "devices" table.
CREATE TABLE devices (
    deviceId INT NOT NULL AUTO_INCREMENT,
    deviceName VARCHAR(50) NOT NULL UNIQUE,
    price DECIMAL NOT NULL,
    PRIMARY KEY (deviceId),
    CHECK (CHAR_LENGTH(deviceName) >= 10) -- Enforces minimum length of 10 characters
) AUTO_INCREMENT = 1000;

SHOW TABLES;

SHOW columns FROM devices;

-- Additional task
CREATE TABLE stock (
    deviceId INT NOT NULL,
    quantity INT NOT NULL,
    totalPrice DECIMAL NOT NULL
);
