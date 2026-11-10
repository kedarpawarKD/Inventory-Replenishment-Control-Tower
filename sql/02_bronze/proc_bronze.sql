
/*
Project: Inventory & Replenishment Control Tower
Layer: Bronze
Purpose: Verify imported record counts
Database: InventoryReplenishmentDW
*/

USE InventoryReplenishmentDW;
GO

SELECT 'customers' AS table_name, COUNT_BIG(*) AS row_count FROM bronze.customers
UNION ALL
SELECT 'date', COUNT_BIG(*) FROM bronze.date
UNION ALL
SELECT 'goods_receipts', COUNT_BIG(*) FROM bronze.goods_receipts
UNION ALL
SELECT 'inventory_daily', COUNT_BIG(*) FROM bronze.inventory_daily
UNION ALL
SELECT 'product_location', COUNT_BIG(*) FROM bronze.product_location
UNION ALL
SELECT 'products', COUNT_BIG(*) FROM bronze.products
UNION ALL
SELECT 'purchase_orders', COUNT_BIG(*) FROM bronze.purchase_orders
UNION ALL
SELECT 'sales', COUNT_BIG(*) FROM bronze.sales
UNION ALL
SELECT 'stock_movements', COUNT_BIG(*) FROM bronze.stock_movements
UNION ALL
SELECT 'suppliers', COUNT_BIG(*) FROM bronze.suppliers
UNION ALL
SELECT 'warehouses', COUNT_BIG(*) FROM bronze.warehouses
ORDER BY table_name;
GO
