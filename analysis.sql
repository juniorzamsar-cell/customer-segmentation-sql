Exploratory Data Analysis
💰 Total Revenue

Total revenue: $9.27M

Insight

The company shows strong sales performance, but revenue alone is not enough — distribution must be analyzed.

🌍 Revenue by Country
SELECT 
    Country,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM ecommerce_clean
GROUP BY Country
ORDER BY revenue DESC;
Insight

Europe (France, UK, Germany) generates over 60% of total revenue, indicating strong geographic concentration.

Recommendation
Diversify into North America
Reduce dependency on European markets
🏆 Top Products
SELECT  
    Product,
    ROUND(SUM(TotalPrice), 2) AS revenue
FROM ecommerce_clean
GROUP BY Product
ORDER BY revenue DESC
LIMIT 5;
Insight

Revenue is evenly distributed across products.

Recommendation
Low dependency risk
Opportunity to increase revenue via product bundling (e.g., laptop + accessories)
👑 Top Customers
SELECT 
    CustomerID,
    ROUND(SUM(TotalPrice), 2) AS total_spent
FROM ecommerce_clean
GROUP BY CustomerID
ORDER BY total_spent DESC
LIMIT 10;
Insight

Presence of high-value customers suggests potential for targeted retention strategies.

🧠 Customer Segmentation (RFM)
📌 RFM Model Definition
Recency → Days since last purchase
Frequency → Number of purchases
Monetary → Total spending
🔧 RFM Base Table
CREATE TABLE rfm_final AS
SELECT 
    CustomerID,
    CAST(
        (SELECT julianday(MAX(OrderDate)) FROM ecommerce25_clean) 
        - julianday(MAX(OrderDate)) 
    AS INTEGER) AS recency_days,
    COUNT(OrderID) AS frequency,
    ROUND(SUM(TotalPrice), 2) AS monetary
FROM ecommerce25_clean
GROUP BY CustomerID;
📌 Key Technical Decision

Recency was calculated relative to the maximum date in the dataset, not the current date, to ensure accurate scoring.

🎯 RFM Scoring
SELECT *,
    CASE 
        WHEN recency_days <= 30 THEN 5
        WHEN recency_days <= 90 THEN 4
        WHEN recency_days <= 180 THEN 3
        WHEN recency_days <= 300 THEN 2
        ELSE 1
    END AS R_score,

    CASE 
        WHEN frequency >= 15 THEN 5
        WHEN frequency >= 10 THEN 4
        WHEN frequency >= 5 THEN 3
        WHEN frequency >= 2 THEN 2
        ELSE 1
    END AS F_score,

    CASE 
        WHEN monetary >= 30000 THEN 5
        WHEN monetary >= 20000 THEN 4
        WHEN monetary >= 10000 THEN 3
        WHEN monetary >= 5000 THEN 2
        ELSE 1
    END AS M_score

FROM rfm_final;
🔍 Key Findings
💎 High-Value Customers

A customer was identified with:

High frequency
High monetary value

👉 Represents a core business customer

Strategy
VIP programs
Personalized offers
Dedicated account management
💤 At-Risk Customers

~20% of customers show high recency (inactive)

Insight

Significant portion of customers at risk of churn

Strategy
Email reactivation campaigns
Targeted discounts
Behavioral marketing
⚖️ Customer Distribution

Customer base is a mix of:

Occasional buyers
Loyal customers
At-risk users
Insight

Balanced structure but with clear opportunity in retention

💣 Business Recommendations
🎯 Retention
Focus on high-value customers
Build loyalty programs
🔁 Reactivation
Target inactive customers
Use personalized campaigns
📦 Revenue Growth
Cross-selling
Product bundling
Increase average order value
🧠 Key Takeaway

This project demonstrates how raw transactional data can be transformed into actionable business insights using SQL.

👉 The value is not only in querying data, but in:

Understanding customer behavior
Identifying revenue opportunities
Supporting strategic decision-making
🛠️ Tools Used
SQL (SQLite)
Excel
🚀 Next Steps
Build dashboard (Power BI / Tableau)
Automate segmentation
Apply predictive models (churn prediction)
