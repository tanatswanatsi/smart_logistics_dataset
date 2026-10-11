-- does traffic status correlate with delays?

SELECT Traffic_Status,
       COUNT(*) AS total,
       SUM(Logistics_Delay) AS delayed_count,
       ROUND(SUM(Logistics_Delay) / COUNT(*) * 100, 2) AS delay_rate_percentage,
       ROUND(AVG(Waiting_Time), 1) AS avg_waiting_time
FROM logistics_staging
GROUP BY Traffic_Status
ORDER BY delay_rate_percentage DESC;