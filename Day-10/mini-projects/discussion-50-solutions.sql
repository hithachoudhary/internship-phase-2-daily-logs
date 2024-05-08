-- Part 1: Understanding GROUP BY and Aggregate Functions

-- 1.1 Product Performance Analysis: Generate a report showing the total sales per product line. Include the product line, the total number of products sold, and the total sales amount.
select p.productLine,sum(od.quantityOrdered) as total_sold_products,sum(od.quantityOrdered * od.priceEach) as toatl_sales_amt from orderDetails od,products p where od.productCode = p.productCode group by p.productLine;

-- 1.2 Office Sales Analysis: Determine the total sales for each office, including office city, number of orders processed, and total sales amount.
select o.city as office_city,count(o.officeCode) as number_of_orders_processed,sum(od.quantityOrdered*od.priceEach) as total_sales_amt from offices o join employees e on o.officeCode=e.officeCode join customers c on e.employeeNumber=c.salesRepEmployeeNumber join orders ord on c.customerNumber=ord.customerNumber join orderdetails od ON ord.orderNumber=od.orderNumber group by o.city;

-- 1.3 Total Quantity Sold by Product Line: Determine the total quantity sold for each product line.
select productLine,sum(quantityOrdered) as total_quantity_sold from orderdetails join products using(productCode) group by productLine;

-- Part 2: Filtering with HAVING Clause

-- 2.1 High-Value Order Analysis: Identify offices with an average order value greater than a certain threshold. Include office city, average order value, and total number of orders.
select productLine,avg(quantityOrdered*priceEach) as average_sale_amount from orderdetails join products using(productCode) group by productLine having avg(quantityOrdered*priceEach)<3000;

-- 2.2 Product Line Performance Filter: Filter product lines that have an average product sale price above a specific value.
select o.city as officeCity, avg(od.quantityOrdered*od.priceEach) as average_order_value,count(od.orderNumber) as no_of_orders from offices o join employees e using(officeCode) join customers c on e.employeeNumber=c.salesRepEmployeeNumber join orders ods using(customerNumber) join orderdetails od using(orderNumber) group by o.city having avg(od.quantityOrdered*od.priceEach)>2000;

-- 2.3 Product Line Performance Filter: Filter product lines that have an average product sale price above a specific value.
select productLine, avg(MSRP) as average_productSale_price from products group by productLine having avg(MSRP)>100;

-- Part 3: Complex Aggregations and Grouping

-- 3.1 Continent Analysis: For each continent, find the average population and total GDP. Filter out continents with an average population below a certain threshold.
select continent,avg(population) as average_population,sum(GNP) as total_GDP from country group by continent;
select continent,avg(population) as average_population from country group by continent having avg(population)<15000000;

-- 3.2 Language Diversity: Identify countries with more than a specific number of official languages and display the country name, number of official languages, and total population.
select name as countryName, count(IsOfficial='T') as no_of_official_languages, sum(population) as total_population from country join countrylanguage on country.code=countrylanguage.CountryCode group by name having count(IsOfficial='T')>10;

-- Part 4: Advanced Scenario - Time Series Analysis

-- 4.1 Monthly Sales Growth: Calculate the month-over-month sales growth percentage for each product line.


-- 4.2 Seasonal Effect Analysis: Identify quarters with significantly higher sales for each office and investigate possible reasons.
