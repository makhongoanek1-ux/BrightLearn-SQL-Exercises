----------------------------------------------------------------------------------
--1. INNER JOIN: Orders with Customer and Product Names 
--Question: List all orders along with the customer name and product name. 
--Expected Output Columns: OrderID, OrderDate, CustomerName, ProductName, Quantity

SELECT OrderID, OrderDate, CustomerName, ProductName, Quantity 
FROM practical_2.dataset.orders_large AS A
INNER JOIN practical_2.dataset.products_large AS B
ON A.PRODUCTID = B.PRODUCTID
INNER JOIN practical_2.dataset.customers_large AS C
ON A.CustomerID = C.CustomerID;

----------------------------------------------------------------------------------
--2. INNER JOIN: Customers Who Placed Orders
--Question: Which customers have placed at least one order? 
--Expected Output Columns:CustomerID, CustomerName, Country, OrderID, OrderDate

SELECT B.CustomerID, B.CustomerName, B.Country, A.OrderID, A.OrderDate 
FROM practical_2.dataset.orders_large AS A
INNER JOIN practical_2.dataset.customers_large AS B
ON A.CUSTOMERID = B.CUSTOMERID;

----------------------------------------------------------------------------------
--3. LEFT JOIN: All Customers and Their Orders 
--Question: List all customers and any orders they might have placed. Include customers who have not placed any orders. 
--Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT B.CustomerID, B.CustomerName, B.Country, A.OrderID, A.OrderDate, A.ProductID, A.Quantity
FROM practical_2.dataset.orders_large AS A
LEFT JOIN practical_2.dataset.customers_large AS B
ON A.CUSTOMERID = B.CUSTOMERID;

----------------------------------------------------------------------------------
--4. LEFT JOIN: Product Order Count 
--Question: List all products and how many times each was ordered (if any). 
--Expected Output Columns: ProductID, ProductName, TotalOrders (TotalOrders is the count of how many times the product appears in orders)

SELECT B. ProductID, B. ProductName,
COUNT(OrderID) AS TotalOrders 
FROM practical_2.dataset.products_large AS B
LEFT JOIN practical_2.dataset.orders_large AS A
ON A.ProductID = B.ProductID
GROUP BY B.ProductID, B.ProductName;

----------------------------------------------------------------------------------
--5. RIGHT JOIN: Orders with Product Info (Include Products Not Ordered) 
--Question: Find all orders along with product details, including any products that might not have been ordered. 
--Expected Output Columns: OrderID, OrderDate, ProductID, ProductName, Price, Quantity 

SELECT O.OrderID, O.OrderDate, P.ProductID, P.ProductName, P.Price, O.Quantity
FROM practical_2.dataset.orders_large AS O
RIGHT JOIN practical_2.dataset.products_large AS P
ON O.ProductID = P.ProductID;

--------------------------------------------------------------------------------
--6. RIGHT JOIN: Customer Info with Orders (Include All Customers) 
--Question: Which customers have made orders, and include customers even if they have never placed an order. 
--Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity 

SELECT C.CustomerID, C.CustomerName, C.Country, O.OrderID, O.OrderDate, O.ProductID, O.Quantity
FROM practical_2.dataset.customers_large AS C
LEFT JOIN practical_2.dataset.orders_large AS O
ON C.CustomerID = O.CustomerID;

--------------------------------------------------------------------------------
--7. FULL OUTER JOIN: All Customers and All Orders 
--Question: List all customers and orders, showing NULLs where customers have not ordered or where orders have no customer info. 
--Expected Output Columns: CustomerID, CustomerName, Country, OrderID, OrderDate, ProductID, Quantity

SELECT C.CustomerID, C.CustomerName, C.Country, O.OrderID, O.OrderDate, O.ProductID, O.Quantity
FROM practical_2.dataset.customers_large AS C
FULL OUTER JOIN practical_2.dataset.orders_large AS O
ON C.CustomerID = O.CustomerID;

--------------------------------------------------------------------------------
--8. FULL OUTER JOIN: All Products and Orders 
--Question: List all products and orders, showing NULLs where products were never ordered or orders are missing product info. 
--Expected Output Columns: ProductID, ProductName, Price, OrderID, OrderDate, CustomerID, Quantity

SELECT B.ProductID, B.ProductName, B.Price, A.OrderID, A.OrderDate, A.CustomerID, A.Quantity
FROM practical_2.dataset.products_large AS B
FULL OUTER JOIN practical_2.dataset.orders_large AS A
ON B.ProductID = A.ProductID;
