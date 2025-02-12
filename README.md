## 📌 Project Background
Target Corporation is one of the largest retail chains in the United States, operating in the **retail and e-commerce industry** since **1962**. The company follows a **brick-and-mortar & online business model**, offering a wide range of products, from home essentials to electronics, apparel, and groceries.

As a **data analyst at Target**, my task was to **analyze the 2017 sales performance**(fictional data) to provide actionable insights that improve business decision-making. This project explores **sales trends**, **top and bottom-selling product categories**, and overall performance metrics.

### **Key Business Questions Addressed**
The analysis focuses on four key areas:
1. **Monthly Sales Trends** – Identifying seasonality and growth patterns.
2. **Top-Selling Product Categories** – Understanding which product categories drive revenue.
3. **Low-Selling Product Categories** – Identifying underperforming categories.
4. **Sales Performance Metrics** – Evaluating KPIs like total sales, total orders, and average order value.

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



---

## 📌 **SQL Queries & Data Cleaning**
### 🔹 **Data Cleaning & Transformation**
- The SQL queries used to clean and prepare the data can be found **[here](https://github.com/jalenray15/Target-2017-Performance/blob/main/t_data_cleaning.sql)**.

### 🔹 **Sales Performance SQL Queries**
- SQL queries used to analyze business metrics and answer key sales questions can be found **[here](https://github.com/jalenray15/Target-2017-Performance/blob/main/t_data_analysis.sql)**.



---

## 📊  Tableau Dashboard

<img width="1440" alt="target_performance_dashboard" src="https://github.com/user-attachments/assets/6abe56f1-28a6-499a-84ff-982211ce345b" />
---

## **📢 Executive Summary**
### **🔍 Key Findings:**
📌 **Total Sales for 2017:** **$6,922,900**  
📌 **Total Orders:** **43,428**  
📌 **Average Order Value (AOV):** **$161**  

#### **Top 3 Insights for Stakeholders:**
1. **Sales grew consistently throughout 2017**, with the **highest peak in November** (likely due to holiday shopping and Black Friday promotions).
2. **Home & Electronics categories dominated sales**, with **Bed, Bath, and Computer Accessories** among the highest-performing product categories.
3. **Certain categories underperformed**, such as **Cine Photo, PC Gamer, and Fashion Children's Clothing**, indicating potential inventory or marketing strategy adjustments.

---

## 📊 **Insights Deep Dive**
### **🔹 Category 1: Monthly Sales Trends**
✅ **Key Insight 1:** Sales exhibited a clear **upward trend**, with a significant **peak in Q4 2017**.  
✅ **Key Insight 2:** March and May saw **moderate sales growth**, but June experienced a **slight dip** before rebounding.  
✅ **Key Insight 3:** November had the **highest spike** in orders, aligning with Black Friday and holiday shopping behavior.

 <img width="1422" alt="Monthly Trends" src="https://github.com/user-attachments/assets/83728501-b8c6-41cd-bb5b-d4ab04ac5695" />


---

### **🔹 Category 2: Top-Selling Product Categories**
✅ **Key Insight 1:** The **Bed Table Bath** category was the **best-selling**, generating the highest revenue.  
✅ **Key Insight 2:** **Computer Accessories & Furniture Decoration** also showed strong performance.  
✅ **Key Insight 3:** Sales in **Sport & Leisure** categories performed well, likely due to seasonal demand.

<img width="1266" alt="Top 10" src="https://github.com/user-attachments/assets/3a2abffc-3a9d-4c8e-a689-2475a6e2af4b" />


---

### **🔹 Category 3: Bottom-Selling Product Categories**
✅ **Key Insight 1:** The **lowest-performing category was hygiene diapers**, with significantly low sales volume.  
✅ **Key Insight 2:** **Cine Photo, PC Gamer, and Insurance & Services** had minimal sales, indicating low demand.  
✅ **Key Insight 3:** **Children’s Clothing & Flowers** showed underwhelming performance compared to similar categories.

<img width="1266" alt="Bottom 10" src="https://github.com/user-attachments/assets/8bd3fae0-8969-47db-a776-fabf3bf7b3ed" />


---

## 📢 **Recommendations**
Based on these insights, here are **data-driven recommendations** for Target’s business strategy:

1. **Expand Holiday Promotions** – Since November saw the **highest sales peak**, Target should enhance Black Friday and holiday sales strategies.
2. **Invest in High-Performing Categories** – **Bed Table Bath, Computer Accessories, and Home Furniture** should be prioritized for stock replenishment and targeted promotions.
3. **Reassess Low-Performing Categories** – Target should evaluate whether **Cine Photo, PC Gamer, and Insurance Services** should be **discounted or removed** from inventory.
4. **Address Mid-Year Sales Drop** – Consider **mid-year sales campaigns (June-July)** to prevent revenue stagnation.

---


## **⚠️ Assumptions & Caveats**
1. **Some orders had missing timestamps**, which were either removed or imputed based on available data.
2. **Refunded or canceled orders were excluded** from total revenue calculations.
3. **Category naming inconsistencies** were cleaned and standardized for accurate grouping.
4. **Seasonal effects** (e.g., holiday sales) were inferred based on trends without external promotional data.

---




## 🚀 **Next Steps**
🔹 **Run predictive models** to forecast **2024 sales trends**.  
🔹 **Incorporate customer data** to analyze purchase behavior.  
🔹 **Optimize marketing efforts** for low-performing categories.  

---

