-- 2 what's the most common delay reason

SELECT Logistics_Delay_Reason,
       COUNT(*) AS total
FROM logistics_staging
WHERE Logistics_Delay_Reason != 'None'
GROUP BY Logistics_Delay_Reason
ORDER BY total DESC;