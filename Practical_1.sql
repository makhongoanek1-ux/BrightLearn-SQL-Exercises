------------------------------------------------------------------
--Q1. Display all columns for all transactions. 
--Expected output: All columns

SELECT*
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q2. Display only the Transaction ID, Date, and Customer ID for all records. 
--Expected output: Transaction ID, Date, Customer ID

SELECT TRANSACTION_ID,
       DATE,
       CUSTOMER_ID
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q3.  Display all the distinct product categories in the dataset. 
--Expected output: Product Category

SELECT DISTINCT PRODUCT_CATEGORY
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q4. Display all the distinct gender values in the dataset. 
--Expected output: Gender 

SELECT DISTINCT GENDER
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q5. Display all transactions where the Age is greater than 40. 
--Expected output: All columns 

SELECT *
FROM practical_1.dataset.retail_sales
WHERE AGE > 40;

------------------------------------------------------------------
--Q6. Display all transactions where the Price per Unit is between 100 and 500. 
--Expected output: All columns 

SELECT *
FROM practical_1.dataset.retail_sales
WHERE PRICE_PER_UNIT BETWEEN 100 AND 500;

------------------------------------------------------------------
--Q7. Display all transactions where the Product Category is either 'Beauty' or 'Electronics'. 
--Expected output: All columns 

SELECT *
FROM practical_1.dataset.retail_sales
WHERE PRODUCT_CATEGORY IN ('Beauty', 'Electronics');

------------------------------------------------------------------
--Q8. Display all transactions where the Product Category is not 'Clothing'. 
--Expected output: All columns 

SELECT *
FROM practical_1.dataset.retail_sales
WHERE PRODUCT_CATEGORY NOT IN ('Clothing');

------------------------------------------------------------------
--Q9. Display all transactions where the Quantity is greater than or equal to 3. 
--Expected output: All columns

SELECT *
FROM practical_1.dataset.retail_sales
WHERE quantity >= 3;

------------------------------------------------------------------
--Q10. Count the total number of transactions. 
--Expected output: Total_Transactions 

SELECT COUNT(*) AS Total_Transactions 
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q11. Find the average Age of customers. 
--Expected output: Average_Age

SELECT AVG(Age) AS Average_Age
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q12. Find the total quantity of products sold. 
--Expected output: Total_Quantity 

SELECT SUM(Quantity) AS Total_Quantity 
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q13. Find the maximum Total Amount spent in a single transaction. 
--Expected output: Max_Total_Amount 

SELECT MAX(Total_Amount) AS Max_Total_Amount 
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q14. Find the minimum Price per Unit in the dataset. 
--Expected output: Min_Price_per_Unit

SELECT MIN(Price_Per_Unit) AS Min_Price_per_Unit 
FROM practical_1.dataset.retail_sales;

------------------------------------------------------------------
--Q15. Find the number of transactions per Product Category. 
--Expected output: Product Category, Transaction_Count 

SELECT Product_Category,
       COUNT(Transaction_ID) AS Transaction_Count
FROM practical_1.dataset.retail_sales
GROUP BY Product_Category;

------------------------------------------------------------------
--Q16. Find the total revenue (Total Amount) per gender. 
--Expected output: Gender, Total_Revenue 

SELECT Gender,
       SUM(Price_per_Unit * Quantity) AS Total_Revenue
FROM practical_1.dataset.retail_sales
GROUP BY Gender;   

------------------------------------------------------------------
--Q17. Find the average Price per Unit per product category. 
--Expected output: Product Category, Average_Price

SELECT Product_Category,
       AVG(Price_per_Unit) AS Average_Price
FROM practical_1.dataset.retail_sales
GROUP BY Product_Category;

------------------------------------------------------------------
--Q18. Find the total revenue per product category where total revenue is greater than 10,000. 
--Expected output: Product Category, Total_Revenue 

SELECT Product_Category,
       SUM(Price_per_Unit * Quantity) AS Total_Revenue
FROM practical_1.dataset.retail_sales
GROUP BY Product_Category
HAVING Total_Revenue > 10000;

------------------------------------------------------------------
--Q19. Find the average quantity per product category where the average is more than 2. 
--Expected output: Product Category, Average_Quantity 

SELECT Product_Category,
       AVG(Quantity) AS Average_Quantity
FROM practical_1.dataset.retail_sales
GROUP BY Product_Category
HAVING Average_Quantity > 2;

------------------------------------------------------------------
--Q20. Display a column called Spending_Level that shows 'High' if Total Amount > 1000, otherwise 'Low'. 
--Expected output: Transaction ID, Total Amount, Spending_Level 

SELECT Transaction_ID, 
       Total_Amount,
CASE WHEN Total_Amount > 1000 THEN 'High'
ELSE 'Low'
END AS Spending_Level 
FROM practical_1.dataset.retail_sales;
