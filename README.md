📌 # Retail Data Platform & Analytics Project
End-to-end retail data project covering ingestion, processing, data governance and business analytics using Azure, SQL and Power BI.

1️⃣ Project Overview
This project implements an end-to-end retail data platform, starting from raw sales data ingestion and ending with analytical reporting and data governance visualization.

The main objective is to demonstrate a complete data lifecycle:
- Data ingestion and storage
- Data cleaning and transformation
- Aggregation and analytical modeling
- Data quality validation
- Data lineage and governance
- Business intelligence reporting

The project has been designed with a strong focus on clarity, traceability and reproducibility, simulating a real-world data engineering and analytics scenario.

2️⃣ High-Level Architecture

The following diagram illustrates the global architecture of the project, including data sources, processing layers, governance and analytics.

![Project Architecture](docs/project_architecture.png)

3️⃣ Data Sources
The project is based on a retail dataset containing:
- Sales transactions
- Products information
- Customers information

The data is initially stored in a relational format and represents a typical transactional retail system.

4️⃣ Data Processing & Modeling
Data processing is implemented using SQL-based transformations, including:

- Raw data ingestion
- Data cleaning and normalization
- Creation of fact and dimension tables
- Generation of aggregated tables for analytical purposes

Different levels of aggregation are used to optimize analytical queries and reporting performance.
The data model follows a star-schema approach, separating fact and dimension tables to support analytical workloads.

5️⃣ Data Governance & Lineage
Data governance is addressed through dataset and process lineage documentation.

The project includes:
- Identification of datasets and processes
- Definition of inputs and outputs
- Visualization of lineage relationships

These elements allow understanding how data flows through the system and how analytical outputs are derived from source datasets.

6️⃣ Analytics & Reporting
The analytical layer is implemented in Power BI, including:

- Business KPIs and sales analysis
- Data quality validation checks
- Aggregated and detailed views
- Data lineage visualizations

The Power BI report is structured into the following sections:
- Business performance analysis
- Data quality validation
- Data lineage and governance

🔗 **Power BI Report**: https://app.powerbi.com/view?r=eyJrIjoiZDU3MDMzZTEtNDJmYy00NTBkLWIxNGMtMWZiNjBkNmU2NzhkIiwidCI6ImJlNDY1NWRmLWFjNzMtNDAxZi1hN2FlLTE5OGMzYjcyZDBjNiIsImMiOjh9

7️⃣ Repository Structure
/docs
  - Project documentation and architecture diagrams

/data
  - Sample or reference datasets used in the project

/sql
  - SQL scripts for data ingestion, transformation and aggregation

/python
  - Python notebooks or scripts for additional analysis or experimentation

/atlas
  - Metadata and lineage information exported from Apache Atlas

/powerbi
  - Power BI report files (.pbix)

8️⃣ Technologies Used
- SQL Server
- Python / Jupyter Notebooks (ETL & integration)
- API Flask
- Azure SQL Database
- Azure Blob Storage / Azure Data Factory
- Apache Atlas (Data Governance & Lineage)
- Power BI (Desktop & Service)
- Git & GitHub
- draw.io (architecture diagrams)


## Final Notes
This project was designed as a hands-on exercise to cover the full lifecycle of
a modern data platform, from ingestion to governance and visualization.
