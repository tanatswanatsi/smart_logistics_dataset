-- average waiting time by shipment status

SELECT Shipment_Status,
       ROUND(AVG(Waiting_Time), 1) AS avg_waiting_time
FROM logistics_staging
GROUP BY Shipment_Status;