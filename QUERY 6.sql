-- where does inventory level sit relative to demand forecast? (surplus vs shortage risk)

SELECT Asset_ID,
       ROUND(AVG(Inventory_Level), 1) AS avg_inventory,
       ROUND(AVG(Demand_Forecast), 1) AS avg_demand_forecast,
       ROUND(AVG(Inventory_Level) - AVG(Demand_Forecast), 1) AS inventory_vs_demand_gap
FROM logistics_staging
GROUP BY Asset_ID
ORDER BY inventory_vs_demand_gap ASC;