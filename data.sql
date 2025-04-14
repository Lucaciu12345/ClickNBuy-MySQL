-- Inserting sample data into Categories table
INSERT INTO Categories (Category_Name, Description) VALUES                              
('Electronics', 'Gadgets, computers, and accessories'),
('Furniture', 'Furniture for home and office'),
('Clothes', 'Fashionable apparel for all seasons and occasions'),
('Books', 'Fiction, non-fiction, and educational books');

-- Inserting sample data into Customers table 
INSERT INTO Customers (First_Name, Last_Name, Email, Phone, Address, City, State, ZipCode, Country) VALUES                                   
('Ion', 'Popescu', 'ion.popescu@gmail.com', '0712345678', 'Strada Mare 123', 'Ploiesti', 'Prahova', '010101', 'Romania'),
('Maria', 'Ionescu', 'maria.ionescu@gmail.com', '0712345555', 'Strada Lunga 456', 'Cluj-Napoca', 'Cluj', '400000', 'Romania'),
('Andrei', 'Mihai', 'andrei.mihai@gmail.com', '0731564890', 'Strada Lipscani.', 'Bucharest', 'București', '020202', 'Romania'),
('John', 'Smith', 'john.smith@gmail.com', '1234567890', '123 Main St', 'New York', 'New York', '10001', 'USA'),
('Laura', 'Jones', 'laura.jones@gmail.com', '2345678901', '456 Oak St', 'Los Angeles', 'California', '90001', 'USA'),
('James', 'Taylor', 'james.taylor@gmail.com', '3456789012', '789 Pine St', 'Chicago', 'Illinois', '60601', 'USA'),
('Emily', 'Davis', 'emily.davis@gmail.com', '4567890123', '101 Maple Ave', 'San Francisco', 'California', '94105', 'USA'),
('David', 'Miller', 'david.miller@gmail.com', '5678901234', '202 Birch Rd', 'Miami', 'Florida', '33101', 'USA'),
('Carlos', 'Gomez', 'carlos.gomez@gmail.com', '3456789012', 'Av. de la Libertad 100', 'Madrid', 'Madrid', '28001', 'Spain'),
('Ana', 'Dumitrescu', 'ana.dumitrescu@gmail.com', '0767890123', 'Strada Stejarului 303', 'Constanta', 'Constanța', '900000', 'Romania'),
('Stefan', 'Marin', 'stefan.marin@gmail.com', '0778901234', 'Strada Muntelui 404', 'Brașov', 'Brașov', '500000', 'Romania'),
('Isabella', 'Bianchi', 'isabella.bianchi@gmail.com', '4567890123', 'Via Roma 500', 'Rome', 'Lazio', '00100', 'Italy'),
('Ioana', 'Stoica', 'ioana.stoica@gmail.com', '0789012345', 'Strada Luminitei 505', 'Oradea', 'Bihor', '410000', 'Romania'),
('Vasile', 'Toma', 'vasile.toma@gmail.com', '0790123456', 'Strada Padurii 606', 'Sibiu', 'Sibiu', '550000', 'Romania'),
('Max', 'Müller', 'max.mueller@gmail.com', '5678901234', 'Musterstraße 123', 'Berlin', 'Berlin', '10115', 'Germany'),
('Lena', 'Schmidt', 'lena.schmidt@gmail.comBOT', '6789012345', 'Kaiserstraße 42', 'Munich', 'Bavaria', '80331', 'Germany'),  -- Marked as a bot account
('Erik', 'Johansen', 'BOTerik.johansen@gmail.com', '7890123456', 'Karl Johan 12', 'Oslo', 'Oslo', '0151', 'Norway') -- Marked as a bot account

INSERT INTO Products (Product_Name, Category_ID, Price, Stock) VALUES                           
-- Electronics 
('Smartphone', 1, 599.99, 100),
('Laptop', 1, 999.99, 50),
('Camera', 1, 499.99, 30),

-- Furniture
('Sofa', 2, 399.99, 20),
('Dining Table', 2, 199.99, 15),
('Office Chair', 2, 89.99, 50),

-- Clothes
('T-Shirt', 3, 19.99, 200),
('Jeans', 3, 39.99, 150),
('Jacket', 3, 59.99, 100),

-- Books
('Novel: The Great Adventure', 4, 15.99, 50),
('Learning SQL', 4, 29.99, 40),
('History of the World', 4, 24.99, 30);

-- Inserting sample data into Customers table                                       
INSERT INTO Orders (Customer_ID, Order_Date, Total_Amount) VALUES
(1, '2025-03-01 10:30:00',1649.93),
(2, '2025-04-10 10:31:00',599.98 ),
(3, '2025-04-12 14:15:00', 2629.96 ),
(4, '2025-04-09 09:00:00', 59.97),
(5, '2022-11-05 18:10:00', 40.98),
(6, '2024-12-29 07:00:00', 110.95),
(7, '2018-01-03 18:37:00', 1179.97),
(8, '2025-01-17 03:29:00', 399.99),
(9, '2025-02-11 13:01:00', 1499.98),
(10, '2025-02-13 23:25:00', 399.98),
(11, '2020-10-14 22:45:00', 89.96),
(12, '2023-11-14 20:45:00', 89.97);

INSERT INTO OrderedItems (Order_ID, Product_ID, Quantity, Price)       
-- Ion's order
VALUES(1, 1, 2, 599.99),
      (1, 6, 5, 89.99),
-- Maria's  order
	  (2, 4, 1, 399.99),
      (2, 5, 1,199.99),
-- Andrei's  order
	  (3, 2, 2, 999.99),
      (3, 11, 1, 29.99),
      (3, 1, 1, 599.99),
-- John's order
      (4, 7, 3, 19.99),
-- Laura's order
	  (5, 10, 1, 15.99),
      (5, 12, 1, 24.99),
-- James's order
      (6, 7, 2, 19.99),
      (6, 11, 1, 29.99),
      (6, 12, 1, 24.99),
      (6, 10, 1, 15.99),
-- Emily's order
	  (7, 6, 2, 89.99), 
      (7, 2, 1, 999.99),
-- David's order
      (8, 4, 3, 399.99),
-- Carlos's order
      (9, 2, 1, 999.99),
      (9, 3, 1, 499.99),
-- Ana's order
      (10, 5, 2, 199.99),
-- Stefan's order
	  (11, 7, 2, 19.99),
      (11, 12, 2, 24.99),
-- Isabella's order
	  (12, 11, 3, 29.99)