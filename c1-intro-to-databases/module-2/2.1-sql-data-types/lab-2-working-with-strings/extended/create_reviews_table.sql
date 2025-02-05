-- Create reviews table
CREATE TABLE reviews
(
    -- Unique identifier for each review
    review_id         INT PRIMARY KEY AUTO_INCREMENT,

    -- Foreign key linking to customers table
    customer_id       INT          NOT NULL,

    -- Foreign key linking to devices table
    device_id         INT          NOT NULL,

    -- Rating score (1-5 stars)
    rating            INT          NOT NULL,

    -- Review title
    title             VARCHAR(100) NOT NULL,

    -- Detailed review text
    review_text       TEXT         NOT NULL,

    -- Indicates if this is a verified purchase
    verified_purchase BOOLEAN                                  DEFAULT FALSE,

    -- Number of helpful votes from other customers
    helpful_votes     INT                                      DEFAULT 0,

    -- Review status for moderation
    status            ENUM ('pending', 'approved', 'rejected') DEFAULT 'pending',

    -- Record creation timestamp
    created_at        TIMESTAMP                                DEFAULT CURRENT_TIMESTAMP,

    -- Last update timestamp
    updated_at        TIMESTAMP                                DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,

    -- Add constraints
    CONSTRAINT fk_review_customer FOREIGN KEY (customer_id)
        REFERENCES customers (customer_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT fk_review_device FOREIGN KEY (device_id)
        REFERENCES devices (device_id)
        ON DELETE RESTRICT
        ON UPDATE CASCADE,

    CONSTRAINT chk_rating CHECK (rating BETWEEN 1 AND 5),
    CONSTRAINT chk_helpful_votes CHECK (helpful_votes >= 0)
);

-- Create indexes for better performance
CREATE INDEX idx_review_customer ON reviews (customer_id);
CREATE INDEX idx_review_device ON reviews (device_id);
CREATE INDEX idx_review_rating ON reviews (rating);

