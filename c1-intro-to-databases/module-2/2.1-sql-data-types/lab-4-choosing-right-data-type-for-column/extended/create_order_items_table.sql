-- Create order_items table for order details
CREATE TABLE order_items
(
    -- Unique identifier for each order item
    order_item_id   INT PRIMARY KEY AUTO_INCREMENT,

    -- Foreign keys
    order_id        INT            NOT NULL,
    device_id       INT            NOT NULL,

    -- Item details
    quantity        INT            NOT NULL,
    unit_price      DECIMAL(10, 2) NOT NULL,
    subtotal        DECIMAL(10, 2) NOT NULL,

    -- Any discounts applied
    discount_amount DECIMAL(10, 2)                                                                 DEFAULT 0.00,

    -- Final price after discount
    final_price     DECIMAL(10, 2) NOT NULL,

    -- Item status
    status          ENUM ('pending', 'confirmed', 'shipped', 'delivered', 'cancelled', 'returned') DEFAULT 'pending',

    -- Timestamps
    created_at      TIMESTAMP                                                                      DEFAULT CURRENT_TIMESTAMP,
    updated_at      TIMESTAMP                                                                      DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Add constraints
    CONSTRAINT fk_orderitem_order FOREIGN KEY (order_id)
        REFERENCES orders (order_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_orderitem_device FOREIGN KEY (device_id)
        REFERENCES devices (device_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT chk_quantity CHECK (quantity > 0),
    CONSTRAINT chk_unit_price CHECK (unit_price >= 0),
    CONSTRAINT chk_item_subtotal CHECK (subtotal >= 0),
    CONSTRAINT chk_discount CHECK (discount_amount >= 0),
    CONSTRAINT chk_final_price CHECK (final_price >= 0)
);

-- Create indexes for better performance
CREATE INDEX idx_order_customer ON orders (customer_id);
CREATE INDEX idx_order_status ON orders (order_status);
CREATE INDEX idx_order_date ON orders (order_date);
CREATE INDEX idx_order_number ON orders (order_number);
CREATE INDEX idx_orderitem_order ON order_items (order_id);
CREATE INDEX idx_orderitem_device ON order_items (device_id);