# Sales Data Engineering Pipeline

> End-to-end Data Engineering project for transforming raw sales data into a clean, validated, and analytics-ready environment using Python, Pandas, SQL Server, and Power BI.

## Overview

This project demonstrates a complete Data Engineering workflow:

**Raw Data → Cleaning → Transformation → Validation → Data Modeling → Analytics → Power BI**

The project focuses on building a reliable analytical data layer from raw sales data.

## Architecture

```text
Raw Sales Data
      ↓
Python / Pandas
      ↓
Data Cleaning & Transformation
      ↓
SQL Server
      ↓
Fact & Dimension Model
      ↓
Data Validation
      ↓
Analytical Layer
      ↓
Power BI Dashboard
```

## Data Model

The project follows a **Star Schema** consisting of one fact table and supporting dimensions.

### Fact Table

**fact_sales**

- `order_id`
- `date_key`
- `product_key`
- `location_key`
- `ship_mode`
- `segment`
- `quantity`
- `discount`
- `sale_price`
- `profit`

**Fact Grain:** One row represents one order.

### Dimension Tables

#### dim_products

- `product_key`
- `product_id`
- `category`
- `sub_category`

#### dim_locations

- `location_key`
- `country`
- `region`
- `state`
- `city`
- `postal_code`

#### dim_dates

- `date_key`
- `full_date`
- `day`
- `month`
- `month_name`
- `quarter`
- `year`
- `day_of_week`

## Data Quality

The pipeline includes validation checks for:

- Source vs. fact row counts
- Duplicate orders
- Missing dimension keys
- NULL values in critical fields
- Business KPI validation

### Final Validation

| Metric | Value |
|---|---:|
| Total Orders | 9,994 |
| Total Quantity | 37,873 |
| Total Sales | 2,215,858.70 |
| Total Profit | 205,168.70 |
| Average Discount | 8.04 |

The final fact table maintains the expected grain with **9,994 source orders and 9,994 fact rows**.

## Analytical Layer

The project includes:

`vw_sales_analysis`

This layer combines the fact table with product and location dimensions to provide an analysis-ready dataset.

Analysis includes:

- Sales by Category
- Sales by Sub-category
- Sales by Region
- Sales by Segment
- Monthly Sales Trends
- Profitability Analysis

## Power BI Dashboard

The analytical layer was connected to Power BI to build an interactive **Sales Performance Dashboard**.

### Dashboard Includes

- Net Sales
- Total Profit
- Units Sold
- Distinct Orders
- Monthly Net Sales Trend
- Sales by Category
- Sales by State
- State Sales Ranking
- Sales by Region

### Filters

- Year
- Region
- Category

### Dashboard Preview

PowerBI/<img width="1464" height="830" alt="Sales_DashBoard" src="https://github.com/user-attachments/assets/bac77feb-d503-4fda-8925-54240f30bd20" />


## Technology Stack

- **Python**
- **Pandas**
- **SQL Server**
- **T-SQL**
- **Power BI**
- **Git & GitHub**

## Repository Structure

```text
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
```

## Key Learning Outcomes

- End-to-end Data Engineering workflows
- Data cleaning with Python and Pandas
- SQL Server and T-SQL
- ETL concepts
- Data quality and validation
- Dimensional modeling
- Star Schema
- Fact & Dimension design
- Analytical SQL
- Power BI visualization

## Author

**Nader Mostafa**

Computer Science Student | Data Engineering Track

[GitHub](https://github.com/nader-mostafa)
