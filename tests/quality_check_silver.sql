/*
====================================================
File Name      : silver_layer_quality_checks
Layer          : Silver
Schema         : Silver
Type           : Data Quality Checks / Validation

Purpose :
- Validate data loaded into Silver layer tables.
- Check for nulls, duplicates, invalid values, unwanted spaces, and inconsistent data.
- Ensure data standardization, consistency, and integrity.
- Useful as part of ETL testing after loading Silver layer from Bronze.

Usage Example :
- Run each query to inspect data issues and verify transformations.
====================================================
*/

-- CHECK FOR NULLS AND DUPLICATES ON THE PRIMARY KEY
-- Expectation: No Results
SELECT
	PRD_ID,
	COUNT(*) 
FROM SILVER.CRM_PRD_INFO
GROUP BY PRD_ID
HAVING COUNT(*) > 1 OR PRD_ID IS NULL;

-- CHECK FOR UNWANTED SPACES
-- Expectation: No Results
SELECT
	PRD_NM
FROM SILVER.CRM_PRD_INFO
WHERE PRD_NM != TRIM(PRD_NM);

-- DATA STANDARDIZATION & CONSISTENCY
-- Distinct product lines
SELECT 
	DISTINCT(PRD_LINE)
FROM BRONZE.CRM_PRD_INFO;

-- Distinct customer marital status
SELECT 
	DISTINCT(CST_MARITAL_STATUS)
FROM BRONZE.CRM_CUST_INFO;

-- CHECK FOR INVALID COSTS
-- Expectation: No Negative or Null Values
SELECT
	PRD_COST
FROM SILVER.CRM_PRD_INFO
WHERE PRD_COST < 0 OR PRD_COST IS NULL;

-- CHECK FOR INVALID DATES
SELECT
	NULLIF(SLS_ORDER_DT,0) AS SLS_ORDER_DT
FROM SILVER.CRM_SALES_DETAILS
WHERE LEN(SLS_ORDER_DT) != 8;

SELECT
	*
FROM SILVER.CRM_SALES_DETAILS
WHERE SLS_ORDER_DT > SLS_SHIP_DT
   OR SLS_ORDER_DT > SLS_DUE_DT;

-- CHECK DATA CONSISTENCY: SALES, QUANTITY, AND PRICE
SELECT * FROM SILVER.CRM_SALES_DETAILS;

-- CHECK ERP CUSTOMER BIRTHDATES
SELECT
	BDATE
FROM BRONZE.ERP_CUST_AZ12
WHERE BDATE < '1924-01-01' OR BDATE > GETDATE();
