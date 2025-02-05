-- Create the database
CREATE DATABASE cm_mobiles;

-- Use the database
USE cm_mobiles;

-- Create the devices table
CREATE TABLE devices (
    -- Unique identifier for each device record
    device_id INT PRIMARY KEY AUTO_INCREMENT,

    -- Manufacturing brand name (e.g., Apple, Samsung, etc.)
    brand VARCHAR(50) NOT NULL,

    -- Specific model name/number of the device
    model VARCHAR(100) NOT NULL,

    -- Unique manufacturer serial number for the device
    serial_number VARCHAR(50) UNIQUE NOT NULL,

    -- International Mobile Equipment Identity - unique 15-digit code
    imei VARCHAR(15) UNIQUE NOT NULL,

    -- Storage capacity in gigabytes (GB)
    storage_capacity INT NOT NULL,

    -- RAM capacity in gigabytes (GB)
    ram_gb INT NOT NULL,

    -- Device color
    color VARCHAR(30),

    -- Screen size in inches
    screen_size DECIMAL(3,1) NOT NULL,

    -- Battery capacity in milliampere-hours (mAh)
    battery_capacity INT NOT NULL,

    -- Operating system and version (e.g., iOS 15, Android 13)
    operating_system VARCHAR(50) NOT NULL,

    -- Processor/chipset information
    device_processor VARCHAR(100),

    -- Retail price in local currency
    retail_price DECIMAL(10,2) NOT NULL,

    -- Current quantity available in stock
    stock_quantity INT NOT NULL DEFAULT 0,

    -- Device condition status (new, refurbished, used, etc.)
    condition_status ENUM('new', 'refurbished', 'used', 'damaged') NOT NULL DEFAULT 'new',

    -- Inventory status (available, out of stock, discontinued)
    inventory_status ENUM('available', 'out_of_stock', 'discontinued') NOT NULL DEFAULT 'available',

    -- Timestamp of when the record was created
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,

    -- Timestamp of the last update to the record
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Add constraints
    CONSTRAINT chk_storage_capacity CHECK (storage_capacity > 0),
    CONSTRAINT chk_ram CHECK (ram_gb > 0),
    CONSTRAINT chk_screen_size CHECK (screen_size > 0),
    CONSTRAINT chk_battery_capacity CHECK (battery_capacity > 0),
    CONSTRAINT chk_retail_price CHECK (retail_price > 0),
    CONSTRAINT chk_stock_quantity CHECK (stock_quantity >= 0)
);

-- Seed the device table with three records: a new iPhone 14 Pro,
-- a new Samsung Galaxy S23 Ultra, and a refurbished Google Pixel 7 Pro
-- Insert sample records into devices table
INSERT INTO devices (
    brand,
    model,
    serial_number,
    imei,
    storage_capacity,
    ram_gb,
    color,
    screen_size,
    battery_capacity,
    operating_system,
    device_processor,
    retail_price,
    stock_quantity,
    condition_status,
    inventory_status
) VALUES
-- iPhone 14 Pro
(
    'Apple',
    'iPhone 14 Pro',
    'MNDY3LL/A-2022-1234',
    '490154203237518',
    256,
    6,
    'Space Black',
    6.1,
    3200,
    'iOS 16',
    'A16 Bionic',
    999.99,
    5,
    'new',
    'available'
),

-- Samsung Galaxy S23
(
    'Samsung',
    'Galaxy S23 Ultra',
    'SM-S918B-2023-5678',
    '351678294510236',
    512,
    12,
    'Phantom Black',
    6.8,
    5000,
    'Android 13',
    'Snapdragon 8 Gen 2',
    1199.99,
    3,
    'new',
    'available'
),

-- Google Pixel (Refurbished)
(
    'Google',
    'Pixel 7 Pro',
    'GP-7PRO-2022-9012',
    '867530991234567',
    128,
    8,
    'Hazel',
    6.7,
    5000,
    'Android 13',
    'Google Tensor G2',
    699.99,
    2,
    'refurbished',
    'available'
);

-- View the inserted records
SELECT * FROM devices;