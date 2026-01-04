# SQL Layer – Data Modeling & Aggregations

This folder contains all SQL scripts used in the project for:
- data ingestion into SQL Server
- creation of core fact and dimension tables
- generation of aggregated datasets
- preparation of data structures for Azure ingestion

The SQL layer plays a central role in the ETL process, acting as the bridge between
raw data sources, Python-based transformations, Azure Data Factory pipelines and
final analytical consumption in Power BI.


📊 Data Flow Context (High Level)
Raw CSV (Kaggle)
   ↓
SQL Server (local – SSMS)
   ↓
Aggregations & exports (CSV / JSON)
   ↓
Azure SQL Database (via ADF / API)


📁 Scripts Overview
1️⃣ SQLQuery__LOCAL__create tables & filled.sql

Environment: SQL Server (Local – SSMS)

Purpose:

Creation of core tables (fact and base structures)

Initial loading of the Kaggle retail CSV

Definition of the sales fact table

This script represents the starting point of the relational model.

2️⃣ SQLQuery__LOCAL__temp__create customers_aux table & json file.sql

Environment: SQL Server (Local – SSMS)

Purpose:

Extraction of customer-related data from SQL

Creation of an auxiliary table (customers_aux)

Export of customer data to JSON format

This step supports an intermediate ETL flow where customer data is:

exported to JSON

consumed by Python scripts

re-ingested into SQL as a dimension table

3️⃣ SQLQuery__LOCAL__Aggregations.sql

Environment: SQL Server (Local – SSMS)

Purpose:

Creation of aggregated tables:

sales by category

sales by country

sales by year

These tables are later:

exported as CSV or JSON using Python notebooks

ingested into Azure using Azure Data Factory pipelines or API-based ingestion

4️⃣ SQLQuery__AZURE_DB__create_agg_tables.sql

Environment: Azure SQL Database

Purpose:

Creation of destination aggregation tables in Azure

Schema preparation for Azure Data Factory pipelines

Alignment with local aggregation structures

This script is executed after database migration (BACPAC) from local SQL Server to Azure.


🔗 Related Components
- Python notebooks: see `/python`
- Raw datasets: see `/data`
- Azure pipelines and ingestion logic: documented at project root README
- Data lineage and governance: see `/atlas`