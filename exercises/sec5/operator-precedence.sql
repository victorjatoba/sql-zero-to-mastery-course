-- Select people either under 30 or over 50 with an income above 50000 that are from either Japan or Australia
SELECT customerid, income, country, age 
FROM customers
WHERE income > 50000
    AND (country = 'Japan' OR country = 'Australia')
    AND (age < 30 OR age >= 50)

-- What was our total sales in June of 2004 for orders over 100 dollars?
SELECT SUM( totalamount )
FROM orders 
WHERE totalamount >= 100
    AND (orderdate >= '2004-06-01' AND orderdate <= '2004-06-30')
