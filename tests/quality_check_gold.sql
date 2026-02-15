/*
================================================================================
   Gold Layer Data Quality Checks

   Purpose:
   This file contains data quality validation queries for the Gold Layer.
   The checks ensure data accuracy, consistency, and referential integrity
   across dimension and fact tables to support reliable analytics and reporting.
================================================================================
*/


/* 
================================================================================
   Check: Duplicate Customer IDs
   Purpose: Ensure customer IDs are unique before loading Gold Layer.
================================================================================ 
*/
SELECT cst_id, COUNT(*) 
FROM ( 
    SELECT 
        ci.cst_id,
        ci.cst_key,
        ci.cst_firstname,
        ci.cst_lastname,
        ci.cst_marital_status,
        ci.cst_gndr,
        ci.cst_create_date,
        ca.BDATE,
        ca.GEN,
        la.CNTRY
    FROM silver.crm_cust_info ci
    LEFT JOIN silver.erp_CUST_AZ12 ca
        ON ci.cst_key = ca.CID
    LEFT JOIN silver.erp_LOC_A101 la
        ON ci.cst_key = la.CID 
) t
GROUP BY cst_id
HAVING COUNT(*) > 1;

/* 
================================================================================
   Check: Duplicate Product Keys
   Purpose: Ensure active products have unique product keys.
================================================================================
*/
SELECT prd_key, COUNT(*) 
FROM (
    SELECT 
        pn.prd_id,
        pn.cat_id,
        pn.prd_key,
        pn.prd_nm,
        pn.prd_cost,
        pn.prd_line,
        pn.prd_start_dt,
        pc.CAT,
        pc.SUBCAT,
        pc.MAINTENANCE
    FROM silver.crm_prd_info pn
    LEFT JOIN silver.erp_PX_CAT_G1V2 pc
        ON pn.cat_id = pc.ID
    WHERE pn.prd_end_dt IS NULL
) t
GROUP BY prd_key
HAVING COUNT(*) > 1;



/*
================================================================================
   Check: Gender Data Consistency
   Purpose: Validate gender values across CRM and ERP systems.
================================================================================ 
*/
SELECT DISTINCT 
    ci.cst_gndr,
    CASE 
        WHEN ci.cst_gndr != 'n/a' THEN ci.cst_gndr
        ELSE COALESCE(ca.GEN, 'n/a')
    END AS gender_final,
    ca.GEN
FROM silver.crm_cust_info ci
LEFT JOIN silver.erp_CUST_AZ12 ca
    ON ci.cst_key = ca.CID
LEFT JOIN silver.erp_LOC_A101 la
    ON ci.cst_key = la.CID
ORDER BY 1, 2;

/* 
================================================================================
   Check: Gender Values in dim_customers
   Purpose: Ensure standardized gender values in Gold Layer.
================================================================================
*/
SELECT DISTINCT gender 
FROM gold.dim_customers;

/*
================================================================================
   Check: Customer Key Integrity
   Purpose: Ensure all fact records link to valid customers.
================================================================================
*/
SELECT *
FROM gold.fact_sales sa
LEFT JOIN gold.dim_customers cu
    ON sa.customer_key = cu.customer_key
WHERE cu.customer_key IS NULL;

/* 
================================================================================
   Check: Product Key Integrity
   Purpose: Ensure all fact records link to valid products.
================================================================================
*/
SELECT *
FROM gold.fact_sales sa
LEFT JOIN gold.dim_products pr
    ON sa.product_key = pr.product_key
WHERE pr.product_key IS NULL;

