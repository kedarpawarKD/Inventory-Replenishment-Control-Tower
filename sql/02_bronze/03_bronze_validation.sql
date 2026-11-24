
/*
Project: Inventory & Replenishment Control Tower
Layer: Bronze
Purpose: Initial data quality inspection
*/

USE InventoryReplenishmentDW;
GO

-- 1. Inspect all Bronze column data types
SELECT
    TABLE_NAME,
    COLUMN_NAME,
    DATA_TYPE,
    CHARACTER_MAXIMUM_LENGTH,
    IS_NULLABLE
FROM INFORMATION_SCHEMA.COLUMNS
WHERE TABLE_SCHEMA = 'bronze'
ORDER BY TABLE_NAME, ORDINAL_POSITION;
GO

-- 2. Check NULL values in important identifiers
SELECT
    COUNT(*) AS total_rows,
    SUM(CASE WHEN product_id IS NULL THEN 1 ELSE 0 END)
        AS missing_product_ids,
    SUM(CASE WHEN warehouse_id IS NULL THEN 1 ELSE 0 END)
        AS missing_warehouse_ids
FROM bronze.inventory_daily;
GO

-- 3. Check negative closing inventory
SELECT *
FROM bronze.inventory_daily
WHERE closing_inventory_qty < 0;
GO

-- 4. Check sales quantity consistency
SELECT *
FROM bronze.sales
WHERE quantity_fulfilled > quantity_demanded
   OR quantity_fulfilled < 0
   OR quantity_demanded < 0;
GO

-- 5. Check duplicate product IDs
SELECT
    product_id,
    COUNT(*) AS duplicate_count
FROM bronze.products
GROUP BY product_id
HAVING COUNT(*) > 1;
GO

