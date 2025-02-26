# 🎯 Target 2017 Sales & Logistics Performance Dashboard

## 📌 Project Background
As a data analyst at Target, I was tasked with analyzing 2017 sales and logistics performance (fictional data) to provide actionable insights for business growth and operational efficiency. This project includes two interconnected dashboards:

Sales Performance Dashboard – Evaluating revenue trends, product category performance, and sales KPIs.

Logistics Performance Dashboard – Monitoring delivery efficiency, shipping costs, and on-time performance.


### **Key Business Questions Addressed**
The analysis focuses on two key areas:

**Sales Performance**
1. **Monthly Sales Trends** – Identifying seasonality and growth patterns.
2. **Top-Selling Product Categories** – Understanding which product categories drive revenue.
3. **Low-Selling Product Categories** – Identifying underperforming categories.
4. **Sales KPIs** – Evaluating KPIs like total sales, total orders, and average order value.

**Logistics Performance**
1. **Delivery Performance Over Time ** – Assessing on-time vs. late deliveries and trends.
2. **Shipping Cost vs. Delivery Speed** – Evaluating cost-effectiveness in logistics.
3. **Delivery Time by State** – Identifying regional inefficiencies in shipment handling.
4. **High-Risk Locations** – Finding the top states with the most late deliveries to pinpoint areas for improvement.


---

## 🔧 **Tools & Technologies Used**
| Category       | Tools & Technologies |
|---------------|----------------------|
| **Database & SQL**  | MySQL |
| **Data Cleaning & Transformation** | SQL (JOINs, CTEs, Aggregations) |
| **Visualization & BI Tools** | Tableau |
| **File Handling** | CSV, Excel |
| **Version Control** | GitHub |


---

## 📊 **Data Structure & Initial Checks**
Target’s primary database consists of the following **five tables**:

| Table Name       | Description |
|-----------------|-------------|
| `orders`       | Contains order-level details, including timestamps and order status. |
| `payments`     | Records payment transactions and associated order IDs. |
| `order_items`  | Contains details about products in each order. |
| `products`     | Includes product descriptions and categories. |
| `customers`    | Stores customer demographics and locations. |
| `geolocation`  | Provides geographic data for delivery performance analysis. |



---

## 📌 **SQL Queries & Data Cleaning**
### 🔹 **Data Cleaning & Transformation**
- The SQL queries used to clean and prepare the data can be found **[here](https://github.com/jalenray15/Target-2017-Performance/blob/main/t_data_cleaning.sql)**.

### 🔹 **Sales & Logistics Performance SQL Queries**
- SQL queries used to analyze business metrics and answer key sales questions can be found **[here](https://github.com/jalenray15/Target-2017-Performance/blob/main/t_data_analysis.sql)**.



---

##  Tableau Dashboards

## Sales Performance Dashboard

<img width="1438" alt="Sales_dashboard" src="https://github.com/user-attachments/assets/d5ac8493-4bf4-4954-9b37-fc7679df746b" />

### KPIs Tracked:
- Total Sales: $6,922,900
- Total Orders: 43,428
- Average Order Value (AOV): $161


### Key Insights
- Sales peaked in November due to Black Friday promotions.
- Top-performing categories: Bed Table Bath, Computer Accessories, and Furniture Decoration.
- Underperforming categories: Cine Photo, PC Gamer, and Insurance Services, suggesting areas for improvement.


## Logistics Performance Dashboard

<img width="1440" alt="Logistics_Dashborad" src="https://github.com/user-attachments/assets/81ac7929-c6c9-49cb-bce6-c67c181c559e" />

### KPIs Tracked:
- Avg. Delivery Time: 13 Days
- On-Time Delivery Rate: 93%
- Late Delivery Rate: 7%

### Key Insights
- Delivery delays increased in November, likely due to high order volume.
- Shipping cost increased alongside delivery time, indicating inefficiencies.
- States with the highest late deliveries: SP, RJ, MG, RS, PR – These require operational improvements
  
---


##  **Insights Deep Dive**

 ## Sales Trends
- November saw the highest sales due to holiday demand.
- Sales declined slightly in mid-year but recovered in Q4.

 <img width="1422" alt="Monthly Trends" src="https://github.com/user-attachments/assets/83728501-b8c6-41cd-bb5b-d4ab04ac5695" />


---
 ## Logistics Performance
- Average delivery time varied significantly by region, with certain states experiencing delays exceeding 30+ days.
- On-time delivery rate declined in November, aligning with peak sales periods.
<img width="1429" alt="Screen Shot 2025-02-26 at 6 41 33 PM" src="https://github.com/user-attachments/assets/dfb7e279-1984-4930-8a68-083bce15a74b" />







---

## **Recommendations**
Based on these insights, here are **data-driven recommendations** for Target’s business strategy:

1. Improve Inventory & Logistics for Q4
- Sales peak in November, leading to delays.
- Recommendation: Enhance warehouse fulfillment and optimize shipping processes before peak demand.

2. Optimize Shipping Cost & Speed
- Freight costs increased as delivery times rose.
- Recommendation: Partner with alternative logistics providers for cost-efficient shipping.

3. Address Low-Performing Categories
- Certain product categories showed consistently poor sales.
- Recommendation: Reevaluate stock levels, pricing, or promotional strategies.

---









