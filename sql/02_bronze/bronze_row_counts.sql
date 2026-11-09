
USE InventoryReplenishmentDW;
GO

SELECT COUNT(*) AS product_rows
FROM bronze.products;

SELECT COUNT(*) AS supplier_rows
FROM bronze.suppliers;

SELECT COUNT(*) AS warehouse_rows
FROM bronze.warehouses;

SELECT COUNT(*) AS inventory_daily_rows
FROM bronze.inventory_daily;

SELECT TOP (10) *
FROM bronze.inventory_daily;

