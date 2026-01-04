-- 1. Create Sales table and fill it with csv file from Kaggle

IF OBJECT_ID('dbo.sales_data_raw','U') IS NOT NULL
  DROP TABLE dbo.sales_data_raw;
GO

CREATE TABLE dbo.sales_data_raw (
  ORDERNUMBER        NVARCHAR(50),
  QUANTITYORDERED    INT,
  PRICEEACH          DECIMAL(18,4),
  ORDERLINENUMBER    INT,
  SALES              DECIMAL(18,4),
  ORDERDATE          NVARCHAR(50),    -- 1st import; changed to DATE later
  STATUS             NVARCHAR(50),
  QTR_ID             INT,
  MONTH_ID           INT,
  YEAR_ID            INT,
  PRODUCTLINE        NVARCHAR(200),
  MSRP               DECIMAL(18,4),
  PRODUCTCODE        NVARCHAR(100),
  CUSTOMERNAME       NVARCHAR(255),
  PHONE              NVARCHAR(100),
  ADDRESSLINE1       NVARCHAR(255),
  ADDRESSLINE2       NVARCHAR(255),
  CITY               NVARCHAR(100),
  STATE              NVARCHAR(100),
  POSTALCODE         NVARCHAR(50),
  COUNTRY            NVARCHAR(100),
  TERRITORY          NVARCHAR(100),
  CONTACTLASTNAME    NVARCHAR(100),
  CONTACTFIRSTNAME   NVARCHAR(100),
  DEALSIZE           NVARCHAR(50)
);
GO


BULK INSERT dbo.sales_data_raw
FROM 'C:\Users\Eros\Documents\__Proyecto Integral__Retail\data from Kaggle\sales_data_sample_v2.csv'
WITH (
  FIRSTROW = 2,
  FIELDTERMINATOR = ',',
  ROWTERMINATOR = '0x0a',
  CODEPAGE = '65001'  -- using UTF-8; if problems it could be used '1252' (latin1)
);
GO

-- adding a customer_id as a new column
ALTER TABLE sales_data_raw ADD customer_id INT;

UPDATE s
SET s.customer_id = c.customer_id
FROM sales_data_raw s
JOIN customers_aux c
  ON s.CUSTOMERNAME = c.customerName
 AND s.CONTACTFIRSTNAME = c.first_name
 AND s.CONTACTLASTNAME  = c.last_name
 AND s.PHONE = c.phone;



-- 2. Create Customers table and fill it with JSON file (created from Sales table)

IF OBJECT_ID('dbo.customers_raw','U') IS NOT NULL
  DROP TABLE dbo.customers_raw;
GO

CREATE TABLE dbo.customers_raw (
    customer_id INT,
    customer_name NVARCHAR(100),
    contact_firstname NVARCHAR(50),
    contact_lastname NVARCHAR(50),
    phone NVARCHAR(50),
    address NVARCHAR(100),
    city NVARCHAR(50),
    state NVARCHAR(50),
    postal_code NVARCHAR(20),
    country NVARCHAR(50),
    credit_limit FLOAT
);

DECLARE @json NVARCHAR(MAX);

SELECT @json = BulkColumn
FROM OPENROWSET(
    BULK 'C:\Users\Eros\Documents\__Proyecto Integral__Retail\data_from_JSON\customers.json',
    SINGLE_CLOB
) AS x;

INSERT INTO dbo.customers_raw (
    customer_id, customer_name, contact_firstname, contact_lastname,
    phone, address, city, state, postal_code, country, credit_limit
)
SELECT 
    JSON_VALUE(value, '$.customer_id') AS customer_id,
    JSON_VALUE(value, '$.customername') AS customer_name,
    JSON_VALUE(value, '$.first_name') AS contact_firstname,
    JSON_VALUE(value, '$.last_name') AS contact_lastname,
    JSON_VALUE(value, '$.phone') AS phone,
    JSON_VALUE(value, '$.address') AS address,
    JSON_VALUE(value, '$.city') AS city,
    JSON_VALUE(value, '$.state') AS state,
    JSON_VALUE(value, '$.zipcode') AS postal_code,
    JSON_VALUE(value, '$.country') AS country,
    NULL AS credit_limit  -- if it doesn't exist at JSON
FROM OPENJSON(@json) 


-- 3. XXX

 -- AFTER CREATING customers_aux table (at the other .sql)
 -- delete customer columns (located at customers table) except customer_id
ALTER TABLE sales_data_raw
DROP COLUMN CUSTOMERNAME, CONTACTFIRSTNAME, CONTACTLASTNAME, PHONE,
            ADDRESSLINE1, ADDRESSLINE2, CITY, STATE, POSTALCODE, COUNTRY;

 -- AFTER CREATING products_raw table (at jupyter notebooks)
 -- delete products columns (located at products table) except PRODUCTCODE
ALTER TABLE sales_data_raw
DROP COLUMN PRODUCTLINE, MSRP;


SELECT * FROM customers_aux