# Data Catalog

<p><strong>Purpose:</strong><br>
This catalog provides details of all the project Views in the Gold layer, including column names, data types, and descriptions for each column. It is intended to help anyone understand and utilize the data efficiently without accessing the raw tables directly.
</p>

---

## View: dim_customers

<p>This dimension table contains customer information, including personal details, gender, marital status, and country.</p>

<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <th>Column Name</th>
    <th>Data Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>customer_key</td>
    <td>int</td>
    <td>Surrogate key for the customer (auto-generated using ROW_NUMBER)</td>
  </tr>
  <tr>
    <td>customer_id</td>
    <td>int</td>
    <td>Original customer ID from source system</td>
  </tr>
  <tr>
    <td>customer_number</td>
    <td>varchar</td>
    <td>Unique customer number/key from source system</td>
  </tr>
  <tr>
    <td>first_name</td>
    <td>varchar</td>
    <td>Customer's first name</td>
  </tr>
  <tr>
    <td>last_name</td>
    <td>varchar</td>
    <td>Customer's last name</td>
  </tr>
  <tr>
    <td>country</td>
    <td>varchar</td>
    <td>Country of the customer</td>
  </tr>
  <tr>
    <td>marital_status</td>
    <td>varchar</td>
    <td>Marital status of the customer (e.g., Single, Married)</td>
  </tr>
  <tr>
    <td>gender</td>
    <td>varchar</td>
    <td>Customer's gender; defaults to 'n/a' if unknown</td>
  </tr>
  <tr>
    <td>birth_date</td>
    <td>date</td>
    <td>Customer's date of birth</td>
  </tr>
  <tr>
    <td>create_date</td>
    <td>date</td>
    <td>Date when the customer record was created</td>
  </tr>
</table>

---

## View: dim_products

<p>This dimension table contains product information, including product categories, costs, and maintenance status.</p>

<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <th>Column Name</th>
    <th>Data Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>product_key</td>
    <td>int</td>
    <td>Surrogate key for the product (auto-generated using ROW_NUMBER)</td>
  </tr>
  <tr>
    <td>product_id</td>
    <td>int</td>
    <td>Original product ID from source system</td>
  </tr>
  <tr>
    <td>product_number</td>
    <td>varchar</td>
    <td>Unique product key from source system</td>
  </tr>
  <tr>
    <td>product_name</td>
    <td>varchar</td>
    <td>Name of the product</td>
  </tr>
  <tr>
    <td>category_id</td>
    <td>int</td>
    <td>ID of the product category</td>
  </tr>
  <tr>
    <td>category</td>
    <td>varchar</td>
    <td>Category name of the product</td>
  </tr>
  <tr>
    <td>subcategory</td>
    <td>varchar</td>
    <td>Subcategory name of the product</td>
  </tr>
  <tr>
    <td>maintenance</td>
    <td>varchar</td>
    <td>Maintenance type/status of the product</td>
  </tr>
  <tr>
    <td>cost</td>
    <td>decimal</td>
    <td>Cost of the product</td>
  </tr>
  <tr>
    <td>product_line</td>
    <td>varchar</td>
    <td>Product line name or code</td>
  </tr>
  <tr>
    <td>start_date</td>
    <td>date</td>
    <td>Product start date; end date is NULL for active products only</td>
  </tr>
</table>

---

## View: fact_sales

<p>This fact table contains sales transactions, linking customers and products with order details, quantities, and amounts.</p>

<table border="1" cellpadding="5" cellspacing="0">
  <tr>
    <th>Column Name</th>
    <th>Data Type</th>
    <th>Description</th>
  </tr>
  <tr>
    <td>order_number</td>
    <td>varchar</td>
    <td>Unique sales order number</td>
  </tr>
  <tr>
    <td>product_key</td>
    <td>int</td>
    <td>Surrogate key of the sold product (linked to dim_products)</td>
  </tr>
  <tr>
    <td>customer_key</td>
    <td>int</td>
    <td>Surrogate key of the customer who placed the order (linked to dim_customers)</td>
  </tr>
  <tr>
    <td>order_date</td>
    <td>date</td>
    <td>Date when the order was placed</td>
  </tr>
  <tr>
    <td>shipping_date</td>
    <td>date</td>
    <td>Date when the order was shipped</td>
  </tr>
  <tr>
    <td>due_date</td>
    <td>date</td>
    <td>Due date for the order delivery</td>
  </tr>
  <tr>
    <td>sales_amount</td>
    <td>decimal</td>
    <td>Total sales amount for the order</td>
  </tr>
  <tr>
    <td>quantity</td>
    <td>int</td>
    <td>Quantity of products sold in the order</td>
  </tr>
  <tr>
    <td>price</td>
    <td>decimal</td>
    <td>Price per product unit</td>
  </tr>
</table>
