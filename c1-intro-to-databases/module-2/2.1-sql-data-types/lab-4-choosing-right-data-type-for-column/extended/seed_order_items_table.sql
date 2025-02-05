INSERT INTO order_items (order_id,
                         device_id,
                         quantity,
                         unit_price,
                         subtotal,
                         discount_amount,
                         final_price)
VALUES (1, -- Order ID from above
        1, -- iPhone 14 Pro
        1,
        999.99,
        999.99,
        0.00,
        999.99);