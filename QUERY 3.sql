-- which trucks (Asset_ID) have the highest delay rate

SELECT Asset_ID,
       COUNT(*) AS total_shipments,
       SUM(Logistics_Delay) AS delayed_count,
       ROUND(SUM(Logistics_Delay) / COUNT(*) * 100, 2) AS delay_rate_percentage
FROM logistics_staging
GROUP BY Asset_ID
ORDER BY delay_rate_percentage DESC;