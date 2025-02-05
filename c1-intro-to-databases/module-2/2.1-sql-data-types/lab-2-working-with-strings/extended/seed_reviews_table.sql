-- Insert sample review data
INSERT INTO reviews (customer_id,
                     device_id,
                     rating,
                     title,
                     review_text,
                     verified_purchase,
                     helpful_votes,
                     status)
VALUES (1, -- John Smith
        1, -- iPhone 14 Pro
        5,
        'Outstanding Premium Phone!',
        'The iPhone 14 Pro exceeds all expectations. The camera system is incredible, and the battery life is impressive. The new dynamic island feature is both functional and innovative. Highly recommended for any tech enthusiast!',
        TRUE,
        12,
        'approved'),
       (2, -- Maria Garcia
        2, -- Samsung Galaxy S23 Ultra
        4,
        'Great Android Flagship',
        'The S23 Ultra is a powerful device with an amazing display and the S-Pen functionality is very useful. Battery life is good, but charging could be faster. Camera system is versatile and produces excellent shots.',
        TRUE,
        8,
        'approved'),
       (3, -- Robert Johnson
        3, -- Google Pixel 7 Pro
        5,
        'Best Camera Phone',
        'This refurbished Pixel 7 Pro works like new! The camera capabilities are outstanding, especially night mode and portrait shots. Pure Android experience is smooth and clean. Great value for the price.',
        TRUE,
        15,
        'approved');
