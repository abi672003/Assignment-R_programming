library(cluster)
install.packages("factoextra")
library(factoextra)
install.packages("dendextend")
library(dendextend)

# Step 1: Generate random dataset
set.seed(42)
columns_1_4 <- runif(500, -10, 10)
columns_5_8 <- runif(500, 10, 20)
columns_9_10 <- runif(500, -100, 100)
dataset <- cbind(columns_1_4, columns_5_8, columns_9_10)

# Convert dataset to data frame
df <- as.data.frame(dataset)

# (i) K-Means Clustering
distortions <- numeric(10)
for (k in 1:10) {
  kmeans_model <- kmeans(df, centers=k, nstart=25)
  distortions[k] <- kmeans_model$tot.withinss
}

# Plotting the elbow curve
fviz_nbclust(df, kmeans, method="wss") + theme_minimal()

# (ii) Hierarchical Clustering
distance_matrix <- dist(df, method="euclidean")
hierarchical_clustering <- hclust(distance_matrix, method="ward.D2")

# Plotting the dendrogram
dend <- as.dendrogram(hierarchical_clustering)
plot(dend)
