# Data Warehouse ETL Project  
## Gold Layer Implementation using Star Schema

---

## 📖 Project Description

This repository contains an end-to-end **Data Warehouse project** that demonstrates how raw operational data is transformed into a clean, reliable, and analytics-ready **Gold Layer** using a structured **ETL process**.

The project follows industry best practices in **Dimensional Modeling**, **Data Quality Validation**, and **Star Schema Design**, making it suitable for enterprise reporting and Business Intelligence environments.

---

## 🏗 Data Warehouse Architecture

The solution follows a layered architecture:

### 🥉 Bronze Layer – Raw Data
- Stores raw data extracted from CRM and ERP systems.
- No transformations applied.
- Maintains original records for traceability.

### 🥈 Silver Layer – Cleansed & Integrated Data
- Data cleaning and normalization.
- Integration across multiple source systems.
- Handling missing and inconsistent values.
- Preparing data for analytical modeling.

### 🥇 Gold Layer – Analytics & Reporting
- Final curated analytical layer.
- Designed using **Star Schema**.
- Optimized for reporting and BI tools.
- Contains dimension and fact views.

---

## ⭐ Star Schema Data Model

The Gold Layer is structured using a **Star Schema** consisting of:

### Dimension Tables
- **dim_customers**
- **dim_products**

### Fact Table
- **fact_sales**

The model enables simplified joins, improved performance, and scalable analytical queries.

---

## 🔄 ETL Process

### Extract
- Data sourced from CRM and ERP systems.

### Transform
- Standardization of text fields (e.g., gender values).
- Validation of numeric fields (sales, quantity, price).
- Handling null and inconsistent values.
- Filtering inactive or historical records.
- Generating surrogate keys using window functions.

### Load
- Creation of analytical views in the Gold Layer.
- Structuring data for BI consumption.

---

## ✅ Data Quality & Validation

Comprehensive data quality checks were implemented:

- Duplicate detection for customer and product IDs.
- Text validation and categorical standardization.
- Numeric validation for financial and quantity fields.
- Date validation for order and shipping logic.
- Referential integrity checks between fact and dimension tables.

These validations ensure the Gold Layer is accurate, consistent, and production-ready.

---

## 🧠 Skills Demonstrated

- ETL Pipeline Design  
- Data Warehousing Architecture  
- Star Schema Modeling  
- Dimensional Modeling  
- Data Quality Framework  
- SQL (Joins, Views, Window Functions)  

---

## 🎯 Project Outcome

This project delivers a structured, validated, and analytics-ready Data Warehouse layer suitable for enterprise reporting and Business Intelligence solutions.

---


## 👤 About the Author

**Mostafa Esam Ahmed Mahmoud**  
Civil Engineer | Data Analysis Trainee  

- Trained in **Data Analysis at DEPI – Digital Egypt Pioneers Intiative**  
- Learned **SQL** and **Data Warehousing concepts** for analytical projects  
- Gained practical experience with **Power BI** for data modeling and dashboards  
- Built hands-on projects implementing **ETL pipelines** and **Star Schema** concepts  
- Engineering background with strong analytical and problem-solving skills  

[![LinkedIn](https://img.shields.io/badge/LinkedIn-Mostafa_Esam-blue?style=flat&logo=linkedin&logoColor=white)](https://www.linkedin.com/in/mostafa-esam-356285202)

