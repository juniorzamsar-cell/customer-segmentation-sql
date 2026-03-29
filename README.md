Customer Segmentation & Revenue Analysis (SQL Project)
🧠 Business Context

This project simulates a real-world e-commerce scenario where the goal is to analyze sales data and identify opportunities to increase revenue through customer segmentation.

The main objective is to understand:

Who are the most valuable customers
Which customers are at risk of churn
How to optimize retention and growth strategies
🎯 Objectives
Clean and prepare transactional data
Analyze revenue distribution across markets, products, and customers
Identify key business insights
Segment customers using the RFM model (Recency, Frequency, Monetary)
🧹 Data Cleaning

Key issues identified:

Missing values in UnitPrice (50 records)
Negative values in Quantity (49 records → returns)
Actions taken:
Removed records with NULL UnitPrice (cannot compute revenue)
Excluded negative quantities from sales analysis (treated as returns)
Business impact:
Prevents distortion in revenue metrics
Ensures accurate product and customer analysis
📊 Exploratory Data Analysis
💰 Total Revenue

Total revenue reached $9.27M, indicating a strong sales performance.

👉 However, this metric alone is insufficient without understanding distribution and concentration.

🌍 Revenue by Country
France, UK, and Germany account for ~60% of total revenue
North America (USA + Canada) contributes ~38%
Insight:

Strong dependency on European markets.

Recommendation:
Diversify geographically
Expand in North America (higher purchasing power)
🏆 Top Products

Revenue is evenly distributed across products:

Laptop, Phone, Tablet, Mouse, Keyboard
Insight:
No single dominant product
Low concentration risk
Recommendation:
Implement bundling strategies (e.g., laptop + accessories)
Increase average order value
👑 Top Customers

Top customers show high spending but require further analysis of concentration.

Insight:
Presence of high-value customers
Need to measure dependency on top clients
🧠 Customer Segmentation (RFM)
📌 Model Definition
Recency → Days since last purchase
Frequency → Number of purchases
Monetary → Total spending
🔧 Key Technical Decision

Instead of using current date, recency was calculated relative to:

👉 MAX(OrderDate) in dataset

This ensures correct scoring in historical data.

📊 RFM Scoring

Customers were scored from 1 to 5 in each dimension:

R_score (recent activity)
F_score (purchase frequency)
M_score (spending level)
🔍 Key Findings
💎 High-Value Customer
One customer stands out with:
High frequency
High monetary value

👉 Represents a core customer

💤 At-Risk Customers
~20% of customers show high recency (inactive)

👉 Indicates potential churn risk

💣 Business Insights
Customer Concentration Risk
Presence of high-value clients → requires retention strategy
Churn Opportunity
Significant inactive customer base (~20%)
Opportunity for reactivation campaigns
Balanced Product Portfolio
No dependency on a single product
Opportunity to increase revenue via bundling
🚀 Strategic Recommendations
🎯 Retention (High-Value Customers)
VIP programs
Personalized offers
Dedicated account management
🔁 Reactivation (At-Risk Customers)
Email campaigns
Discounts / promotions
Behavioral targeting
📦 Revenue Growth
Product bundling
Cross-selling strategies
Increase average order value
🧠 Key Takeaway

This project demonstrates how raw transactional data can be transformed into actionable business insights.

👉 The real value is not in SQL queries, but in:

Understanding customer behavior
Identifying revenue opportunities
Supporting strategic decisions
🛠️ Tools Used
SQL (SQLite)
Excel (data preparation)
📌 Final Note

This project reflects a real-world analytical workflow:
from data cleaning → exploration → segmentation → business strategy.
