-- List products with sales count at least 4 and calculate total price for each
SELECT ITEMNAME, SUM(UNITPRICE) AS TOTAL_PRICE, COUNT(*) AS SALES_COUNT
FROM ITEMS
GROUP BY ITEMNAME
HAVING COUNT(*) >= 4
ORDER BY SALES_COUNT DESC;

-- SUM() function is used to add up values in a column over a dataset.

-- Count the number of sales per product (most sold products)
SELECT ITEMNAME, COUNT(ITEMCODE) AS QUANTITY
FROM ITEMS
GROUP BY ITEMNAME
ORDER BY QUANTITY DESC;

-- Example: to find the best-selling products, use COUNT to count records.

-- Get country, user full name, and order date
SELECT
    COUNTRIES.COUNTRY AS COUNTRY,
    USERS.NAMESURNAME AS FULL_NAME,
    ORDERS.DATE_ AS ORDER_DATE
FROM ORDERS
JOIN USERS ON ORDERS.USERID = USERS.ID
JOIN COUNTRIES ON USERS.COUNTRYID = COUNTRIES.ID;

-- Set COUNTRYID to NULL for a user with specific ID
UPDATE USERS
SET COUNTRYID = NULL
WHERE ID = '9679';

-- Delete user with specific ID
DELETE FROM USERS
WHERE ID = '9679';

-- Select all users
SELECT * FROM USERS;

-- Select all cities
SELECT * FROM CITIES;
