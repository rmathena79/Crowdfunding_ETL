-- This file contains the SQL commands to create all tables
DROP TABLE IF EXISTS campaigns;
DROP TABLE IF EXISTS subcategories;
DROP TABLE IF EXISTS categories;
DROP TABLE IF EXISTS contacts;

CREATE TABLE contacts(
    contact_id INT PRIMARY KEY,
    first_name VARCHAR(32) NOT NULL,
    last_name VARCHAR(32) NOT NULL,
    email VARCHAR(128) NOT NULL
);

CREATE TABLE categories(
    category_id VARCHAR(16) PRIMARY KEY,
    category VARCHAR(255) NOT NULL
);

CREATE TABLE subcategories(
    subcategory_id VARCHAR(16) PRIMARY KEY,
    subcategory VARCHAR(255) NOT NULL
);

CREATE TABLE campaigns(
    cf_id INT PRIMARY KEY,
    contact_id INT NOT NULL,
    FOREIGN KEY (contact_id) REFERENCES contacts(contact_id),
    company_name VARCHAR(255) NOT NULL,
    description VARCHAR(1024) NOT NULL,
    goal FLOAT NOT NULL,
    pledged FLOAT NOT NULL,
    outcome VARCHAR(16) NOT NULL,
    backers_count INT NOT NULL,
    country VARCHAR(2) NOT NULL,
    currency VARCHAR(3) NOT NULL,
    launched_date DATE NOT NULL,
    end_date DATE NOT NULL,
    category_id VARCHAR(16) NOT NULL,
    FOREIGN KEY (category_id) REFERENCES categories(category_id),
    subcategory_id  VARCHAR(16) NOT NULL,
    FOREIGN KEY (subcategory_id) REFERENCES subcategories(subcategory_id)
);