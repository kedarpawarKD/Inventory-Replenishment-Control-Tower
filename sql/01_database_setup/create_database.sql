
/*
========================================================
Project: Inventory Replenishment Analytics
Script: Database Initialization
Purpose: Create the project database and schemas
========================================================
*/

-- 1. Create Database
IF DB_ID('InventoryReplenishmentDW') IS NULL
BEGIN
    CREATE DATABASE InventoryReplenishmentDW;
END;
GO

-- 2. Switch to Project Database
USE InventoryReplenishmentDW;
GO

-- 3. Create Bronze Schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'bronze'
)
BEGIN
    EXEC('CREATE SCHEMA bronze');
END;
GO

-- 4. Create Silver Schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'silver'
)
BEGIN
    EXEC('CREATE SCHEMA silver');
END;
GO

-- 5. Create Gold Schema
IF NOT EXISTS (
    SELECT 1
    FROM sys.schemas
    WHERE name = 'gold'
)
BEGIN
    EXEC('CREATE SCHEMA gold');
END;
GO
