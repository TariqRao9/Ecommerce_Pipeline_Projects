
# Customer Retention & Revenue Leakage Dashboard

This project demonstrates an end-to-end data analytics pipeline designed to analyze customer behavior, identify churn patterns, and quantify financial losses using an e-commerce retail dataset. 

By combining database processing with visual analytics, this project turns raw, transaction-level data into clear, actionable charts.

---

## 📸 Dashboard Preview
<img width="978" height="548" alt="image" src="https://github.com/user-attachments/assets/f7f37db3-2b66-418b-a614-9e2b3617bce2" />



---

## 🛠️ Project Architecture & Tech Stack
The project is built around a two-stage data pipeline:
1. **Data Modeling & Transformation (PostgreSQL):** Used advanced SQL queries for data cleaning, cohort grouping, and Recency, Frequency, Monetary (RFM) customer segmentation.
2. **Visual Analytics & Reporting (Power BI):** Imported the processed database schemas to design relationship maps, build dynamic DAX calculations, and construct financial waterfall visuals.

---

## 📈 Key Data Insights Uncovered

### 1. The Big Picture Numbers
* **Total Revenue:** $16.01M 
* **Total Customer Base:** 96.1K users
* **Average Order Value (AOV):** $160.99 (135K Total Units Sold)
* **The Core Issue:** A high **38.90% Churn Rate** contrasted against a low **3.12% Repeat Purchase Rate**.

### 2. Deep-Dive Findings
* **The Cost of Churn:** The pipeline isolated **$6.10M** in historical revenue lost entirely to the 37.3K users who stopped buying. Highlighting this number pinpoints the exact financial value of improving customer satisfaction.
* **Spotting At-Risk Users:** Active repeat buying behavior is highly concentrated in *Growing Spenders* (1,165 users) and *Fading Customers* (980 users). Identifying these groups allows a business to deploy targeted retention offers before they stop buying entirely.
* **The Volume vs. Value Gap:** While new signups and casual buyers drive $8.97M in combined revenue, the highest-value, most loyal accounts (*Champions* & *Loyal Customers*) represent fewer than 200 total users, showing a massive need for automated loyalty programs.
* **The November Spike:** Customer departures hit an all-time high of **7.1K users in November**. This dramatic spike clearly identifies a specific period where shipping, inventory, or customer service failed to scale during peak holiday demand.

---

## 📁 Folder Contents
* `/sql_queries/` — Contains the PostgreSQL scripts used to clean the tables and calculate the customer segmentation matrices.
* `/powerbi_dashboard/` — Contains the complete, downloadable `.pbix` file including all DAX measures and layout models.

---
💡 *Note: To explore the backend metrics or modify the layouts yourself, you can download the full Power BI file located in the dashboard folder above.*
