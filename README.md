# Super Store Sales 2023: Regression Model Evaluation

This repository contains the code and information related to the evaluation of a regression model for Super Store sales in the year 2023. The model aims to predict the Sales based on the independent variables Quantity, Profit, and Discount.

## Data

The dataset used for this analysis is the Super Store sales data for the year 2023. The data includes information about various transactions, such as the quantity of items sold, profit generated, and discount applied. Prior to the regression analysis, the data has undergone a thorough cleaning process to handle missing values, outliers, and any other necessary data transformations.

## Code

The code provided demonstrates the following steps:

1. Fitting the regression model using the `lm()` function in R.
2. Evaluating the overall model fit, including R-squared and adjusted R-squared.
3. Examining the coefficients and p-values for the independent variables.
4. Conducting residual analysis, including residual plots, normality test, and homoscedasticity check.
5. Identifying influential observations using Cook's distance.
6. Performing cross-validation and evaluating metrics like RMSE.

## Evaluation Results

The evaluation of the regression model yields the following results:

- R-squared: [R-squared value]
- Adjusted R-squared: [Adjusted R-squared value]
- Coefficient estimates: [List of coefficient estimates for the independent variables]
- p-values: [List of p-values for the independent variables]
- Shapiro-Wilk test for normality of residuals: [Shapiro-Wilk test result]
- Cook's distance: [List of Cook's distance values for each observation]
- Influential observations: [List of influential observations identified based on Cook's distance]
- Cross-validated RMSE: [Cross-validated root mean squared error]

## Usage

You can use this code and evaluation approach as a reference for your own regression modeling tasks. Modify the code to fit your dataset and specific variables. Additionally, consider customizing the evaluation techniques to meet your requirements.

## Contributing

If you find any issues or have suggestions for improvement, feel free to contribute by creating a pull request. Contributions are always welcome!


