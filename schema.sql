/* 1.
 ==========================================================================
 Let's begin first by creating our tables and filling them with sample data! 
 ==========================================================================
                                                                              */
 
-- Creating the database:
CREATE DATABASE project_mysql2025

-- Creating the Customers Table:
CREATE TABLE Customers(
Customer_ID INT AUTO_INCREMENT PRIMARY KEY,                              -- Primary key for the Customers table
	First_Name VARCHAR(50) NOT NULL,
	Last_Name VARCHAR(50) NOT NULL,
	Email VARCHAR(100),
	Phone VARCHAR(50) NOT NULL ,
	Address VARCHAR(255) NOT NULL,
	City VARCHAR(50) NOT NULL,
	State VARCHAR(50) NOT NULL,
	ZipCode VARCHAR(50) NOT NULL,
	Country VARCHAR(50),
	Created_At DATETIME DEFAULT NOW()
);

-- Creating the Categories table
CREATE TABLE Categories (
	Category_ID INT AUTO_INCREMENT  PRIMARY KEY ,                        -- Primary key for the Categories table
	Category_Name VARCHAR(100),
	Description VARCHAR(255)
);

-- Creating the Products table
CREATE TABLE Products (
	Product_ID INT AUTO_INCREMENT PRIMARY KEY,                           -- Primary key for the Products Table
	Product_Name VARCHAR(100),
	Category_ID INT,
	Price DECIMAL(10,2),
	Stock INT,
	Created_At DATETIME DEFAULT NOW(),
    FOREIGN KEY(Category_ID) REFERENCES Categories(Category_ID)         -- Foreign key reference to Categories
);

-- Creating the Orders table:
CREATE TABLE Orders (
	Order_ID INT AUTO_INCREMENT PRIMARY KEY,                             -- Primary key for the Orders table
	Customer_ID INT,
	Order_Date DATETIME,
	Total_Amount DECIMAL(10,2),
	FOREIGN KEY (Customer_ID) REFERENCES Customers(Customer_ID)          -- Foreign key reference to Customers table
    );
    
-- Create the OrderItems table
CREATE TABLE OrderedItems (
	OrderItem_ID INT AUTO_INCREMENT PRIMARY KEY,                         -- Primary key for the OrderedItems tan;e
	Order_ID INT,
	Product_ID INT,
	Quantity INT,
	Price DECIMAL(10,2),
	FOREIGN KEY (Product_ID) REFERENCES Products(Product_ID),              -- Foreign key reference to Products table
	FOREIGN KEY (Order_ID) REFERENCES Orders(Order_ID)                     -- Foreign key reference to Orders table
);