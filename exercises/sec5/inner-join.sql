
/*
* DB: Store
* Table: orders
* Question: Get all orders from customers who live in Ohio (OH), New York (NY) or Oregon (OR) state
* ordered by orderid
*/

select *
from orders AS o
INNER JOIN customers AS c ON c.customerid = o.customerid
WHERE state IN ('OH', 'NY', 'OR');


/*
* DB: Store
* Table: products
* Question: Show me the inventory for each product
*/

SELECT *
FROM inventory as i
inner JOIN products as p
    ON i.prod_id = p.prod_id

/*
* DB: Employees
* Table: employees
* Question: Show me for each employee which department they work in
*/

SELECT 
    CONCAT(e.first_name, ' ', e.last_name), d.dept_name
FROM departments as d
INNER JOIN dept_emp as de on de.dept_no = d.dept_no
INNER JOIN employees as e on e.emp_no = de.emp_no