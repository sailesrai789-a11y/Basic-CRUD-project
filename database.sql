-- Run this in MySQL Workbench or MySQL Command Line

-- Step 1: Create database
CREATE DATABASE IF NOT EXISTS cruddb;
USE cruddb;

-- Step 2: Create users table
CREATE TABLE IF NOT EXISTS users (
    id    INT AUTO_INCREMENT PRIMARY KEY,
    name  VARCHAR(100) NOT NULL,
    email VARCHAR(150) NOT NULL UNIQUE,
    phone VARCHAR(15)  NOT NULL
);

-- Step 3: Insert sample data
INSERT INTO users (name, email, phone) VALUES
('Rahul Sharma', 'rahul@email.com', '9876543210'),
('Priya Singh',  'priya@email.com', '9123456780'),
('Amit Kumar',   'amit@email.com',  '9001234567');

-- Done! DB user: admin | Password: Mysql123@
