-- Sales Data Analysis Project

/*SELECT * FROM [Sales Data];

SELECT YEAR(Order_Date) AS timeperiod, COUNT(Order_Date)
FROM [Sales Data]
GROUP BY YEAR(Order_Date);


SELECT Order_Date
FROM [Sales Data]
WHERE YEAR(Order_Date) = 2020
ORDER BY 1 DESC;
*/

-- What is the total sales revenue for a specific time period?

SELECT ROUND(SUM(Sales),0) 
FROM [Sales Data]
WHERE Order_Date BETWEEN '2019-01-01' AND '2019-12-31';

SELECT ROUND(SUM(Sales),0)
FROM [Sales Data]
WHERE Order_Date BETWEEN '2020-01-01' AND '2020-12-31';


-- Average sales per month
SELECT YEAR(Order_Date) AS OrderYear, 
    MONTH(Order_Date) AS OrderMonth, 
    AVG(sales) AS AvgSales
FROM [Sales Data]
GROUP BY YEAR(Order_Date), MONTH(Order_Date)
ORDER BY 3 DESC;

SELECT Month, AVG(sales) AS AvgSales
FROM [Sales Data]
GROUP BY Month
ORDER BY 2 DESC;

-- Identifying top-selling products/Which products have the highest sales volume?

SELECT product, ROUND(SUM(sales),0) AS total_sales
FROM [Sales Data]
GROUP BY product
ORDER BY 2 DESC
LIMIT 10;

-- What is the average order value(AOV= Total Revenue/Total Orders) by city?
   -- On average, how much customers are spending per order by city

SELECT city, ROUND(SUM(sales)/COUNT(*),0) AS AOV 
FROM [Sales Data]
GROUP BY city
ORDER BY 2 DESC

-- Total sales by city

SELECT city, ROUND(SUM(sales),0) AS Total_sales
FROM [Sales Data]
GROUP BY city
ORDER BY 2 DESC

-- Quarterly sales and quarterly sales for each year

SELECT DATEPART(quarter, Order_Date) AS TimePeriod, ROUND(SUM(Sales),0) AS TotalSales
FROM [Sales Data]
GROUP BY DATEPART(quarter, Order_Date);

SELECT DATEPART(quarter, Order_Date) AS TimePeriod, ROUND(SUM(Sales),0) AS TotalSales
FROM [Sales Data]
WHERE YEAR(Order_Date) = 2019
GROUP BY DATEPART(quarter, Order_Date);

SELECT DATEPART(quarter, Order_Date) AS TimePeriod, ROUND(SUM(Sales),0) AS TotalSales
FROM [Sales Data]
WHERE YEAR(Order_Date) = 2020
GROUP BY DATEPART(quarter, Order_Date);


-- Products often sold/bought together

SELECT a.product AS product1, b.product AS product2, COUNT(*) AS frequency
FROM [Sales Data] a 
JOIN [Sales Data] b 
ON a.Order_ID = b.Order_ID AND a.product < b.product
GROUP BY a.product, b.product
ORDER BY COUNT(*) DESC

-- checking above formula with specific products
SELECT a.Order_ID, a.product AS product1, b.product AS product2
FROM [Sales Data] a 
JOIN [Sales Data] b 
ON a.Order_ID = b.Order_ID AND a.product < b.product
WHERE a.product = 'USB-C Charging Cable' AND b.product = 'Wired Headphones'


SELECT a.Order_ID, a.product AS product1, b.product AS product2
FROM [Sales Data] a 
JOIN [Sales Data] b 
ON a.Order_ID = b.Order_ID AND a.product < b.product
WHERE a.product = 'Apple Airpods Headphones' AND b.product = 'LG Washing Machine'


