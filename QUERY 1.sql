-- 1 what percentage of shipments were delayed overall

SELECT Logistics_Delay,
       COUNT(*) AS total,
       ROUND(COUNT(*) / (SELECT COUNT(*) FROM logistics_staging) * 100, 2) AS pct
FROM logistics_staging
GROUP BY Logistics_Delay;