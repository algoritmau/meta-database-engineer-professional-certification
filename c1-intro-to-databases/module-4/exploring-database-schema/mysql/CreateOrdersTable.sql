CREATE TABLE IF NOT EXISTS orders (
  order_id INT AUTO INCREMENT,
  customer_id INT,
  product_id INT,
  quantity INT,
  order_date DATE,
  order_status ENUM('pending', 'shipped', 'delivered'),
  PRIMARY KEY (order_id),
  FOREIGN KEY (customer_id) REFERENCES customers(customer_id),
  FOREIGN KEY (product_id) REFERENCES products(product_id)
);
