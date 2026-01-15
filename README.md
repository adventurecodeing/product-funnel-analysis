# Product Funnel & Retention Analysis

## Overview
This project performs an end-to-end product analytics analysis to understand user behavior, identify funnel drop-offs, and evaluate retention patterns for a SaaS-style product. The goal is to translate raw event-level data into actionable product and business insights.

The analysis focuses on activation, conversion, and retention — key metrics commonly used by Product Data Analysts and Business Analysts to drive product decisions.

---

## Problem Statement
Where do users drop off in the product journey, and what actions can improve activation and conversion?

Specifically:
- How many users progress through each funnel stage?
- Where is the biggest drop-off?
- How does performance differ by device?
- How well do users retain over time?

---

## Dataset
- **Type:** Synthetic, event-level user data
- **Users:** 500
- **Events:** 1,280
- **Time Range:** 30-day simulated period

### Tables
- `users` — user attributes (signup date, device, country)
- `events` — event-level actions (signup, login, feature_use, purchase)
- `subscriptions` — subscription lifecycle (optional extension)
- `date_dim` — calendar reference table

Synthetic data was generated using Python to simulate realistic user behavior and controlled drop-offs across funnel stages.

---

## Tools & Technologies
- **SQL (SQLite):** Funnel analysis, window functions, cohort retention
- **Python:** Data generation and preprocessing
- **Power BI:** Dashboard and data visualization
- **Git & GitHub:** Version control and project documentation

---

## Key Analyses

### 1. Funnel Analysis
Analyzed the user journey across the following stages:

- Ensured correct event sequencing using SQL window functions
- Counted each user once per funnel stage
- Identified activation as the primary drop-off point

### 2. Device-Level Segmentation
Compared funnel performance across:
- Mobile
- Web

This revealed stronger activation and conversion rates on Mobile, highlighting potential UX friction on Web.

### 3. Cohort-Based Retention Analysis
- Grouped users by signup date
- Measured weekly retention using event activity
- Identified early churn patterns and cohort behavior differences

---

## Key Insights
- The largest drop-off occurs between **Login and Feature Use**, indicating an activation problem rather than an acquisition issue.
- **Mobile users** demonstrate higher activation and purchase conversion compared to Web users.
- Improving onboarding and feature discoverability on Web could significantly increase downstream conversion.

---

## Dashboard
An interactive Power BI dashboard was built to visualize:
- Funnel performance
- Conversion drop-offs
- Device-level comparison

📄 **Dashboard Preview:**  
`dashboards/Product_Funnel_Dashboard.pdf`

---

## Project Structure
