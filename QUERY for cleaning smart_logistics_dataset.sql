Select *
From smart_logistics_dataset;

-- 1 creating a staging table

CREATE TABLE logistics_staging LIKE smart_logistics_dataset;
INSERT INTO logistics_staging SELECT * FROM smart_logistics_dataset;

-- 2 check for duplicates

SELECT Timestamp, Asset_ID, COUNT(*)
FROM logistics_staging
GROUP BY Timestamp, Asset_ID
HAVING COUNT(*) > 1;

-- 3 investigate the delay flag vs delay reason mismatch

SELECT * FROM logistics_staging
WHERE Logistics_Delay = 0 AND Logistics_Delay_Reason != 'None';

SELECT * FROM logistics_staging
WHERE Logistics_Delay = 1 AND Logistics_Delay_Reason = 'None';

-- 4 flagging  the columns

ALTER TABLE logistics_staging ADD COLUMN delay_data_mismatch BOOLEAN;
UPDATE logistics_staging
SET delay_data_mismatch = (
  (Logistics_Delay = 0 AND Logistics_Delay_Reason != 'None') OR
  (Logistics_Delay = 1 AND Logistics_Delay_Reason = 'None')
);

-- 5 checking for inconsistences in text columns

SELECT DISTINCT Shipment_Status FROM logistics_staging;

SELECT DISTINCT Traffic_Status FROM logistics_staging;

SELECT DISTINCT Logistics_Delay_Reason FROM logistics_staging;

-- 6 check for numeric ranges for anything physically implausible

SELECT MIN(Temperature), MAX(Temperature), MIN(Humidity), MAX(Humidity), MIN(Waiting_Time), MAX(Waiting_Time)
FROM logistics_staging;

-- 7 fixing the timestamp column

ALTER TABLE logistics_staging MODIFY COLUMN Timestamp DATETIME;

select *
from logistics_staging;







