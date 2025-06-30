**📞 Call Center Data Analysis & Dashboard**
This repository showcases a comprehensive data analysis project focused on a Call Center dataset, demonstrating end-to-end skills from data preparation and analysis in MySQL to interactive dashboard creation in Power BI. The goal was to transform raw call center data into actionable insights for strategic decision-making.

&**✨ Project Overview**
This project involved analyzing call center operations to understand key performance metrics, customer interactions, and representative effectiveness. The analysis covered call trends, customer demographics, satisfaction ratings, and purchase behaviors, providing a holistic view of the call center's performance.

**🛠️ Technologies & Tools Used**
**MySQL:**
For robust ETL (Extract, Transform, Load), data cleaning, and in-depth Exploratory Data Analysis (EDA) using advanced SQL queries, subqueries, Common Table Expressions (CTEs), and Window Functions.

**Microsoft Power BI:**
For designing and implementing an interactive dashboard, leveraging DAX (Data Analysis Expressions) for advanced calculations and data modeling.

**SQL (DML/DDL)**: Utilized for creating database schemas (CREATE TABLE), loading data (LOAD DATA INFILE), and complex data manipulation.

# Key Analytical Steps & Deliverables 

**Data Ingestion & ETL:**
Successfully loaded two distinct datasets (Call_Center Dataset.csv and Call_Center Dataset 2.csv) into MySQL, creating Call_details and customer_details tables respectively within the Call_Center_db database.

**Rigorous Data Cleaning & Preprocessing:**

Performed extensive data cleaning in MySQL to ensure data integrity and accuracy. This included: 
Identifying and correcting records with non-positive Duration or negative PurchaseAmount.

Validating SatisfactionRating to be within the expected range (0.0 to 5.0).
Standardizing date formats for consistent analysis.

**In-depth Exploratory Data Analysis (EDA) with SQL:**

Answered critical business questions provided by stakeholders, demonstrating proficiency in complex SQL:

Analyzed overall call performance and trends (e.g., average duration, total purchase amount per financial year and day of week).

Identified top-performing representatives based on satisfaction ratings and call volume (using CTEs).

Explored customer demographics (age, city) to understand their impact on satisfaction and purchase behavior.

Segmented customers based on call frequency, identifying high-value and repeat callers (using subqueries).

Calculated running totals of purchase amounts for representatives (using Window Functions).

Determined the time difference between consecutive calls for repeat customers (using CTEs and date functions).

Assessed call DurationBucket distribution for high-satisfaction calls.

**Interactive Power BI Dashboard Development:**

Designed and implemented a comprehensive Power BI dashboard featuring interactive visuals (e.g., Call Trends, Quantity by Country, Satisfaction Rating distribution, M vs F Callers) and dynamic pivot tables (e.g., Representative-wise performance).

Developed custom DAX formulas to create calculated columns and measures, enabling advanced analytics and robust drill-down capabilities within the dashboard.

The dashboard empowers stakeholders to gain quick, effective insights into call center operations and identify areas for improvement.

**📈 Dashboard Screenshot**
Here's a glimpse of the interactive dashboard:
(Note: You will need to replace images/call_center_dashboard.png with the actual path to your screenshot file in your repository.)

**📂 dashboard**
(
SQL_Scripts/: Contains all SQL DDL (CREATE TABLE) and DML (LOAD DATA INFILE, EDA queries) scripts.

Power_BI_Project/: Contains the Power BI .pbix file.

images/: Contains dashboard screenshots and other relevant images.


💡 Database Management & SQL: Proficient in designing schemas, loading data, and performing complex analytical queries. 

Data Cleaning & Preprocessing: Expertise in identifying and resolving data quality issues for reliable analysis.

Exploratory Data Analysis (EDA): Ability to uncover patterns, trends, and anomalies from raw data.

Business Intelligence & Data Visualization: Skilled in using Power BI to create compelling and interactive dashboards.

DAX (Data Analysis Expressions): Competent in writing custom formulas for advanced data modeling and calculations.

Problem-Solving: Addressed specific business questions by leveraging appropriate analytical techniques.

Communication: Presented findings clearly through visuals and demonstrated understanding of business needs.
