# Health Insurance Charges: What Actually Drives Cost

**R statistical analysis + Tableau dashboard**

## Business Question

Which factors most significantly predict health insurance charges, and how much does each one actually matter?

## Overview

This project analyzes 1,338 health insurance records to identify which personal factors — age, BMI, number of children, smoking status, sex, and region — actually drive insurance charges, and by how much. The goal was to move past "which factors are statistically significant" (a low bar with enough data) and into "which factors are large enough to matter in practice."

## Method

- **R:** individual ANOVA tests on smoker status, sex, and region, followed by a combined multiple linear regression model including all six predictors together
- **Tableau Public:** a four-visual dashboard built specifically to make the regression findings visible — not just charted, but visually proven

## Key Findings

| Factor | Effect Size | Significance |
|---|---|---|
| **Smoker status** | +$23,849 on average | Extremely significant (p < 2e-16, F = 2,178) |
| **Age** | +$256.90 per year | Highly significant |
| **BMI** | +$339.20 per point | Highly significant |
| **Children** | +$475.50 per child | Significant |
| **Sex** | No meaningful effect once controlled for other factors | Not significant in combined model (p = 0.69), despite appearing weakly significant in isolation (p = 0.036) |
| **Region** | Small effect (~$1,000 or less), inconsistent across regions | Weakly significant for two of three region categories |

**The combined regression model explains 75% of the variation in insurance charges (R² = 0.751)** — a strong result, especially compared to weaker models built on less structured data.

**Headline finding:** Smoking status is, by a wide margin, the single strongest driver of insurance cost — adding nearly $24,000 on average, more than the combined effect of age, BMI, and children together. The BMI-vs-charges scatter plot shows this dramatically: the highest-cost outliers in the entire dataset are consistently high-BMI smokers, suggesting these two factors compound rather than simply add.

**A subtler, equally important finding:** sex showed a weak but statistically significant effect when tested alone (p = 0.036), but that effect disappeared entirely once other factors were controlled for in the combined model (p = 0.69). This is a useful reminder that a variable can appear to matter in isolation while actually reflecting a confound with something else — testing variables together, not just individually, is what caught it.

## Files in This Repository

- `insurance_analysis.R` — full R script: ANOVA tests and combined regression model
- `insurance.csv` — source dataset

## Tools Used

R (aov, lm), Tableau Public
