select * from agg_sales_by_country

-- Create aggregate_by_category Table at Azure DB (retail-project)
DROP TABLE IF EXISTS agg_sales_by_category;
CREATE TABLE agg_sales_by_category (
    product_category      VARCHAR(MAX),
    total_sales           DECIMAL(18,4),
    avg_price             DECIMAL(18,4),
    num_orders            INT
);

-- Create aggregate_by_country Table at Azure DB (retail-project)
DROP TABLE IF EXISTS agg_sales_by_country;
CREATE TABLE agg_sales_by_country (
    country      NVARCHAR(50),
    DEALSIZE     NVARCHAR(50),
    total_sales  DECIMAL(18,4),
    num_orders   INT
);

-- Create aggregate_by_year Table at Azure DB (retail-project)
DROP TABLE IF EXISTS agg_sales_by_year;
CREATE TABLE agg_sales_by_year (
    year				 INT,
    product_category     VARCHAR(MAX),
    total_sales			 DECIMAL(18,4)
);