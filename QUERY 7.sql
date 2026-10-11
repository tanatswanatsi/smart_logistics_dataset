-- does temperature/humidity relate to delays? (useful if this is perishable/sensitive cargo) 

SELECT Logistics_Delay,
       ROUND(AVG(Temperature), 1) AS avg_temp,
       ROUND(AVG(Humidity), 1) AS avg_humidity
FROM logistics_staging
GROUP BY Logistics_Delay;