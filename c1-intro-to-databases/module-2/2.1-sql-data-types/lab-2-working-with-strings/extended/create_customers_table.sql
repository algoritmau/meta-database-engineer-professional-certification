-- Create customers table
CREATE TABLE customers
(
    -- Unique identifier for each customer
    customer_id       INT PRIMARY KEY AUTO_INCREMENT,

    -- Customer's first name
    first_name        VARCHAR(50)         NOT NULL,

    -- Customer's last name
    last_name         VARCHAR(50)         NOT NULL,

    -- Customer's email address
    email             VARCHAR(100) UNIQUE NOT NULL,

    -- Customer's phone number
    phone             VARCHAR(20)         NOT NULL,

    -- Customer's complete address
    street_address    VARCHAR(100)        NOT NULL,

    -- City name
    city              VARCHAR(50)         NOT NULL,

    -- State/Province/Region
    province          VARCHAR(50)         NOT NULL,

    -- Postal/ZIP code
    postal_code       VARCHAR(10)         NOT NULL,

    -- Country name
    country           VARCHAR(50)         NOT NULL DEFAULT 'United States',

    -- Date of birth for age verification and birthday promotions
    date_of_birth     DATE,

    -- Preferred contact method
    preferred_contact ENUM('email', 'phone', 'mail') DEFAULT 'email',

    -- Customer loyalty points
    loyalty_points    INT                          DEFAULT 0,

    -- Account status
    status            ENUM('active', 'inactive', 'blocked') DEFAULT 'active',

    -- Record creation timestamp
    created_at        TIMESTAMP                    DEFAULT CURRENT_TIMESTAMP,

    -- Last update timestamp
    updated_at        TIMESTAMP                    DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Add constraints
    CONSTRAINT chk_email CHECK (email REGEXP '^[A-Za-z0-9._%+-]+@[A-Za-z0-9.-]+\.[A-Za-z]{2,}$'
) ,
    CONSTRAINT chk_phone CHECK (phone REGEXP '^[0-9+()-]{10,20}$'),
    CONSTRAINT chk_loyalty_points CHECK (loyalty_points >= 0)
);

-- Create index on frequently searched fields
CREATE INDEX idx_customer_email ON customers (email);
CREATE INDEX idx_customer_phone ON customers (phone);
CREATE INDEX idx_customer_name ON customers (last_name, first_name);
