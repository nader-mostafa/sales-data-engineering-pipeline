# Sales Data Engineering Pipeline

An end-to-end **Data Engineering and Analytics project** that transforms raw sales data into a structured analytical environment using **Python, Pandas, SQL Server, dimensional modeling, and Power BI**.

---

## Project Overview

This project demonstrates a complete data pipeline starting from raw sales data and ending with an interactive Power BI dashboard.

The pipeline covers:

- Data ingestion
- Data cleaning and transformation
- Data validation
- Data warehouse modeling
- Fact and dimension design
- SQL-based analytical layer
- Business analysis
- Power BI dashboard development

---

## Architecture

```text
Raw Sales Data
      │
      ▼
Python / Pandas
      │
      ▼
Data Cleaning & Transformation
      │
      ▼
SQL Server
      │
      ├── Orders
      │
      ├── dim_dates
      ├── dim_products
      └── dim_locations
              │
              ▼
          fact_sales
              │
              ▼
      Analytical Layer
      vw_sales_analysis
              │
              ▼
          Power BI
              │
              ▼
     Sales Performance Dashboard
Data Warehouse Model

The warehouse follows a dimensional modeling approach using a Star Schema.

Fact Table

fact_sales

Contains measurable business events such as:

Order ID
Quantity
Discount
Sales
Profit
Product Key
Location Key
Date Key
Dimension Tables
dim_products

Contains:

Product ID
Category
Sub-category
dim_locations

Contains:

Country
Region
State
City
Postal Code
dim_dates

Contains:

Date
Day
Month
Month Name
Quarter
Year
Day of Week
Data Quality

Several validation checks were implemented to ensure the warehouse maintains the expected data grain and integrity.

Validation Checks
Source row count vs fact row count
Duplicate order detection
Missing product keys
Missing location keys
NULL checks on critical fields
Business KPI validation

The final fact table maintains the expected grain:

1 order = 1 fact row
Analytics Layer

The project includes an analytical view:

vw_sales_analysis

This view combines the fact table with product and location dimensions to provide an analysis-ready dataset.

Business analysis includes:

Overall KPIs
Sales by category
Sales by sub-category
Sales by region
Sales by segment
Monthly sales trends
Profit margin analysis
Key Results

Final warehouse validation produced:

KPI	Value
Total Orders	9,994
Total Quantity	37,873
Total Sales	2,215,858.70
Total Profit	205,168.70
Average Discount	8.04
Power BI Dashboard

The final analytical layer was connected to Power BI to create an interactive Sales Performance Dashboard.

Dashboard Includes
Total Sales
Total Profit
Units Sold
Distinct Orders
Monthly Sales Trend
Sales by Category
Sales by Region
Sales by State
State Sales Ranking
Dashboard Preview

Technologies
Python
Pandas
SQL
SQL Server
T-SQL
Power BI
Data Cleaning
ETL
Data Validation
Dimensional Modeling
Star Schema
Git
GitHub
Repository Structure
sales-data-engineering-pipeline/
│
├── Python/
│
├── SQL/
│   ├── dimensions.sql
│   ├── fact_sales.sql
│   ├── data_validation.sql
│   └── analytics.sql
│
├── PowerBI/
│   ├── README.md
│   └── sales_dashboard.png
│
├── dataset/
│
├── LICENSE
└── README.md
Project Workflow
Raw Data
   ↓
Data Cleaning
   ↓
Data Validation
   ↓
Data Modeling
   ↓
Dimension Views
   ↓
Fact Table
   ↓
Data Quality Checks
   ↓
Analytical View
   ↓
Business Analytics
   ↓
Power BI Dashboard
Author

Nader Mostafa

Computer Science Student | Data Engineering Track

GitHub:
https://github.com/nader-mostafa

License

This project is licensed under the MIT License.


**Commit message:**

```text
Finalize project documentation and architecture
