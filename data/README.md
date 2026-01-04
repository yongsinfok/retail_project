# Data Assets

This folder contains the data files used throughout the project, organized by
their role in the data pipeline.

## Structure

### `raw/`
Original input datasets used to bootstrap the project.
- `sales_data_sample.csv`: retail sales dataset from Kaggle.

### `intermediate/`
Intermediate datasets generated during ETL and transformation steps.
- `customers.json`: customer dimension exported and re-ingested using JSON.

### `aggregated/`
Derived datasets created through SQL aggregations and later ingested into Azure.
- Aggregations by category, country and year (CSV / JSON).
