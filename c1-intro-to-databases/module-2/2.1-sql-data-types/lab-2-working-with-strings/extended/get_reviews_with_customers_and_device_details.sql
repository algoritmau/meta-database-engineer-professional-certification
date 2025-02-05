-- Query to view reviews with customer and device details
SELECT r.review_id,
       CONCAT(c.first_name, ' ', c.last_name) as customer_name,
       d.brand,
       d.model,
       r.rating,
       r.title,
       r.review_text,
       r.verified_purchase,
       r.helpful_votes,
       r.created_at
FROM reviews r
         JOIN customers c ON r.customer_id = c.customer_id
         JOIN devices d ON r.device_id = d.device_id
WHERE r.status = 'approved'
ORDER BY r.created_at DESC;