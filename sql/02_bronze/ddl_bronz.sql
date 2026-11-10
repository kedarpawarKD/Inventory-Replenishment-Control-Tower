
# Bronze Layer — Data Import Documentation

## Objective
The Bronze layer stores raw source data imported from
the synthetic inventory and replenishment datasets.

## Database
InventoryReplenishmentDW

## Import Method
SQL Server Management Studio (SSMS) Import Flat File /
Import Data Wizard.

## Source
Synthetic FMCG supply chain prototype dataset.

## Tables Imported

1. customers
2. date
3. goods_receipts
4. inventory_daily
5. product_location
6. products
7. purchase_orders
8. sales
9. stock_movements
10. suppliers
11. warehouses

## Import Validation

Initial record counts were checked using SQL queries.

Verified prototype counts:
- Products: 20
- Suppliers: 6
- Warehouses: 2
- Inventory Daily: 3,600

## Data Quality Observations

- Date keys were interpreted as DATE during import.
- Warehouse storage capacity was interpreted as TIME.
- FLOAT was inferred for several monetary columns.
- Numeric quantity columns were imported using
  different integer types.

These issues will be addressed during Silver transformations.

## Bronze Layer Principle

The Bronze layer preserves imported source data.
Data cleaning and type corrections are performed
in the Silver layer.

