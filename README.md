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
1. **Delivery Performance Over Time** – Assessing on-time vs. late deliveries and trends.
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

<img width="650" alt="Screen Shot 2025-03-03 at 5 41 48 PM" src="https://github.com/user-attachments/assets/c4e564a3-6b64-4cae-baf9-74769737265d" />


---

## 📌 **SQL Queries & Data Cleaning**
### 🔹 **Data Cleaning & Transformation**
- The SQL queries used to clean and prepare the data can be found **[here](https://github.com/jalenray15/Target-2017-Performance/blob/main/t_data_cleaning.sql)**.

### 🔹 **Sales & Logistics Performance SQL Queries**
- SQL queries used to analyze business metrics and answer key sales questions can be found **[here](https://github.com/jalenray15/Target-2017-Performance/blob/main/t_data_analysis.sql)**.



---

##  Tableau Dashboards

## Sales Performance Dashboard

<img width="1437" alt="Screen Shot 2025-03-03 at 5 45 26 PM" src="https://github.com/user-attachments/assets/c55fff98-c0e3-4d6d-87f1-f898acb5afbc" />


### KPIs Tracked:
- Total Sales: $7,144,076
- Total Orders: 45,101
- Average Order Value (AOV): $158.40


### Key Insights
- Sales peaked in November due to Black Friday promotions.
- Top-performing categories: Bed Table Bath, Computer Accessories, and Furniture Decoration.
- Underperforming categories: Cine Photo, PC Gamer, and Insurance Services, suggesting areas for improvement.


## Logistics Performance Dashboard

<img width="1439" alt="Screen Shot 2025-03-03 at 5 45 36 PM" src="https://github.com/user-attachments/assets/31e80a1d-aca0-4297-aea9-a6e8b54417cb" />


### KPIs Tracked:
- Avg. Delivery Time: 12 Days
- On-Time Delivery Rate: 92%
- Avg. Shipping Cost: $19.99

### Key Insights
- Delivery delays increased in November, likely due to high order volume.
- Shipping cost increased alongside delivery time, indicating inefficiencies.
- States with the highest late deliveries: SP, RJ, MG, RS, PR – These require operational improvements
  
---


##  **Insights Deep Dive**

 ## Sales Trends
- November saw the highest sales due to holiday demand.
- Sales declined slightly in mid-year but recovered in Q4.

<img width="900" alt="Screen Shot 2025-03-03 at 5 47 16 PM" src="https://github.com/user-attachments/assets/fb1af909-3907-4b9f-a059-4af50e586ac7" />



---
 ## Logistics Performance
- Average delivery time varied significantly by region, with certain states experiencing delays exceeding 30+ days.
- On-time delivery rate declined in November, aligning with peak sales periods.

<img width="900" alt="Screen Shot 2025-03-03 at 5 48 48 PM" src="https://github.com/user-attachments/assets/346d3004-23b5-4166-b7d8-e23c30acb6d2" />







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









