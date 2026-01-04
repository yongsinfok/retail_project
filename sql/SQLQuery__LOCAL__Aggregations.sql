-- A. Aggregate products by category

-- Create & Fill table
DROP TABLE IF EXISTS agg_sales_by_category;
CREATE TABLE agg_sales_by_category (
    product_category      VARCHAR(MAX),
    total_sales           DECIMAL(18,4),
    avg_price             DECIMAL(18,4),
    num_orders            INT
);

INSERT INTO agg_sales_by_category
SELECT
		p.product_category AS product_category,
		SUM(s.SALES) AS total_sales,
		AVG(s.PRICEEACH) AS avg_price,
		COUNT(DISTINCT s.ORDERNUMBER) AS num_orders
	FROM dbo.sales_data_raw s
		 JOIN dbo.products_raw p
		 ON s.PRODUCTCODE = p.product_id
	GROUP BY p.product_category

UPDATE agg_sales_by_category
SET product_category = REPLACE(product_category, ' ', '_');

-------------------------------------------
-- B. Aggregate by product size and country

-- Create & Fill table
DROP TABLE IF EXISTS agg_sales_by_country;
CREATE TABLE agg_sales_by_country (
    country      NVARCHAR(50),
    DEALSIZE     NVARCHAR(50),
    total_sales  DECIMAL(18,4),
    num_orders   INT
);

INSERT INTO agg_sales_by_country
SELECT 
    c.country,
    s.DEALSIZE,
    SUM(s.SALES) AS total_sales,
    COUNT(DISTINCT s.ORDERNUMBER) AS num_orders
FROM dbo.sales_data_raw s
JOIN dbo.customers_raw c
  ON s.customer_id = c.customer_id
GROUP BY c.country, s.DEALSIZE;

-------------------------------------------
-- C. Aggregate by product and year

-- transform ORDERDATE data type to DATE

ALTER TABLE sales_data_raw
ADD ORDERDATE_CONVERTED DATE;

UPDATE sales_data_raw
SET ORDERDATE_CONVERTED = TRY_CONVERT(DATE, ORDERDATE, 101);

ALTER TABLE sales_data_raw
DROP COLUMN ORDERDATE;

EXEC sp_rename 'sales_data_raw.ORDERDATE_CONVERTED', 'ORDERDATE', 'COLUMN';
-------

-- Create & Fill table
DROP TABLE IF EXISTS agg_sales_by_year;
CREATE TABLE agg_sales_by_year (
    year				 INT,
    product_category     VARCHAR(MAX),
    total_sales			 DECIMAL(18,4)
);

INSERT INTO agg_sales_by_year
SELECT 
    YEAR(s.ORDERDATE) AS year,
    p.product_category,
    SUM(s.SALES) AS total_sales
FROM dbo.sales_data_raw s
JOIN dbo.products_raw p
  ON s.PRODUCTCODE = p.product_id
GROUP BY YEAR(s.ORDERDATE), p.product_category;

UPDATE agg_sales_by_year
SET product_category = REPLACE(product_category, ' ', '_');

-- Export to JSON File
SELECT *
FROM agg_sales_by_year
FOR JSON AUTO, ROOT('agg_sales_by_year');



SELECT * FROM dbo.agg_sales_by_country
SELECT @@SERVERNAME;
