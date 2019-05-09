seq(3,17,2)
#-------------Subsetting-------------------
# Create remove
remove = c(3,56:59)

# Create att2
att2 = att[-remove,]

# Find indices of sugar NA values: missing
missing <- is.na(food3$sugars_100g)

# Replace NA values with 0
food3$sugars_100g[missing] <- 0
missing
# Create first histogram
hist(food3$sugars_100g, breaks = 100)

# Create food4
food4 <- food3[food3$sugars_100g > 0,]

# Find the row number of the incorrect value: i
i = which(mbta6$Boat >10)
i
# Replace the incorrect value with 4
mbta6$Boat[i] = 4

#--------------------------------------gdata--------------------------------
read.xls#removes blank rows automatically

#-----------------------------------------stringr---------------------
str_detect #to find patterns and get a vector of logicals T/F used for subsetting
# Find entries containing "plasti": plastic
plastic = str_detect(food3$packaging,"plasti")
plastic

#using colnames + str_detect = subsetting mastery
nutrition = str_detect(colnames(food3),"100g")
nutrition
food4 = food3[,nutrition]
# Print the sum of plastic
sum(plastic)
nrow(food3)
#useful for replacing crap in dataset gotta be careful with special symbols like .
# use \\ to cancel out the regex property
str_replace_all
#example
att5$state <- str_replace_all(att5$state,"\\.","")
att5$state

#trims off white space
str_trim
#example
att5$state <- str_trim(att5$state)

str_
#----------------------tidyr--------
spread# column is different modes and value is thousands of riders, makes columns for 
#different modes
mbta5 = spread(mbta4, key = mode, value = thou_riders)

gather
#months are the columns so takes a 8x59---use minus to eliminate columns
gathered_oes <- gather(data = clust_oes, 
                       key = year, 
                       value = mean_salary, 
                       -occupation, -cluster)
mbta4 = gather(mbta3, key = "month", value = "thou_riders",-mode)
separate#--for columns
#month looks like 2007-01, 2007-02 etc
mbta6 = separate(mbta5,month,c("year","month"), sep="-")
?separate
#--------------------------dplyr-----------------
glimpse() #dplyr version of dtr()

#---------------------------data.table---------------------
fread() 
#use data.table = F to import data frame
food = fread("food.csv", data.table = F)