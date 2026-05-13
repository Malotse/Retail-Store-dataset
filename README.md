#Bright Retail Sales Analysis — Databricks SQL & Power BI Project
Project Overview

This project focuses on analyzing retail sales performance data using Databricks SQL and preparing the dataset for Power BI dashboard visualization.

The analysis was performed on a retail transaction dataset containing customer demographics, product categories, sales transactions, and revenue data for the 2023 financial year.

The project demonstrates:

Data cleaning and transformation
Feature engineering using SQL
KPI generation
Revenue trend analysis
Customer segmentation
Product performance analysis
Business insight reporting
Power BI-ready data modeling
Tools & Technologies Used
Databricks SQL
SQL
Power BI
CSV Dataset
GitHub
Dataset Information

The dataset contains retail transaction information including:

Column Name	Description
Transaction ID	Unique transaction identifier
Date	Transaction date
Customer ID	Unique customer identifier
Gender	Customer gender
Age	Customer age
Product Category	Product category purchased
Quantity	Units purchased
Price per Unit	Unit price
Total Amount	Total transaction amount
Data Engineering & Enrichment

An enriched analytics layer was created using Databricks SQL to generate:

Monthly and quarterly date features
Weekend vs weekday classification
Age group segmentation
Revenue tier classification
ZAR currency conversion
KPI calculations

Example generated columns:

trans_month_name
day_type
age_group
revenue_tier
price_zar
total_zar
Key Business Insights
Executive KPIs
Total Revenue
Average Order Value
Total Transactions
Units Sold
Monthly Revenue Trends
Customer Analytics
Gender spending analysis
Age group revenue analysis
Weekend vs weekday purchasing behavior
Product Analytics
Product category performance
Revenue by product category
Price point analysis
Revenue distribution tiers
SQL Features Demonstrated

This project demonstrates:

Aggregate functions
CASE statements
GROUP BY operations
Date functions
Data transformation
Revenue calculations
Analytical SQL reporting
View creation
Data enrichment techniques
Power BI Integration

The enriched dataset was prepared for Power BI dashboard integration to support:

Executive reporting
Interactive KPI dashboards
Sales trend visualization
Customer segmentation dashboards
Project Structure
Raw CSV Dataset
        ↓
Databricks SQL Cleaning
        ↓
Enriched Sales View
        ↓
Analytical SQL Queries
        ↓
Power BI Dashboard
Learning Outcomes

Through this project I learned:

Real-world SQL analytics workflows
Building enriched analytical datasets
Debugging SQL queries
Databricks SQL development
Business KPI reporting
Preparing data for visualization tools
Author

Malotse Mathipa
Data Analytics & Data Science Enthusiast

Future Improvements
Connect live Power BI dashboards
Add forecasting models
Build automated KPI alerts
Implement advanced customer segmentation
Add machine learning sales predictions
