# importing relevant files
superstore.2023 <- read.csv("C:/Users/Administrator/Desktop/DATA ANALYTICS RESOURCES/R/superstore 2023.csv", comment.char="#")
data=superstore.2023
data
attach(data)
#Data Cleaning
data1 <- na.omit(data)
data1
names(data1)
data2=subset(data1, select = -c(Row.ID,Order.ID, Order.Date,Ship.Date,Customer.ID,Customer.Name,Segment, Country.Region,City, Postal.Code))
data2
names(data2)
#Data Exploration
summary.data.frame(data2)
str(data2)
plot(Sales)
plot(Profit)
plot(Discount)
hist(Sales)
hist(Profit)
hist (Discount)
#ggplot
library(ggplot2)
ggplot(data = data2, aes(x = Sales, y = Profit)) +
  geom_point() +
  labs(title = "Sales vs. Profit", x = "Sales", y = "Profit")
#Regional Sales
library(dplyr)
region_sales <- data2 %>%
  group_by(Region) %>%
  summarise(total_sales = sum(Sales)) %>%
  arrange(desc(total_sales))
best_region <- region_sales$Region[1]
print(region_sales)
print(best_region)

#Product Category with most Profit
category_profit <- data2 %>%
  group_by(`Category`) %>%
  summarise(total_profit = sum(Profit)) %>%
  arrange(desc(total_profit))
print(category_profit)
best_category <- category_profit$Category[1]
print(best_category)

#Correlation
corr_mat <- cor(data2[c("Sales", "Quantity", "Profit", "Discount")])
corr_mat
corr_mat <- cor(data2[c("Sales", "Quantity", "Profit", "Discount")])
heatmap(corr_mat, 
        col = colorRampPalette(c("blue", "white", "red"))(100),
        main = "Correlation Heatmap",
        xlab = "Variables",
        ylab = "Variables")

# Regression Model
# Fit the regression model
model <- lm(Sales ~ Quantity + Profit + Discount, data = data2)

# Print the summary of the model
summary(model)
#data2=46.95t+1.28t^2+231.24^3-21.21
# Model Evaluation
# Assuming you have a fitted regression model named "model"

# 1. Overall model fit
# R-squared
r_squared <- summary(model)$r.squared
adjusted_r_squared <- summary(model)$adj.r.squared

# 2. Coefficients
# Coefficient estimates and p-values
coefficient_estimates <- coef(model)
p_values <- summary(model)$coefficients[, "Pr(>|t|)"]

# 3. Residual analysis
# Residual plot
plot(model, which = 1)  # 1 for residual vs. fitted values

# Normality of residuals
residuals <- resid(model)
shapiro_test <- shapiro.test(residuals)

# Homoscedasticity
plot(model, which = 3)  # 3 for scale-location plot

# 4. Outliers and influential observations
# Cook's distance and leverage values
cooksd <- cooks.distance(model)
leverage <- hatvalues(model)

# 5. Collinearity
# Variance Inflation Factors (VIF)
library(car)
vif <- vif(model)
vif
# 6. Cross-validation and prediction
# Perform cross-validation and evaluate metrics
library(caret)
cv_results <- train(
  form = Sales ~ Quantity + Profit + Discount,
  data = data2,
  method = "lm",
  trControl = trainControl(method = "cv", number = 5),
  metric = "RMSE"
)
cv_rmse <- cv_results$results$RMSE

# Print the evaluation results
print(paste("R-squared:", r_squared))
print(paste("Adjusted R-squared:", adjusted_r_squared))
print("Coefficient estimates:")
print(coefficient_estimates)
print("p-values:")
print(p_values)
print("Shapiro-Wilk test for normality of residuals:")
print(shapiro_test)
print("Cook's distance:")
print(cooksd)
print("Leverage values:")
print(leverage)
print("Variance Inflation Factors (VIF):")
print(vif)
print(paste("Cross-validated RMSE:", cv_rmse))