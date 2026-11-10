
/*
==========================================================
Project: Inventory Replenishment Analytics
Script: init_database.sql
Purpose: Initialize the project database
==========================================================
*/

-- STEP 1: Switch to master database
USE master;
GO

-- STEP 2: Drop existing database if it exists
IF DB_ID('InventoryReplenishmentDW') IS NOT NULL
BEGIN
    ALTER DATABASE InventoryReplenishmentDW
    SET SINGLE_USER WITH ROLLBACK IMMEDIATE;

    DROP DATABASE InventoryReplenishmentDW;
END;
GO

-- STEP 3: Create fresh database
CREATE DATABASE InventoryReplenishmentDW;
GO

-- STEP 4: Switch to project database
USE InventoryReplenishmentDW;
GO

-- STEP 5: Create Bronze schema
CREATE SCHEMA bronze;
GO

-- STEP 6: Create Silver schema
CREATE SCHEMA silver;
GO

-- STEP 7: Create Gold schema
CREATE SCHEMA gold;
GO

-- STEP 8: Verify database creation
SELECT
    name AS Database_Name,
    state_desc AS Database_Status
FROM sys.databases
WHERE name = 'InventoryReplenishmentDW';

-- STEP 9: Verify schema creation
SELECT
    name AS Schema_Name
FROM sys.schemas
WHERE name IN ('bronze', 'silver', 'gold')
ORDER BY name;
GO
