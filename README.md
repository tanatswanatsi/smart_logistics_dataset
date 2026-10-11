# smart_logistics_dataset_sql
SQL project cleaning and analyzing a 1,000-record smart logistics dataset in MySQL. Covers fleet delay patterns, traffic impact, inventory vs. demand, and data quality issues. Key finding: heavy traffic conditions showed a 100% shipment delay rate, far above detour or clear conditions — the strongest predictor identified in the analysis.

## Overview
This project uses MySQL to clean and analyze a smart logistics dataset of 1,000 shipment records, examining delay patterns, fleet performance, inventory vs. demand, traffic conditions, and customer purchasing behavior to identify operational risks and improvement opportunities.

## Why I Built This
I wanted to apply SQL to a logistics/supply chain dataset to practice identifying both data quality issues and operational business insights — going beyond simple cleaning to answer questions a fleet or operations manager would actually care about.

## Dataset
1,000 shipment records with 16 fields covering timestamp, truck ID (Asset_ID), location, inventory level, shipment status, environmental conditions (temperature/humidity), traffic status, waiting time, customer transaction data, delay reason, asset utilization, demand forecast, and a delay flag.

## Process

### Data Cleaning
- Verified no missing values or duplicate records
- **Key data quality finding:** identified a mismatch between the `Logistics_Delay` flag and `Logistics_Delay_Reason` column in a significant share of records (318 rows marked "not delayed" but listed a delay reason; 147 rows marked "delayed" but listed no reason) — flagged these with a `delay_data_mismatch` column rather than silently overwriting either field
- Standardized text column values and verified categorical consistency

### Exploratory Analysis
1. **Overall Delay Rate** — 56.6% of shipments (566 of 1,000) were delayed
2. **Delay Rate by Truck** — Truck_10 had the highest delay rate at 64.76%, while Truck_5 had the lowest at 49.46%
3. **Most Common Delay Reason** — Weather was the leading cause (267 incidents), followed closely by Traffic (236) and Mechanical Failure (234) — all three causes are nearly evenly split
4. **Traffic Status vs. Delay Rate** — Heavy traffic conditions showed a 100% delay rate (all 327 shipments delayed), dramatically higher than Detour (35.94%) or Clear (35.06%) conditions
5. **Average Waiting Time by Shipment Status** — waiting time was nearly identical across Delayed (34.6 min), In Transit (35.4 min), and Delivered (35.3 min) shipments, showing almost no variation
6. **Inventory vs. Demand Forecast Gap** — inventory exceeded demand forecast for every truck (no shortage risk fleet-wide); Truck_9 ran the tightest margin (72.7 unit surplus) while Truck_8 carried the largest surplus (124.3 units)
7. **Temperature/Humidity vs. Delay** — virtually no difference between delayed and non-delayed shipments (23.8°C / 65% humidity vs. 24.0°C / 65% humidity) — environmental conditions showed no meaningful link to delays
8. **Asset Utilization by Truck** — utilization was tightly clustered across the fleet (76.6%–80.7%), with Truck_5 lowest and Truck_7 highest — no truck stood out as significantly under- or over-utilized
9. **Purchase Frequency vs. Transaction Amount** — no clear trend; average transaction amount stayed roughly flat ($270–$312) regardless of purchase frequency (1–10)

## Key Findings
- **Heavy traffic is the single strongest delay predictor in this dataset** — a 100% delay rate under heavy traffic conditions, compared to roughly 35% under detour or clear conditions, far outweighs any other factor examined.
- **Delay causes are evenly distributed** — Weather, Traffic, and Mechanical Failure each account for roughly a third of delay incidents, meaning no single root cause dominates; a broad-based improvement strategy is needed rather than one targeted fix.
- **Truck_10 is a consistent outlier for delays** (64.76% delay rate, the fleet's highest), while fleet-wide inventory, utilization, and environmental factors showed little variation between trucks — suggesting Truck_10's issue is likely route- or driver-specific rather than tied to the truck's inventory/utilization profile.
- **No fleet-wide inventory shortage risk exists** — every truck carried a positive inventory surplus over its demand forecast, so stockouts are not currently a concern in this dataset.
- **Temperature, humidity, and purchase frequency showed no meaningful relationship with delays or spending** — ruling these out as contributing factors worth further investment.

## Recommendations
- **Prioritize route planning around heavy traffic conditions** — since heavy traffic shipments were delayed 100% of the time, rerouting or scheduling adjustments to avoid heavy-traffic windows would likely have the single largest impact on reducing delays fleet-wide.
- **Investigate Truck_10 specifically** — its delay rate is notably above the fleet average with no corresponding inventory or utilization anomaly, pointing to a route, driver, or maintenance issue worth a closer look.
- **Address all three delay causes in parallel** — since Weather, Traffic, and Mechanical Failure are nearly evenly split, a single-issue fix won't meaningfully move the overall delay rate; a broader operational review is needed.
- **Improve delay-tracking data consistency** — the mismatch between the delay flag and delay reason fields suggests these are being logged independently; aligning data entry processes would improve the reliability of future analysis.
- **Inventory levels can likely be trimmed slightly** — since every truck carries a comfortable surplus over demand, there may be room to reduce holding costs without introducing shortage risk, particularly for Truck_8 which carries the largest margin.

## Tools Used
MySQL Workbench
