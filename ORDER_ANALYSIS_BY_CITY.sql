SELECT
-- O.ID AS ORDERID,                        -- Unique ID for each order
-- O.DATE_ AS ORDERDATE,                   -- Date when the order was placed
-- I.DATE_ AS INVOICEDATE,                 -- Date when the invoice was issued

-- DATEPART(YEAR,O.DATE_) AS YEAR,         -- Year of the order
-- DATEPART(MONTH,O.DATE_) AS MONTH,       -- Month of the order
-- DATEPART(HOUR,O.DATE_) AS HOUR,         -- Hour of the order

CT.CITY,                                  -- City name
AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS AVERAGE_ORDER_DURATION, -- Average order duration (in hours)
MIN(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS SHORTEST_DELIVERY_TIME_HOURS, -- Shortest delivery time
MAX(DATEDIFF(HOUR,O.DATE_,I.DATE_)) AS LONGEST_DELIVERY_TIME_HOURS,  -- Longest delivery time
SUM(O.TOTALPRICE) AS TOTAL_ORDER_AMOUNT,                          -- Total order amount per city
COUNT(O.ID) AS TOTAL_ORDERS                                       -- Total number of orders in the city

FROM ORDERS O
    INNER JOIN USERS U ON U.ID = O.USERID                   -- Information of the user who placed the order
    INNER JOIN ADDRESS A ON A.ID = O.ADDRESSID              -- Address where the order is delivered
    INNER JOIN CITIES CT ON CT.ID = A.CITYID                -- City information corresponding to the address
    INNER JOIN TOWNS T ON T.ID = A.TOWNID                    -- District information (not used but joined)
    INNER JOIN DISTRICTS D ON D.ID = A.DISTRICTID            -- Neighborhood information (not used but joined)
    INNER JOIN PAYMENTS P ON P.ORDERID = O.ID                -- Payment information for the order
    INNER JOIN INVOICES I ON I.ORDERID = O.ID                -- Invoice information related to the order

GROUP BY CT.CITY                                              -- Grouping data by city

-- DATEPART(YEAR,O.DATE_), DATEPART(MONTH,O.DATE_), DATEPART(HOUR,O.DATE_) -- Can be used for time-based grouping (currently commented out)
-- HAVING AVG(DATEDIFF(HOUR,O.DATE_,I.DATE_)) >= 34           -- Filtering orders with average delivery time greater than 34 hours (currently disabled)

ORDER BY 6 DESC                                               -- Orders results descending by TOTAL_ORDER_AMOUNT column
