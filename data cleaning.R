setwd("C:\\Users\\user\\OneDrive\\Documents\\DS SEM 2\\WIE2003 Intro to Data Sc")
d1=read.csv("netflix.csv", FALSE, ",")

# Display for number of rows and columns
dim(d1)

# Check for class of the data 
class(d1)

# Check for names of columns with its respective type
str(d1)

# Check for existence of null value inside the data
sum(is.na(d1))

# Remove duplicate data
d1 <- unique(d1)
# Check for summary for whole data
summary(d1)
# Check for preview of the whole data
head(d1)

# Remove unwanted column
d1 <- subset(d1, select=-c(V1, V4, V7))

# Remove unwanted row which is the first row of data
d1 = d1[-1,]

# Rename the columns to a more suitable name
names(d1)[names(d1) == "V2"] = "Type"
names(d1)[names(d1) == "V3"] = "Title"
names(d1)[names(d1) == "V5"] = "Cast"
names(d1)[names(d1) == "V6"] = "Country"
names(d1)[names(d1) == "V8"] = "Year"
names(d1)[names(d1) == "V9"] = "Rating"
names(d1)[names(d1) == "V10"] = "Duration"
names(d1)[names(d1) == "V11"] = "Genre"
names(d1)[names(d1) == "V12"] = "Synopsis"

# Check for preview of final data to be used
head(d1)
tail(d1)