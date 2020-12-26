/*
* DB: Employees
* Table: employees
* Question: Get me all the employees above 60, use the appropriate date functions
*/

SELECT age(birth_date), * FROM employees
WHERE age(birth_date) >= INTERVAL '61 years'
ORDER BY age(birth_date)

SELECT age(birth_date), * FROM employees
WHERE (EXTRACT (YEAR FROM age(birth_date)) > 60)
ORDER BY age(birth_date)

SELECT * FROM employees
WHERE birth_date < now() - INTERVAL '61 years'
ORDER BY age(birth_date)
/*
* DB: Employees
* Table: employees
* Question: How many employees where hired in February?
*/

SELECT * FROM employees
WHERE EXTRACT('month' FROM hire_date) = 2;

/*
* DB: Employees
* Table: employees
* Question: How many employees were born in november?
*/

SELECT * FROM employees
WHERE EXTRACT(MONTH FROM birth_date) = 11;

/*
* DB: Employees
* Table: employees
* Question: Who is the oldest employee? (Use the analytical function MAX)
*/

SELECT age(birth_date), * FROM employees
WHERE age(birth_date) = (
SELECT MAX(age(birth_date)) FROM employees
)

/*
* DB: Store
* Table: orders
* Question: How many orders were made in January 2004?
*/

SELECT count( * ) FROM orders
WHERE orderdate >= date '2004-01-01' AND orderdate <= date '2004-01-31'

SELECT count(orderid) FROM orders
WHERE DATE_TRUNC('month', orderdate) = date '2004-01-01'