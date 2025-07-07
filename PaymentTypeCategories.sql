-- DISTRIBUTION BY PAYMENT TYPE

SELECT
    DATEPART(YEAR, DATE_) AS YEAR,                -- Extracts the year from the order date and names it "YEAR"
    DATEPART(MONTH, DATE_) AS MONTH,               -- Extracts the month from the order date and names it "MONTH"

    CASE
        WHEN PAYMENTTYPE = 1 THEN 'CREDIT CARD'           -- If PAYMENTTYPE is 1, show as "CREDIT CARD"
        WHEN PAYMENTTYPE = 2 THEN 'BANK TRANSFER'          -- If PAYMENTTYPE is 2, show as "BANK TRANSFER"
    END AS PAYMENT_TYPE_DESCRIPTION,               -- The CASE result is named "PAYMENT_TYPE_DESCRIPTION"

    SUM(PAYMENTTOTAL) AS TOTAL_AMOUNT               -- Calculates the total payment amount for the same year, month, and payment type

FROM PAYMENTS                                      -- Data is taken from the "PAYMENTS" table

-- Grouped by year, month, and payment type (to get totals)
GROUP BY
    DATEPART(MONTH, DATE_),
    DATEPART(YEAR, DATE_),
    PAYMENTTYPE

-- Orders results first by month, then by year (e.g., January appears at the top)
ORDER BY
    DATEPART(MONTH, DATE_),
    DATEPART(YEAR, DATE_)
