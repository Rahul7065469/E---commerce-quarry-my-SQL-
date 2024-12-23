create database if not exists ecommerce2;
use ecommerce2

  -- **Total Revenue by Product Category**  
--    _"What is the total revenue generated from each product category ?"
create view  total_revenue_generated as (
SELECT 
    Product_Category,
    SUM(Sales) AS Total_Revenue
FROM 
    sales
GROUP BY 
    Product_Category
ORDER BY 
    Total_Revenue DESC);
    
-- **Best-Selling Products**  
--    _"What are the top 5 best-selling products in terms of sales value?"
CREATE VIEW 5_best_selling_product AS
    (SELECT 
        product, SUM(sales) sales
    FROM
        sales
    GROUP BY product
    ORDER BY sales DESC
    LIMIT 5);

--  **Gender-Based Revenue Analysis**  
--    _"What is the total revenue generated by male and female customers for the 'Auto & Accessorie
-- s' product category?"
SELECT 
    Gender,
    SUM(Sales) AS Total_Revenue
FROM 
    sales
WHERE 
    Product_Category = 'Auto & Accessories'
GROUP BY 
    Gender
ORDER BY 
    Total_Revenue DESC;

--  **Customer Purchase Frequency**  
--    _"Which customers made the most purchases, and how much did they spend in total?"
SELECT 
    Customer_Id, 
     
    SUM(Sales) AS Total_Spent
FROM 
    sales
GROUP BY 
    Customer_Id
ORDER BY 
    Total_Spent DESC
LIMIT 10;


--  **Average Discount Given per Product**  
--    _"What is the average discount given on each product?"_
SELECT 
    Product, 
    ROUND(AVG(Discount), 2) AS avg_discount 
FROM 
    sales
GROUP BY 
    Product;

    
-- **Shipping Cost Analysis**  
--    _"What is the average shipping cost per product in the 'Auto & Accessories' category ?"_


SELECT 
    product, ROUND(AVG(shipping_cost), 2) avg_ship_cost
FROM
    sales
WHERE
    product_category = 'Auto & Accessories'
GROUP BY product;

-- Profit by Payment Method**  
--    _"What is the total profit generated by each payment method used by customers?"
SELECT 
    payment_method, ROUND(SUM(profit), 2) total_profit
FROM
    sales
GROUP BY payment_method;



-- **Customer Gender vs Product Preference**  
--    _"Which products were most preferred by male and female customers _ 
SELECT 
    Gender,
    Product,
    COUNT(*) AS Purchase_Count
FROM 
    sales
GROUP BY 
    Gender, Product
ORDER BY 
    Gender, Purchase_Count DESC;

-- Top Products by Quantity Sold**  
--     _"Which 5 products had the highest quantity sold ?"_
 
SELECT 
    product, SUM(quantity) sum_quantity
FROM
    sales
GROUP BY product
ORDER BY sum_quantity
LIMIT 5;

-- Discount and Profit Analysis**  
--     _"Is there any correlation between the discount given and the profit generated for each product?"_

SELECT 
    Product,
    round(AVG(Discount),2) AS Average_Discount,
    round(avg(Profit),2) AS Average_Profit
FROM 
    sales
GROUP BY 
    Product
ORDER BY 
    Average_Discount desc;
    
-- Customer Login Type Impact on Sales**  
-- "How do customer login types (Guest vs Member) impact the total revenue and quantity of products sold?"
SELECT 
    Customer_Login_type,
    SUM(Sales * Quantity) AS Total_Revenue,
    SUM(Quantity) AS Total_Quantity
FROM 
    sales
GROUP BY 
    Customer_Login_type
ORDER BY 
    Total_Revenue DESC;
    
-- Top Selling Products per Month**  
-- Which products were the top sellers each month _
SELECT 
    MONTH(Date) AS Month,
    Product,
    SUM(Sales * Quantity) AS Total_Sales
FROM 
    sales
GROUP BY 
 MONTH, Product 
ORDER BY 
 Month, Total_Sales ;

 -- Revenue from Critical vs High Order Priority**  
--     _"What is the total revenue generated from orders with aging"_

SELECT 
    Aging, ROUND(SUM(sales * quantity), 2) total_revenue
FROM
    sales
GROUP BY Aging
ORDER BY aging;


