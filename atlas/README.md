# Data Governance & Lineage – Apache Atlas

This folder documents the data governance layer of the project, implemented
using Apache Atlas.

Apache Atlas is used to define, register and visualize:
- datasets involved in the data pipeline
- transformation processes
- end-to-end data lineage from source to consumption


🧭 Governance Scope
The governance model covers the full data lifecycle:

Raw data
 → SQL Server (local)
 → Aggregations & exports
 → Azure SQL Database
 → Power BI consumption


Datasets and processes were manually registered in Atlas to reflect the actual
ETL logic implemented across SQL, Python and Azure components.


## 🧩 Registered Entities

### Datasets
- Raw datasets
- Intermediate tables
- Aggregated tables
- Analytical outputs

### Processes
- Data ingestion steps
- Transformation logic
- Export and loading stages

Each process defines its input and output datasets, enabling full lineage tracking.


📊 Lineage Visualization
The complete lineage graph was exported from the Apache Atlas UI and is included
as a static reference:

- `lineage_view.png`

This visual representation is also embedded in the Power BI report.

## 📄 Lineage Dataset for Analytics
The file `atlas_lineage.csv` contains a consolidated and flattened representation
of the governance metadata:

- entity type (dataset / process)
- name
- inputs
- outputs
- qualified names

This dataset is generated using Python and is directly consumed by Power BI
to build interactive lineage and governance dashboards.


🔗 Related Components
- Python transformation logic: `/python/ATLAS_extract_tables_from_json_files.ipynb`
- Power BI lineage dashboards: see published report
- Architecture overview: `/docs`