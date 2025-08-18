-- Buat database
-- CREATE DATABASE cdc_demo;

-- Pindah ke database cdc_demo
\c sales;

-- Buat schema
CREATE SCHEMA sales;

-- Customers
CREATE TABLE sales.customers (
    customer_id SERIAL PRIMARY KEY,
    name VARCHAR(100) NOT NULL,
    email VARCHAR(100) UNIQUE NOT NULL,
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Orders
CREATE TABLE sales.orders (
    order_id SERIAL PRIMARY KEY,
    customer_id INT NOT NULL REFERENCES sales.customers(customer_id),
    product_name VARCHAR(100) NOT NULL,
    quantity INT NOT NULL,
    price NUMERIC(10,2) NOT NULL,
    status VARCHAR(50) DEFAULT 'pending',
    created_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP,
    updated_at TIMESTAMP DEFAULT CURRENT_TIMESTAMP
);

-- Index untuk CDC
CREATE INDEX idx_orders_updated_at ON sales.orders(updated_at);
