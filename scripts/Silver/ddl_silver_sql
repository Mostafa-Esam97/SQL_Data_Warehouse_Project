/*
====================================================
File Name      : silver_tables_ddl
Layer          : Silver
Schema         : silver
Type           : DDL Commands (Tables)

Purpose :
- Create Silver layer tables for Data Warehouse.
- Tables include CRM, Sales, and ERP data.
- Ensure dwh_create_date is added for tracking ingestion time.
- Drop existing tables before creation to refresh schema.

Tables :
- crm_cust_info      : Customer personal details (name, gender, marital status, create date).
- crm_prd_info       : Product information (category, cost, line, start and end dates).
- crm_sales_details  : Sales transactions (order, ship, due dates, quantity, price, total sales).
- erp_CUST_AZ12      : ERP customer data (ID, birthdate, gender).
- erp_LOC_A101       : ERP location data (customer ID, country).
- erp_PX_CAT_G1V2    : ERP product categories (ID, category, subcategory, maintenance).

Notes :
- All tables have dwh_create_date defaulting to GETDATE().
- Tables are truncated before loading data in the stored procedure.
====================================================
*/




IF OBJECT_ID('silver.crm_cust_info', 'U') IS NOT NULL
	DROP TABLE silver.crm_cust_info;
GO

CREATE TABLE silver.crm_cust_info
(
	cst_id INT,
	cst_key NVARCHAR(50),
	cst_firstname NVARCHAR(50),
	cst_lastname NVARCHAR(50),
	cst_marital_status NVARCHAR(50),
	cst_gndr NVARCHAR(50),
	cst_create_date DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.crm_prd_info', 'U') IS NOT NULL
	DROP TABLE silver.crm_prd_info;
GO

CREATE TABLE silver.crm_prd_info
(
	prd_id INT,
	cat_id NVARCHAR(50),
	prd_key NVARCHAR(50),
	prd_nm NVARCHAR(50),
	prd_cost INT,
	prd_line NVARCHAR(50),
	prd_start_dt DATE,
	prd_end_dt DATE,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.crm_sales_details', 'U') IS NOT NULL
	DROP TABLE silver.crm_sales_details;
GO

CREATE TABLE silver.crm_sales_details
(
	sls_ord_num NVARCHAR(50),
	sls_prd_key NVARCHAR(50),
	sls_cust_id INT,
	sls_order_dt DATE,
	sls_ship_dt DATE,
	sls_due_dt DATE,
	sls_sales INT,
	sls_quantity INT,
	sls_price INT,
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.erp_CUST_AZ12', 'U') IS NOT NULL
	DROP TABLE silver.erp_CUST_AZ12;
GO

CREATE TABLE silver.erp_CUST_AZ12
(
	CID NVARCHAR(50),
	BDATE DATE,
	GEN NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.erp_LOC_A101', 'U') IS NOT NULL
	DROP TABLE silver.erp_LOC_A101;
GO

CREATE TABLE silver.erp_LOC_A101
(
	CID NVARCHAR(50),
	CNTRY NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO

IF OBJECT_ID('silver.erp_PX_CAT_G1V2', 'U') IS NOT NULL
	DROP TABLE silver.erp_PX_CAT_G1V2;
GO

CREATE TABLE silver.erp_PX_CAT_G1V2
(
	ID NVARCHAR(50),
	CAT NVARCHAR(50),
	SUBCAT NVARCHAR(50),
	MAINTENANCE NVARCHAR(50),
	dwh_create_date DATETIME2 DEFAULT GETDATE()
);
GO
