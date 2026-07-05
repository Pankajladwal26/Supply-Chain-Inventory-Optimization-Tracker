CREATE DATABASE supply_chain_db;
USE supply_chain_db;

SELECT `Category Name`, `Product Name`, 
       AVG(`Order Item Quantity`) AS avg_qty,
       COUNT(*) AS order_count
FROM supply_chain_data
WHERE `Stock Status` = 'Low Stock'
GROUP BY `Category Name`, `Product Name`
ORDER BY avg_qty ASC;

SELECT `Category Name`,
       AVG(`Shipping Delay`) AS avg_delay_days,
       SUM(CASE WHEN `Shipping Delay` > 0 THEN 1 ELSE 0 END) AS late_orders,
       COUNT(*) AS total_orders,
       ROUND(SUM(CASE WHEN `Shipping Delay` > 0 THEN 1 ELSE 0 END)*100.0/COUNT(*),2) AS late_pct
FROM supply_chain_data
GROUP BY `Category Name`
ORDER BY avg_delay_days DESC;

DELIMITER $$
CREATE PROCEDURE GetLowStockAlerts()
BEGIN
  SELECT `Category Name`, `Product Name`, 
         AVG(`Order Item Quantity`) AS avg_qty,
         `Stock Status`
  FROM supply_chain_data
  WHERE `Stock Status` = 'Low Stock'
  GROUP BY `Category Name`, `Product Name`, `Stock Status`
  HAVING avg_qty < 15
  ORDER BY avg_qty ASC;
END $$
DELIMITER ;

CALL GetLowStockAlerts();