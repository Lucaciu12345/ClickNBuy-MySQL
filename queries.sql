/* 2.
==================================================================================
From now on, all SQL queries in this project will be framed as business questions!
==================================================================================
                                                                                  */
                                                                                  
-- Query #1 " Please retrive all ordered items  for customer 7 !"
SELECT  o.Order_ID, o.Order_Date, o.Total_Amount, oi.Product_ID, p.Product_Name, oi.Quantity, oi.Price
FROM Orders o
INNER JOIN OrderedItems oi ON o.Order_ID=oi.Order_ID
INNER  JOIN Products p ON oi.Product_ID=p.Product_ID
WHERE Customer_ID= 7;

-- Query #2 " Please highlight  the customers who haven't placed an order yet so we can target them with an email campaign. I want their full name, email and phone number."
SELECT CONCAT(First_Name, ' ', Last_Name) AS Full_Name, c.Email, c.Phone FROM Customers c
LEFT JOIN Orders o ON c.Customer_ID= o.Customer_ID
WHERE o.Customer_ID IS NULL;

-- Query #3 " Thank you! Now, Can you show us the products that haven't been bought so we can discard them?"
SELECT * FROM OrderedItems oi
RIGHT JOIN Products p ON oi.Product_ID= p.Product_ID
WHERE oi.Product_ID IS NULL;

-- Query #4 " How many orders were placed each month in each year, and which months had the highest number of orders?"
SELECT YEAR(Order_Date) AS Year , MONTHNAME(Order_Date) AS Month, COUNT(Order_ID) AS Num_of_Orders
FROM Orders
GROUP BY year, month
ORDER BY Num_of_Orders DESC;

-- Query #5 " Which customer orders have been placed within the last 30 days so we can give them a discount code!"
SELECT c.First_Name, c.Last_Name, Email, Order_Date FROM Orders o
INNER JOIN Customers c ON o.Customer_ID=c.Customer_ID
WHERE Order_Date>=DATE_SUB(NOW(), INTERVAL 30 DAY);

-- Query #6 "What is our total inventory value per category?" 
SELECT Category_Name, SUM(Price*Stock) AS total_value_category 
FROM Products p
INNER JOIN Categories c ON p.Category_ID=c.Category_ID
GROUP BY Category_Name;

-- Query #7 "Can we categorize each product by its price range (Low End, Medium End, High End) to better understand our product portfolio?
SELECT Product_Name, Price,
    CASE 
	WHEN Price >= 499.99 THEN 'High End'
	WHEN Price BETWEEN 100 AND 499.98 THEN 'Medium End'
	ELSE 'Low End'
    END AS Price_Range
FROM Products;

-- Query #8 "What are the top-ranked products within each category based on quantity?"
WITH ranking_per_cat AS(SELECT p.Product_Name, SUM(oi.Quantity) AS Quantity_Sold, DENSE_RANK() OVER (PARTITION BY c.Category_Name ORDER BY SUM(oi.Quantity) DESC) AS Ranking, c.Category_Name
FROM OrderedItems oi
INNER JOIN Products p ON oi.Product_ID = p.Product_ID
INNER JOIN Categories c ON p.Category_ID = c.Category_ID
GROUP BY p.Product_Name, c.Category_Name
ORDER BY c.Category_Name, Ranking)

SELECT * FROM ranking_per_cat 
WHERE Ranking=1;

-- Query #9 " It looks like our system detected that some bot accounts have been created. Their emails have been marked with BOT. Delete them immediately!"

-- Finding the bot accounts
SELECT * FROM Customers
WHERE Email LIKE '%BOT%';

-- Deleting the accounts
DELETE FROM Customers
WHERE Email LIKE '%BOT%';

-- Query #10 " Can you show us the difference between each order’s total amount and the largest one?"
SELECT CONCAT(First_Name,' ', Last_Name) AS Full_Name, Total_Amount  Highest_Value, 
Total_Amount-FIRST_VALUE(Total_Amount) OVER(ORDER BY Total_Amount DESC) AS Difference 
FROM Orders o
INNER JOIN Customers c ON o.Customer_ID=c.Customer_ID;

-- Query #11 " Which products still have at least 40 units in stock after accounting for all sales, so we can hold off on restocking them?"
SELECT  Product_Name, SUM(Quantity) AS Amount_Bought, Stock, Stock-SUM(Quantity) AS Remaining_Stock FROM Products p
INNER JOIN OrderedItems oi ON p.Product_ID= oi.Product_ID
GROUP BY Product_Name, Stock
HAVING Remaining_Stock>=40;

-- Query #12 " Can you show us the average product price in each category? Please round to 2 decimals."
SELECT c.Category_Name, ROUND(AVG(Price),2) AS Average_Price FROM Products p
INNER JOIN Categories c ON p.Category_ID=c.Category_ID
GROUP BY c.Category_Name;

-- Query #13 "Can you track the cumulative total revenue over time so we can visualize our sales growth?"
SELECT Order_ID, Customer_ID, Order_Date, Total_Amount,
 SUM(Total_Amount) OVER(ORDER BY Order_Date ASC) AS Running_Sum FROM Orders;

-- Query #14 " "Can you classify customers as 'High Value' or 'Normal' based on whether their order total exceeds the average order amount?"
SELECT First_Name, Last_Name, Total_Amount,
CASE 
WHEN Total_Amount>
(SELECT AVG(Total_Amount) FROM Orders) THEN 'High Value Customer'
WHEN Total_Amount<
(SELECT AVG(Total_Amount) FROM Orders) THEN 'Normal Customer'
END AS Clasification
 FROM Customers c
INNER JOIN Orders o on c.Customer_ID=o.Customer_ID