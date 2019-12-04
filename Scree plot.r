# tell R where your file is located
#setwd('INSERT_HERE')

# Determine number of clusters
wss <- (nrow(s_mydata)-1)*sum(apply(s_mydata,2,var))
for (i in 2:15) wss[i] <- sum(kmeans(s_mydata, centers=i)$withinss)
plot(1:15, wss, type="b", xlab="Number of Clusters", ylab="Within groups sum of squares")

#end

