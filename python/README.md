# Python Layer – ETL Orchestration & Integration

This folder contains all Python notebooks used to orchestrate data movement,
format transformations and API-based integrations across the project.

Python is not used here for analytical modeling, but as a flexible ETL and
integration layer connecting:
- SQL Server (local)
- Azure SQL Database
- Azure Blob Storage
- Local Flask APIs
- Apache Atlas metadata exports


🧩 Python in the Global Data Flow
SQL Server (local)
   ↔ Python notebooks
       ↔ CSV / JSON files
           ↔ API (Flask)
               ↔ Azure / Atlas / Power BI


📓 Notebooks Overview
1️⃣ Extract_products_to_JSON.ipynb

Purpose:

Extract product-related data

Generate JSON representation of the products dimension

This notebook initiates the products ETL flow via API.

2️⃣ Upload_products_JSON_to_local_API.ipynb

Purpose:

Upload product JSON files to a local Flask API

Simulate an external data source / microservice

3️⃣ Get_products_from_API_and_load_at_BBDD.ipynb

Purpose:

Consume the local API (GET requests)

Load product data into SQL Server as a dimension table

This notebook completes the API-based ETL cycle for products.

4️⃣ Export_Aggr_Tables_to_csv.ipynb

Purpose:

Export aggregation tables from SQL Server

Generate CSV files for Azure Blob Storage and ADF pipelines

Used to support batch ingestion into Azure.

5️⃣ Upload_agg_sales_by_year_JSON_to_local_API.ipynb

Purpose:

Export yearly aggregated sales data as JSON

Upload the file to a local API endpoint

Used as an alternative ingestion path based on API consumption.

6️⃣ ATLAS_extract_tables_from_json_files.ipynb

Purpose:

Process raw JSON metadata exported from Apache Atlas

Extract datasets and processes

Generate consolidated CSV / Markdown tables

These outputs are later consumed by Power BI for:

data lineage visualization

governance reporting

Although logically related to data governance, this notebook is stored here
due to its Python-based transformation role. See /atlas for functional context.


## 🔗 Related Documentation

```md
- SQL scripts: `/sql`
- Raw data sources: `/data`
- Data governance and lineage: `/atlas`
- Architecture diagrams: `/docs`