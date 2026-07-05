# 📦 Supply Chain & Inventory Optimization Tracker

A data analytics project built to monitor inventory health, track supplier lead times, and flag low-stock products using **Excel**, **MySQL**, and **Power BI**.

---

## 📌 Project Overview

Supply chain disruptions and poor inventory visibility are among the top operational challenges for businesses. This project simulates a real-world inventory monitoring system that:

- Tracks stock levels per product and category
- Calculates supplier lead times and late delivery rates
- Flags low-stock products using a MySQL stored procedure
- Delivers insights through a 3-page interactive Power BI dashboard

---

## 🗂️ Dataset

| Detail | Info |
|---|---|
| **Name** | DataCo Smart Supply Chain Dataset |
| **Source** | [Kaggle](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis) |
| **Rows** | 180,519 |
| **Columns** | 53 |
| **Domain** | Clothing, Sports & Electronic Supplies |

---

## 🛠️ Tools Used

| Tool | Purpose |
|---|---|
| **Excel** | Data cleaning, derived columns, reorder point calculations, product-level Pivot Table summary |
| **MySQL** | Database storage, aggregation queries, stored procedure for low-stock alerts |
| **Power BI** | 3-page interactive KPI dashboard with DAX measures and conditional formatting alerts |

---

## 🔄 Project Workflow

```
Raw CSV (Kaggle)
      ↓
Excel — Clean data, derive Stock Status & Shipping Delay columns
      ↓
MySQL — Import cleaned data, run analysis queries, stored procedure
      ↓
Power BI — Connect to MySQL, build dashboard with DAX measures
```

---

## 📊 Power BI Dashboard Pages

### Page 1 — KPI Overview
![KPI Overview](screenshots/page1_kpi_overview.png)
- Total Orders, Low Stock Items, Avg Shipping Delay, Stock-Out Risk % (card visuals)
- Monthly Order & Sales Trend (line chart)
- Category vs. Avg Order Quantity (bar chart)
- Slicer: Order Status

### Page 2 — Inventory Status
![Inventory Status](screenshots/page2_inventory_status.png)
- Product-level table with Stock Status (conditional formatting: 🔴 Low Stock / 🟡 Normal / 🟢 Overstocked)
- Slicer: Category Name

### Page 3 — Supplier Lead Time
![SupplierLead Time](screenshots/page3_lead_time.png)
- Avg Shipping Delay over time (line chart)
- Late Order % by Category (bar chart)
- Slicer: Category Name

---

## 🗃️ SQL Highlights

- **5 analysis queries** covering low stock detection, lead time performance, late delivery rate, top delayed categories, and monthly trends
- **1 stored procedure** `GetLowStockAlerts()` — auto-flags products with avg order quantity below threshold

```sql
CALL GetLowStockAlerts();
```

Full scripts available in the [`/sql`](./sql/) folder.

---

## 📁 Repository Structure

```
supply-chain-inventory-tracker/
│
├── sql/
│   └── Supply_chain_queries.sql      # All queries + stored procedure
│
├── dashboard/
│   └── supply_chain_dashboard.pbix   # Power BI report file
│
├── screenshots/
│   ├── page1_kpi_overview.png
│   ├── page2_inventory_status.png
│   └── page3_lead_time.png
│
└── README.md
```
> 📥 **Note:** Raw data file not included due to size.  
> Download the dataset directly from [Kaggle](https://www.kaggle.com/datasets/shashwatwork/dataco-smart-supply-chain-for-big-data-analysis).
---

## 💡 Key Insights

- Identified product categories with consistently high late delivery rates using `Delivery Status` aggregation
- Derived reorder points per product using 1.5× average order quantity logic
- Stored procedure flags critical low-stock items automatically, reducing manual monitoring effort

---

## 👤 Author

**Pankaj**
BCA Final Year | Aspiring Data Analyst
Skills: Python · MySQL · Excel · Power BI · IBM Watson

---
