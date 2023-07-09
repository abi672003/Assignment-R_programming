# Step 1: Generate random dataset
set.seed(42)
dataset <- matrix(sample(1:200, 100*30, replace=TRUE), nrow=100, ncol=30)

# Convert dataset to data frame
df <- as.data.frame(dataset)

# (i) Replace values with NA in the defined range [10, 60]
df[10:60, ] <- NA
missing_rows_count <- sum(rowSums(is.na(df)) > 0)
cat("Number of rows with missing values:", missing_rows_count, "\n")

# (ii) Replace NA values with column average
df <- apply(df, 2, function(x) ifelse(is.na(x), mean(x, na.rm=TRUE), x))

# (iii) Calculate Pearson correlation and plot heatmap
correlation_matrix <- cor(df)
heatmap(correlation_matrix, main="Pearson Correlation Heatmap")

# Select columns with correlation <= 0.7
corr_threshold <- 0.7
lower_corr_columns <- colnames(correlation_matrix)[apply(abs(correlation_matrix) <= corr_threshold, 2, all)]
cat("Columns with correlation <= 0.7:", lower_corr_columns, "\n")

# (iv) Normalize values between 0 and 10
normalized_df <- apply(df, 2, function(x) (x - min(x, na.rm=TRUE)) / (max(x, na.rm=TRUE) - min(x, na.rm=TRUE)) * 10)

# (v) Replace values with 1 if <= 0.5, else with 0
replaced_df <- apply(normalized_df, 2, function(x) ifelse(x <= 0.5, 1, 0))
