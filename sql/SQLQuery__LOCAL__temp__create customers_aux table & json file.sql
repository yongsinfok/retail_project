-- Create new table with unique customers from Sales table

DROP TABLE IF EXISTS customers_aux;
CREATE TABLE customers_aux (
    customername      NVARCHAR(100),
    first_name        NVARCHAR(50),
    last_name         NVARCHAR(50),
    phone             NVARCHAR(50),
    address           NVARCHAR(150),
    city              NVARCHAR(50),
    state             NVARCHAR(50),
    zipcode           NVARCHAR(20),
    country           NVARCHAR(50)
);

INSERT INTO customers_aux (customername, first_name, last_name, phone, address, city, state, zipcode, country)
SELECT DISTINCT
    CUSTOMERNAME,
    CONTACTFIRSTNAME,
    CONTACTLASTNAME,
    PHONE,
    ADDRESSLINE1,
    CITY,
    STATE,
    POSTALCODE,
    COUNTRY
FROM sales_data_raw;


-- add unique id to every customer
ALTER TABLE customers_aux
ADD customer_id INT IDENTITY(1,1) PRIMARY KEY;


-- export customers_aux table to JSON format, to apply defined procedure to import it (at the other .sql)
SELECT *
FROM customers_aux
FOR JSON AUTO;


SELECT * FROM customers_aux