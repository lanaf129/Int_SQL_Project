# E-commerce Sales Analysis

## Overview
Analysis of customer behavior, retention, and lifetime value for Contoso, an e-commerce company. The analysis aims to improve customer retention and maximize revenue.

## Business Questions
1. **Customer Segmentation** What are the key customer segments based on behavior, demographics, or product usage? Which segments are the most profitable or have the highest LTV?
2. **Cohort Analysis:** How do different customer groups generate revenue?
3. **Retention Analysis:** What is the retention rate and how does it change over time? Which cohorts have highest churn rate?

## Analysis

### 1. Customer Segmentation

Query: [1_Customer_Segmentation.sql](/Scripts/1_Customer_Segmentation.sql)

# Visualization
![Customer_ltv_by_segment.jpg](/images/1_cust_ltv_by_segment.jpg)

# **Key findings**
- Low-value customers are defined as the lower 25% of all customers, Medium-value are between 25% and 75%, High-value customers are the upper 25%.
- High-value customers represent 65.6% of total LTV across segments, while Low-value customers represent 2.1% of total LTV. 

# **Business Insights**
- High-value customers drive revenue. Prioritize retention, upsell, and offer premium customer service experience.

- Marketing campaigns should be targeted at converting the Low-value segment into Medium- and High-value which presents potential for increased revenue. Alternatively, resources spent on acquiring Low-value customers can be reallocated towards the two higher value segments.

- Growth opportunity in the Medium segment: 50% of your customer base, contributing 32% of revenue. This group may be easier to move upward than low-value customers. Identify traits and behaviors of Medium customers who became High-Value and replicate via targeted campaigns.

### 2. Cohort Analysis
- Tracked revenue and customer count per cohort
- Cohorts were grouped by year of first purchase
- Analyzed customer retention at a cohort level

Query: [2_cohort_analysis.sql](/Scripts/2_cohort_analysis.sql)

# Visualization
![Average Cohort Revenue](/images/2_cohort_avg_rev.jpg)

# **Key findings**

Revenue per customer in each cohort shows an alarming decrease over time.

# **Business Insights**

Value extracted per customer has decrease over time and needs further investigation (market saturation, acquisition challenges). Audit acquisition sources for recent low-LTV users: lower-quality leads, less aggressive sales, or a mismatch between product-market fit and recent users.

### 3. Retention Analysis

Query: [3_retention_analysis.sql](/Scripts/3_retention_analysis.sql)

# Visualization

![Active vs Churned Customers by Cohort](/images/3_active_churned.jpg)
![Active Customers by Country and Cohort](/images/3_retention_rate.jpg)



# **Key findings**

- Extremely high churn across all years:
90% percent compared to 20% industry standard

- No significant improvement in retention over time: percentage of active customers over time stayed flat (8-10%)

- Germany has the highest retention rate across all cohorts, followed by Canada and Netherlands.

# **Business Insights**

- Investigate root causes: are users churning due to price, onboarding, support, or product fit?

- Potential product improvements

- Increase delivery speed

- Investigate what lead to higher retention rate in Germany, Canada, and Netherlands. If applicable, same strategies should be followed in other countries. 

- Assess what contributed to lower retention rates in Australia, Italy, and the UK.

- Test retention tactics:
lifecycle emails or onboarding automation,
personalized offers,
loyalty/engagement incentives,
improved customer support touchpoints

- Re-engage high-value churned customers by focusing on targeted win-back campaigns. Reactivating valuable users may yield higher ROI.

- Predict and prevent churn risk and use customer-specific warning indicators to proactively intervene with at-risk users before they lapse.

## Strategic Recommendations

- Implement onboarding and engagement campaigns in the first 3–6 months.

- Consider loyalty programs, rewards, and proactive customer support.

- Build targeted campaigns for the High-Value segment (premium offers, early access) which represents 65% of revenue.

- Use lookalike modeling to find and acquire customers similar to your high-value base.

- Optimize country-specific strategies. Churn rates and customer volumes vary by country, such as language-specific onboarding and country-specific promotions or incentives.

- Investigate what’s working (support channels, user behavior patterns) for countries with better retention.

- Shift toward value-based acquisition: shift paid acquisition toward high-LTV profiles.

- Improve product onboarding experience. Implement product tours, success checklists, and progress nudges.

- Offer incentives or nudges around the 90–180 day mark.

## Technical details
- **Database:** PostgreSQL
- **Analytical Tools:** PostgreSQL, DBeaver
- **Visualization:** Excel
