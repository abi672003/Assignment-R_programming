# Set seed for reproducibility
set.seed(123)

# Generate random dataset
dataset <- matrix(runif(2500, 5, 10), nrow = 500)

# Convert matrix to data frame
dataset <- as.data.frame(dataset)

# [i]Rename columns
colnames(dataset) <- c("Column1", "Column2", "Column3", "Column4", "Column5")

# Display the first few rows of the dataset
head(dataset)

#[ii] Perform t-test on each column
t_test_results <- lapply(dataset, function(col) {
  t.test(col)
})

# Perform Wilcoxon signed rank test on each column
wilcox_test_results <- lapply(dataset, function(col) {
  wilcox.test(col)
})

#[iii] Perform two-sample t-test on Column 3 and Column 4
t_test_3_4 <- t.test(dataset$Column3, dataset$Column4)

# Perform Wilcoxon rank sum test on Column 3 and Column 4
wilcox_test_3_4 <- wilcox.test(dataset$Column3, dataset$Column4)
