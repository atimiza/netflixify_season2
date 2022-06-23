library(ggplot2)
library(dplyr)
table(d1$Year)

count <- table(d1$Year)

#trying using percent because margin is too big 
percent <- table(d1$Year)/8807
percent
par(mar = c(2, 2, 2, 2))
barplot(count, main = "Frequency of Years", xlab = "Year", ylab = "Count", col = "red")

#secong graph
table(d1$Type)

# Create the data for the chart
H <- c(6130,2676)
M <- c("Movie","TV Show")


# Plot the bar chart 
barplot(H,names.arg=M,xlab="Type",ylab="Total number",col="blue",
        main="Count of type in dataset",border="red")

