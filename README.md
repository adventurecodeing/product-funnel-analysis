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
