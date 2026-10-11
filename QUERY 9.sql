-- do high-frequency purchasers have different transaction amounts?

SELECT User_Purchase_Frequency,
       ROUND(AVG(User_Transaction_Amount), 1) AS avg_transaction_amount,
       COUNT(*) AS total_records
FROM logistics_staging
GROUP BY User_Purchase_Frequency
ORDER BY User_Purchase_Frequency;