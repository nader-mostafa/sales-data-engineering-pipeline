# Sales Data Engineering Pipeline

> End-to-end Data Engineering pipeline for transforming raw sales data into a validated, structured, and analytics-ready data model using Python, Pandas, SQL Server, and Power BI.

---

## Overview

This project demonstrates an end-to-end **Data Engineering workflow**, starting from raw sales data and transforming it into a structured analytical environment ready for business intelligence and reporting.

The pipeline covers the major stages of a practical data engineering workflow:

**Raw Data → Data Cleaning → Transformation → Validation → Data Modeling → SQL Analytics → Power BI**

The project focuses on building a reliable data foundation rather than simply creating visualizations. Data is cleaned and validated before being modeled into fact and dimension structures and exposed through an analytical layer for reporting.

---

## Architecture

```text
                         ┌─────────────────────┐
                         │      Raw Dataset    │
                         │    Sales CSV Data   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │   Python / Pandas   │
                         │                     │
                         │ • Data Cleaning     │
                         │ • Transformation    │
                         │ • Validation        │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │      SQL Server     │
                         │                     │
                         │      orders         │
                         └──────────┬──────────┘
                                    │
                    ┌───────────────┼───────────────┐
                    │               │               │
                    ▼               ▼               ▼
             ┌────────────┐  ┌────────────┐  ┌────────────┐
             │ dim_dates  │  │dim_products│  │dim_locations│
             └─────┬──────┘  └─────┬──────┘  └──────┬─────┘
                   │               │                │
                   └───────────────┼────────────────┘
                                   │
                                   ▼
                         ┌─────────────────────┐
                         │     fact_sales      │
                         │                     │
                         │ • Orders            │
                         │ • Quantity          │
                         │ • Sales             │
                         │ • Profit            │
                         │ • Foreign Keys      │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │ Analytical Layer    │
                         │                     │
                         │ vw_sales_analysis   │
                         └──────────┬──────────┘
                                    │
                                    ▼
                         ┌─────────────────────┐
                         │      Power BI       │
                         │                     │
                         │ Sales Dashboard     │
                         └─────────────────────┘
