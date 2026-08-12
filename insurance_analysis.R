# ============================================================
# Project 5: Health Insurance Charges Analysis
# Business Question: Which factors most significantly predict
# health insurance charges, and how much does each one matter?
# ============================================================

insurance <- read.csv("insurance.csv")
str(insurance)
summary(insurance$charges)

# ------------------------------------------------------------
# Individual ANOVA tests
# ------------------------------------------------------------
smoker_model <- aov(charges ~ smoker, data = insurance)
summary(smoker_model)

sex_model <- aov(charges ~ sex, data = insurance)
summary(sex_model)

region_model <- aov(charges ~ region, data = insurance)
summary(region_model)

# ------------------------------------------------------------
# Combined multiple regression model
# ------------------------------------------------------------
combined_model <- lm(charges ~ age + bmi + children + smoker + sex + region, data = insurance)
summary(combined_model)
