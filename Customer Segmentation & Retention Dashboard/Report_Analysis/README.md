# Customer Segmentation & Performance Analysis

## 📊 Project Overview

This project analyzes customer purchasing behavior using **RFM (Recency, Frequency, Monetary) analysis** to segment customers based on their purchase activity and value.

The project focuses on understanding:

- Customer segmentation
- Customer purchasing behavior
- Repeat customers
- Customer churn
- Revenue contribution by customer segment
- Monthly churn trends
- Customer retention opportunities

The analysis was performed using **PostgreSQL and Power BI**, with SQL used for data preparation, RFM calculations, customer segmentation, and analytical metrics.

---

## 📌 Dataset Overview

The dataset contains approximately:

- **96,096 Customers**
- **135K Items Sold**
- **$16.01M Total Revenue**
- **$160.99 Average Order Value**
- **3.12% Repeat Purchase Rate**
- **38.90% Churn Rate**

---

## 🎯 Business Questions

This project answers several business questions:

1. How are customers distributed across different segments?
2. Which customer segments generate the most revenue?
3. How many customers are repeat customers in each segment?
4. What percentage of customers are churning?
5. When are churned customers making their last purchases?
6. Which customer segments represent potential retention opportunities?
7. How concentrated is revenue among different customer groups?

---

## 🔎 RFM Analysis

Customers were evaluated using three RFM dimensions:

### Recency
Measures how recently a customer made a purchase.

### Frequency
Measures how many orders a customer has placed.

### Monetary
Measures the total amount spent by a customer.

RFM scores were then used to classify customers into different behavioral segments.

---

## 👥 Customer Segments

The analysis creates the following customer segments:

- Champions
- Potential Loyalists
- Loyal Customers
- Growing Spenders
- New Signups
- Occasional Buyers
- Casual Buyers
- At-Risk Loyal
- Fading Customers
- Churned

These segments help distinguish between high-value customers, developing customers, recent customers, and customers who have become inactive.

---

## 📈 Key Metrics

The Power BI dashboard includes:

- Total Customers
- Total Items Sold
- Total Revenue
- Average Order Value (AOV)
- Repeat Purchase Rate
- Churn Rate
- Customers by Segment
- Revenue by Customer Segment
- Repeat Customers by Segment
- Churned Customers by Last Purchase Month

---

## 💡 Key Findings

### High Churn

The analysis identified a **38.90% churn rate**, indicating that a substantial portion of the customer base is classified as churned.

### Low Repeat Purchase

The overall repeat purchase rate is **3.12%**, showing that repeat purchasing is relatively limited within the analyzed customer base.

### Large New/Churned Customer Base

New Signups and Churned customers represent a large portion of the total customer base, indicating a strong concentration of one-time or recently acquired customers.

### Casual Buyers

Casual Buyers represent **18,580 customers** and generate approximately **$2.83M in revenue**, making this segment an important area for further customer-retention analysis.

### Small High-Value Customer Base

Champions, Loyal Customers, and At-Risk Loyal customers together represent a very small portion of the total customer base, despite their higher-value purchasing behavior.

### Churn Trend

Monthly churn analysis tracks the **last purchase month of customers currently classified as churned**, helping identify periods with higher concentrations of lost customers.

---

## 🛠️ Tools & Technologies

### PostgreSQL
Used for:

- Data preparation
- SQL joins
- Customer-level aggregation
- RFM calculations
- Window functions
- Customer segmentation
- Repeat customer analysis
- Churn analysis

### Power BI
Used for:

- Interactive dashboard development
- KPI cards
- Customer segment analysis
- Revenue analysis
- Repeat customer analysis
- Churn trend visualization
- Business insights

---

## 📊 Dashboard

The Power BI dashboard provides an interactive view of customer segmentation and performance.

### Dashboard Sections

**Customer KPIs**
- Total Customers
- Total Items Sold
- Total Revenue
- AOV
- Repeat Purchase Rate
- Churn Rate

**Customer Analysis**
- Customers by Segment
- Revenue by Customer Segment
- Repeat Customers by Segment
- Churned Customers by Last Purchase Month

---

## 🔄 Analytical Workflow

```text
Raw E-commerce Data
        ↓
PostgreSQL
        ↓
Data Preparation & SQL Joins
        ↓
Customer-Level RFM Calculation
        ↓
RFM Ranking
        ↓
Customer Segmentation
        ↓
Repeat Customer & Churn Analysis
        ↓
Power BI
        ↓
Interactive Dashboard
        ↓
Business Insights
---

## Author

## MUHAMMAD TARIQ
