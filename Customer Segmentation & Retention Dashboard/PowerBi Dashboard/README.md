# 📊 Power BI Visualization & Analytical Modeling

This directory houses the presentation layer of the project. It features the complete, interactive layout designed to bring the PostgreSQL database processing models to life for clear, immediate insight extraction.

The primary objective of this dashboard is to move from heavy rows of numbers to immediate visual understanding, allowing a viewer to pinpoint where revenue is dropping in less than 5 seconds.

---

## 🎨 Visualization Features & Design System
The dashboard layout is structured with deliberate UX design concepts to ensure high scannability:

* **Executive KPI Layout:** Placing the high-level business health metrics (Total Revenue, Customer Base, Churn Rate, and AOV) right at the top left to anchor the dashboard view.
* **Financial Waterfall Modeling:** Utilizing waterfall charts to clearly illustrate how the $16.01M starting revenue degrades into a $6.10M loss due to customer churn.
* **Dynamic Slicers & Filtering:** Providing toggle frameworks to allow viewers to filter performance data across different user behavior cohorts effortlessly.
* **Time-Series Volatility Mapping:** A dedicated seasonal line metric that visualizes exactly when churn peaks occur, drawing direct attention to the November breakdown.

---

## 🧠 Core Data Architecture & DAX Measures
The dataset relies on a star schema relational map connected directly to the processed SQL server inputs. Key dynamic DAX measures engineered inside this workbook include:

* **Churn Rate (%):** Calculates the percentage ratio of lost accounts against the aggregate customer volume.
* **Repeat Purchase Frequency (%):** Tracks the rate of users with multiple separate order timestamps to measure platform stickiness.
* **Average Order Value (AOV):** Dynamic calculation dividing Total Revenue by total transactional count to monitor sales margins.

---

## 📥 Dashboard Access & Workspace Files

Due to GitHub's file size limitations for web browser uploads, the master dashboard workbook is hosted safely via cloud storage:

* 📥 **Download Link:** [Click Here to Download the Olist_ecommerce.pbix File from Google Drive]([https://google.com](https://drive.google.com/file/d/1O8NTwxPxaeyUTfHxtwoCar6dBAUNMv4a/view?usp=sharing))

---
💡 *Note: Google Drive cannot generate a web preview for Power BI files, so it will show a "No preview available" screen. Simply click the blue **Download** button on that page to save the file and open it locally via Power BI Desktop (free).*
