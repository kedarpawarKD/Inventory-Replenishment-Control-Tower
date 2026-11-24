
USE InventoryReplenishmentDW;
GO

-- =============================================
-- BRONZE LAYER: DATA LOADING PROCEDURES
-- Project: Inventory Replenishment Analytics
-- =============================================


-- 1. Load Products
CREATE OR ALTER PROCEDURE bronze.load_products
AS
BEGIN
    TRUNCATE TABLE bronze.products;

    BULK INSERT bronze.products
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\01_products.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 2. Load Suppliers
CREATE OR ALTER PROCEDURE bronze.load_suppliers
AS
BEGIN
    TRUNCATE TABLE bronze.suppliers;

    BULK INSERT bronze.suppliers
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\02_suppliers.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 3. Load Warehouses
CREATE OR ALTER PROCEDURE bronze.load_warehouses
AS
BEGIN
    TRUNCATE TABLE bronze.warehouses;

    BULK INSERT bronze.warehouses
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\03_warehouses.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 4. Load Customers
CREATE OR ALTER PROCEDURE bronze.load_customers
AS
BEGIN
    TRUNCATE TABLE bronze.customers;

    BULK INSERT bronze.customers
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\04_customers.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 5. Load Product Location
CREATE OR ALTER PROCEDURE bronze.load_product_location
AS
BEGIN
    TRUNCATE TABLE bronze.product_location;

    BULK INSERT bronze.product_location
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\05_product_location.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 6. Load Date
CREATE OR ALTER PROCEDURE bronze.load_date
AS
BEGIN
    TRUNCATE TABLE bronze.[date];

    BULK INSERT bronze.[date]
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\06_date.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 7. Load Sales
CREATE OR ALTER PROCEDURE bronze.load_sales
AS
BEGIN
    TRUNCATE TABLE bronze.sales;

    BULK INSERT bronze.sales
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\07_sales.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 8. Load Purchase Orders
CREATE OR ALTER PROCEDURE bronze.load_purchase_orders
AS
BEGIN
    TRUNCATE TABLE bronze.purchase_orders;

    BULK INSERT bronze.purchase_orders
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\08_purchase_orders.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 9. Load Goods Receipts
CREATE OR ALTER PROCEDURE bronze.load_goods_receipts
AS
BEGIN
    TRUNCATE TABLE bronze.goods_receipts;

    BULK INSERT bronze.goods_receipts
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\09_goods_receipts.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 10. Load Inventory Daily
CREATE OR ALTER PROCEDURE bronze.load_inventory_daily
AS
BEGIN
    TRUNCATE TABLE bronze.inventory_daily;

    BULK INSERT bronze.inventory_daily
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\10_inventory_daily.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- 11. Load Stock Movements
CREATE OR ALTER PROCEDURE bronze.load_stock_movements
AS
BEGIN
    TRUNCATE TABLE bronze.stock_movements;

    BULK INSERT bronze.stock_movements
    FROM 'C:\InventoryReplenishment\inventory_replenishment_prototype\11_stock_movements.csv'
    WITH
    (
        FIRSTROW = 2,
        FIELDTERMINATOR = ',',
        ROWTERMINATOR = '0x0a',
        CODEPAGE = '65001',
        TABLOCK
    );
END;
GO


-- =============================================
-- MASTER PROCEDURE: LOAD ALL BRONZE TABLES
-- =============================================

CREATE OR ALTER PROCEDURE bronze.load_bronze
AS
BEGIN
    EXEC bronze.load_products;
    EXEC bronze.load_suppliers;
    EXEC bronze.load_warehouses;
    EXEC bronze.load_customers;
    EXEC bronze.load_product_location;
    EXEC bronze.load_date;
    EXEC bronze.load_sales;
    EXEC bronze.load_purchase_orders;
    EXEC bronze.load_goods_receipts;
    EXEC bronze.load_inventory_daily;
    EXEC bronze.load_stock_movements;
END;
GO


-- =============================================
-- EXECUTE COMPLETE BRONZE LOAD
-- =============================================

EXEC bronze.load_bronze;
GO


-- =============================================
-- VALIDATE BRONZE TABLE ROW COUNTS
-- =============================================

SELECT 'products' AS table_name, COUNT(*) AS row_count
FROM bronze.products

UNION ALL

SELECT 'suppliers', COUNT(*)
FROM bronze.suppliers

UNION ALL

SELECT 'warehouses', COUNT(*)
FROM bronze.warehouses

UNION ALL

SELECT 'customers', COUNT(*)
FROM bronze.customers

UNION ALL

SELECT 'product_location', COUNT(*)
FROM bronze.product_location

UNION ALL

SELECT 'date', COUNT(*)
FROM bronze.[date]

UNION ALL

SELECT 'sales', COUNT(*)
FROM bronze.sales

UNION ALL

SELECT 'purchase_orders', COUNT(*)
FROM bronze.purchase_orders

UNION ALL

SELECT 'goods_receipts', COUNT(*)
FROM bronze.goods_receipts

UNION ALL

SELECT 'inventory_daily', COUNT(*)
FROM bronze.inventory_daily

UNION ALL

SELECT 'stock_movements', COUNT(*)
FROM bronze.stock_movements;
GO

