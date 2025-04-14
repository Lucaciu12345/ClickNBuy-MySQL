/* 3.
======================================================================================================================================================
Now onto the next and last step : Implementing Views(Virtual Tables) for more efficient and reusable queries, that are likely to be the most commonly requested.
======================================================================================================================================================
																								                                                     */

-- View #1 Yearly-Monthly-Revenue: Contains the total revenue grouped by both year and month.
CREATE OR REPLACE VIEW Yearly_Monthly_Revenue AS(
SELECT YEAR(Order_Date) AS Year, MONTHNAME(Order_Date) AS Month, SUM(Total_Amount) AS Total_Revenue
FROM Orders
GROUP BY Year, Month
);     

-- View #2 Product-Details: Combines category names with product details.
    CREATE OR REPLACE VIEW Product_Details AS
    (SELECT c.Category_ID, c.Category_Name, Description, Product_ID, Product_Name, Price, Stock FROM Categories c
    INNER JOIN Products p ON c.Category_ID=p.Category_ID);
    
-- View #3 Products-With-Buyers: Reflects each product along with the customer who bought it.
CREATE OR REPLACE VIEW Products_With_Buyers AS(
SELECT Product_Name, CONCAT(First_Name, ' ', Last_Name) AS Full_Name FROM Customers c
INNER JOIN Orders o on c.Customer_ID=o.Customer_ID
INNER JOIN OrderedItems oi ON oi.Order_ID=o.Order_ID
INNER JOIN Products p ON p.Product_ID=oi.Product_ID
ORDER BY Product_Name
);