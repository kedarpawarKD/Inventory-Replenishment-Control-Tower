
/*
============================================================
Project: Inventory Replenishment Analytics
Layer: Bronze
Script: ddl_bronze.sql
Purpose: Create raw source tables
============================================================
*/

USE InventoryReplenishmentDW;
GO

-- =========================================================
-- 1. PRODUCTS
-- =========================================================

CREATE TABLE bronze.products
(
    product_id NVARCHAR(50),
    product_name NVARCHAR(255),
    category NVARCHAR(100),
    subcategory NVARCHAR(100),
    brand NVARCHAR(100),
    unit_cost NVARCHAR(50),
    selling_price NVARCHAR(50),
    demand_profile NVARCHAR(100),
    shelf_life_days NVARCHAR(50),
    case_pack NVARCHAR(50),
    minimum_order_qty NVARCHAR(50)
);
GO

-- =========================================================
-- 2. SUPPLIERS
-- =========================================================

CREATE TABLE bronze.suppliers
(
    supplier_id NVARCHAR(50),
    supplier_name NVARCHAR(255),
    supplier_city NVARCHAR(100),
    supplier_state NVARCHAR(100),
    supplier_category NVARCHAR(100),
    payment_terms_days NVARCHAR(50),
    contract_lead_time_days NVARCHAR(50)
);
GO

-- =========================================================
-- 3. WAREHOUSES
-- =========================================================

CREATE TABLE bronze.warehouses
(
    warehouse_id NVARCHAR(50),
    warehouse_name NVARCHAR(255),
    city NVARCHAR(100),
    state NVARCHAR(100),
    region NVARCHAR(100),
    storage_capacity_units NVARCHAR(50)
);
GO

-- =========================================================
-- 4. CUSTOMERS
-- =========================================================

CREATE TABLE bronze.customers
(
    customer_id NVARCHAR(50),
    customer_name NVARCHAR(255),
    customer_type NVARCHAR(100),
    city NVARCHAR(100),
    state NVARCHAR(100),
    region NVARCHAR(100)
);
GO

-- =========================================================
-- 5. PRODUCT LOCATION
-- =========================================================

CREATE TABLE bronze.product_location
(
    product_id NVARCHAR(50),
    warehouse_id NVARCHAR(50),
    primary_supplier_id NVARCHAR(50),
    standard_lead_time_days NVARCHAR(50),
    minimum_order_qty NVARCHAR(50),
    case_pack NVARCHAR(50),
    ordering_cost NVARCHAR(50),
    annual_holding_cost_per_unit NVARCHAR(50),
    target_service_level NVARCHAR(50),
    base_daily_demand NVARCHAR(50),
    review_period_days NVARCHAR(50)
);
GO

-- =========================================================
-- 6. DATE
-- =========================================================

CREATE TABLE bronze.date
(
    date_key NVARCHAR(50),
    full_date NVARCHAR(50),
    [year] NVARCHAR(50),
    [quarter] NVARCHAR(50),
    [month] NVARCHAR(50),
    month_name NVARCHAR(100),
    [week] NVARCHAR(50),
    [day] NVARCHAR(50),
    day_name NVARCHAR(100),
    is_weekend NVARCHAR(50),
    festival_period NVARCHAR(100)
);
GO

-- =========================================================
-- 7. SALES
-- =========================================================

CREATE TABLE bronze.sales
(
    sales_line_id NVARCHAR(50),
    order_id NVARCHAR(50),
    order_date NVARCHAR(50),
    product_id NVARCHAR(50),
    warehouse_id NVARCHAR(50),
    customer_id NVARCHAR(50),
    quantity_demanded NVARCHAR(50),
    quantity_fulfilled NVARCHAR(50),
    unit_price NVARCHAR(50),
    discount_amount NVARCHAR(50),
    net_sales NVARCHAR(50),
    unit_cost NVARCHAR(50),
    cogs NVARCHAR(50)
);
GO

-- =========================================================
-- 8. PURCHASE ORDERS
-- =========================================================

CREATE TABLE bronze.purchase_orders
(
    po_line_id NVARCHAR(50),
    po_id NVARCHAR(50),
    po_date NVARCHAR(50),
    supplier_id NVARCHAR(50),
    product_id NVARCHAR(50),
    warehouse_id NVARCHAR(50),
    ordered_qty NVARCHAR(50),
    unit_cost NVARCHAR(50),
    po_value NVARCHAR(50),
    expected_delivery_date NVARCHAR(50),
    planned_lead_time_days NVARCHAR(50)
);
GO

-- =========================================================
-- 9. GOODS RECEIPTS
-- =========================================================

CREATE TABLE bronze.goods_receipts
(
    receipt_id NVARCHAR(50),
    po_id NVARCHAR(50),
    po_line_id NVARCHAR(50),
    supplier_id NVARCHAR(50),
    product_id NVARCHAR(50),
    warehouse_id NVARCHAR(50),
    po_date NVARCHAR(50),
    expected_delivery_date NVARCHAR(50),
    receipt_date NVARCHAR(50),
    ordered_qty NVARCHAR(50),
    received_qty NVARCHAR(50),
    rejected_qty NVARCHAR(50),
    actual_lead_time_days NVARCHAR(50),
    delivery_delay_days NVARCHAR(50)
);
GO

-- =========================================================
-- 10. INVENTORY DAILY
-- =========================================================

CREATE TABLE bronze.inventory_daily
(
    date_key NVARCHAR(50),
    full_date NVARCHAR(50),
    product_id NVARCHAR(50),
    warehouse_id NVARCHAR(50),
    opening_inventory_qty NVARCHAR(50),
    received_qty NVARCHAR(50),
    demand_qty NVARCHAR(50),
    sales_qty NVARCHAR(50),
    unfulfilled_demand_qty NVARCHAR(50),
    transfer_in_qty NVARCHAR(50),
    transfer_out_qty NVARCHAR(50),
    return_qty NVARCHAR(50),
    adjustment_qty NVARCHAR(50),
    closing_inventory_qty NVARCHAR(50),
    unit_cost NVARCHAR(50),
    inventory_value NVARCHAR(50),
    stockout_flag NVARCHAR(50),
    unfulfilled_demand_flag NVARCHAR(50)
);
GO

-- =========================================================
-- 11. STOCK MOVEMENTS
-- =========================================================

CREATE TABLE bronze.stock_movements
(
    movement_id NVARCHAR(50),
    movement_date NVARCHAR(50),
    product_id NVARCHAR(50),
    warehouse_id NVARCHAR(50),
    movement_type NVARCHAR(100),
    quantity NVARCHAR(50),
    reference_id NVARCHAR(100),
    note NVARCHAR(1000)
);
GO

