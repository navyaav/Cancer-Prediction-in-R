Fds_cancer <- read.csv("C:/Users/navya/Desktop/Fds_cancer.csv")
View(Fds_cancer)
Fds_cancer.features=Fds_cancer
View(Fds_cancer.features)
summary(Fds_cancer)
plot(Fds_cancer)
#scale the data
plot(Fds_cancer.features)
Fds_cancerScaled <- scale(Fds_cancer[, -6])
Fds_cancerScaled
plot(Fds_cancerScaled)
results <- kmeans(Fds_cancer.features, 2)
results
str(results)
plot(Fds_cancer, col= results$cluster)

#choosing K
k <- list()
for(i in 1:10){
  k[[i]] <- kmeans(Fds_cancerScaled,i)
}

k

betweenss_totss <- list()
for(i in 1:10){
  betweenss_totss[[i]] <- k[[i]]$betweenss/k[[i]]$totss
}
plot(1:10, betweenss_totss, type = "b",
    ylab = "Between SS / Total SS", xlab = "Clusters(k)")
# K= 2 since elbow point is at 2


for(i in 1:4){
  plot(Fds_cancer, col=k[[i]]$cluster)
}

# Thus data is clustered with K=2