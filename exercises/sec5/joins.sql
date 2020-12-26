SELECT 
    a.emp_no,
    CONCAT(a.first_name, ' ' ,a.last_name) AS "name",
    b.salary,
    COALESCE(c.title, 'No title change') AS "Title change",
    COALESCE(c.from_date::TEXT, '-') AS "title taken on"
FROM employees AS a
INNER JOIN salaries AS b ON a.emp_no = b.emp_no
LEFT JOIN titles AS c ON c.emp_no = a.emp_no 
    AND (c.from_date = b.from_date OR c.from_date = b.from_date + INTERVAL '2 days')
WHERE c.title IS NOT NULL
ORDER BY a.emp_no

/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

SELECT *
FROM orders AS o
INNER JOIN customers AS c ON c.customerid = o.customerid
WHERE state IN ('OH', 'NY', 'OR');


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/

SELECT *
FROM inventory AS i
INNER JOIN products AS p
    ON i.prod_id = p.prod_id

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/

SELECT 
    emp_no,
    CONCAT(first_name, ' ', last_name) AS "name",
    hire_date,
    dept_no,
    from_date,
    to_date
FROM employees AS emp
INNER JOIN dept_emp AS demp
    ON demp.emp_no = emp.emp_no

