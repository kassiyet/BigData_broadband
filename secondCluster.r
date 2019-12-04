# tell R where your file is located
setwd('C:/Users/wuwan/OneDrive - University of Warwick/Desktop/BDAV/simulation/SImOut/SImOut')

#load packages
library(ggplot2)
library(ggfortify)
library(cluster)

# tell R what file to use
mydata <- read.csv("purchase_Customers.csv")

# convert to a R data frame
mydata <- data.frame(mydata)

# Normalization
s_mydata <- scale(mydata, center=TRUE,scale=TRUE)

# fit the K-means model to mydata
fit <- kmeans(s_mydata, 8) #8 cluster solution
autoplot(fit, data=s_mydata)

# get cluster means
means <- aggregate(s_mydata, by=list(fit$cluster), FUN=mean)

# append cluster assignment
mydata <- data.frame(s_mydata, fit$cluster)

# write the data back out to Excel
write.csv(s_mydata, file="Cluster_result.csv", row.names=FALSE) # full data file with cluster assignments
write.csv(means, file="ClusterMeans.csv", row.names=FALSE) # list of means by cluster

#end

