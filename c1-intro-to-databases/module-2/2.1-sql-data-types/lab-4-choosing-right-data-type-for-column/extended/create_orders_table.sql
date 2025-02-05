-- Create orders table
CREATE TABLE orders
(
    -- Unique identifier for each order
    order_id             INT PRIMARY KEY AUTO_INCREMENT,

    -- Foreign key linking to customers table
    customer_id          INT                NOT NULL,

    -- Order tracking information
    order_number         VARCHAR(20) UNIQUE NOT NULL,

    -- Order date and time
    order_date           TIMESTAMP                                                                      DEFAULT CURRENT_TIMESTAMP,

    -- Order status
    order_status         ENUM ('pending', 'confirmed', 'shipped', 'delivered', 'cancelled', 'returned') DEFAULT 'pending',

    -- Shipping information
    shipping_address     VARCHAR(255)       NOT NULL,
    shipping_city        VARCHAR(50)        NOT NULL,
    shipping_state       VARCHAR(50)        NOT NULL,
    shipping_postal_code VARCHAR(10)        NOT NULL,
    shipping_country     VARCHAR(50)        NOT NULL                                                    DEFAULT 'United States',

    -- Shipping method
    shipping_method      VARCHAR(50)        NOT NULL,

    -- Tracking number
    tracking_number      VARCHAR(50),

    -- Payment information
    payment_method       VARCHAR(50)        NOT NULL,
    payment_status       ENUM ('pending', 'completed', 'failed', 'refunded')                            DEFAULT 'pending',

    -- Order totals
    subtotal             DECIMAL(10, 2)     NOT NULL,
    shipping_cost        DECIMAL(10, 2)     NOT NULL                                                    DEFAULT 0.00,
    tax_amount           DECIMAL(10, 2)     NOT NULL                                                    DEFAULT 0.00,
    total_amount         DECIMAL(10, 2)     NOT NULL,

    -- Notes
    order_notes          TEXT,

    -- Timestamps
    created_at           TIMESTAMP                                                                      DEFAULT CURRENT_TIMESTAMP,
    updated_at           TIMESTAMP                                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Add constraints
    CONSTRAINT fk_order_customer FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT chk_total_amount CHECK (total_amount >= 0),
    CONSTRAINT chk_subtotal CHECK (subtotal >= 0),
    CONSTRAINT chk_shipping_cost CHECK (shipping_cost >= 0),
    CONSTRAINT chk_tax_amount CHECK (tax_amount >= 0)
);