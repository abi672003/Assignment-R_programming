# Step 1: Generate random dataset
set.seed(42)
dataset <- matrix(runif(600, -100, 100), nrow=600, ncol=15)
df <- as.data.frame(dataset)

# (i) Plot scatter graph between Column 5 and Column 6
plot(df$V5, df$V6, main="Scatter Plot", xlab="Column 5", ylab="Column 6")

# (ii) Plot histogram of each column in a single graph
par(mfrow=c(3, 5))  # Set the layout to 3 rows and 5 columns
for (i in 1:15) {
  hist(df[,i], main=paste("Histogram of Column", i), xlab=paste("Column", i))
}

# (iii) Plot the Box plot of each column in a single graph
boxplot(df, main="Box Plot")

