-- which trucks are underutilized vs overutilized?

SELECT Asset_ID,
       ROUND(AVG(Asset_Utilization), 1) AS avg_utilization
FROM logistics_staging
GROUP BY Asset_ID
ORDER BY avg_utilization ASC;