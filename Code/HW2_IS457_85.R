# Do not remove any of the comments. These are marked by #
# HW 2 - Due Monday, Sep 24 2018 in moodle and for non-online students hardcopy in class.
# (1). Please upload R code and report to Moodle with filename: HW2_IS457_YourCourseID.
# (2). Turn in hard copy of your report in class.

### Class ID:

# In this assignment you will practice manipulating vectors and dataframes.
# You will take subsets, create new data structures, and end with creating a fantastic plot.
# You will work with the CO2 dataset in the R library and a dataset called SFHousing. 
# Before beginning with the datasets however, you will do some warm up exercises.



# PART 1. Warm up (4 pts)
# Q1. Create a Vector like this (0 0 0 3 3 3 6 6 6 9 9 9 12 12 12 15 15 15 18 18 18) 
#     with functions seq() and rep() and call it "vec" (1 pt)

### Your code below

vec = rep(seq(0,18,3), each = 3)
vec

# Q2. Calculate the fraction of elements in vec that are more than or equal to 9. (2 pts)
# hint: R can do vectorized operations. 

### Your code below

frac = sum(vec>=9)/length(vec)
frac

# Q3. Create a Vector like this (1 2 2 3 3 3 4 4 4 4 5 5 5 5 5)
#     with functions rep() and the : operator (1 pt)

### Your code below

vec2 = rep(1:5, c(1, 2, 3, 4, 5))
vec2

# PART II. CO2 Data (9 pts)
# Q4. Use R to generate descriptions of the CO2 data which is already available with the base R installation (it
# is called CO2 in R. Please note that we are using the CO2 dataset and not the similarly named co2 dataset). 
# Print out the summary of each column and the dimensions of the dataset. (2 pts.)
# (hint: you may find the summary() and dim() useful). 
# Write up your descriptive findings and observations of the R output. (1 pt.)

### Your code below:

summary(CO2)
dim(CO2)

### Your answer below:

# The CO2 dataset consists of 84 observations for 5 variables describing the
# carbon dioxide uptake in grass plants. The variables are: 1) Plant - factor variable 
# for giving unique id for each plant. 2) Type - factor variable for location of the plant.
# 3) Treatment - factor variable for the treatment given to the plant. 4) conc - numeric 
# variable for concentration of CO2. 5) uptake - numeric variable the uptake rate in the 
# plant observed.


# Q5. Show last 8 plants' uptake values (1 pt.)

### Your code below:

tail(CO2, n = 8)

# Q6. Show all plants' uptake values except the first 20 plants'. (1 pt.)

### Your code below:

CO2$uptake[-seq(1:20)]

# Q7. Calculate the mean of uptake subseted by the "Treatment" variable.(1 pt)
# hint: apply function family.

### Your code below:

mean_uptake = tapply(CO2$uptake, CO2$Treatment, mean)
mean_uptake

# Q8. Create a logical vector uptake_treatment . (2 pts)

# For the plants with Chilled treatment (Treatment == "chilled"), return value TRUE when uptake > 30.
# For the plants with Non-Chilled treatment (Treatment == "nonchilled"), return value TRUE when uptake > 40.

### Your code below:

uptake_treatment = as.logical((CO2$Treatment=="nonchilled"&CO2$uptake>40)|(CO2$Treatment=="chilled"&CO2$uptake>30))
uptake_treatment

# Q9. Here is an alternative way to create the same vector in Q8.
# First, we create a numeric vector uptake_test that is 30 for each plant with chilled treatment
# and 40 for each plant with non chilled treatement. To do this, first create a vector of length 2 called 
# test_val whose first element is 40 and second element is 30. (1 pt)

### Your code below:

test_val = c(40,30)

# Create the uptake_test vector by subsetting test_val by position, where the 
# positions could be represented based on the Treatment column in CO2. (1 pt)

### Your code below

uptake_test = test_val[CO2$Treatment]

# Finally, use uptake_test and the uptake column to create the desired vector, and
# call it uptake_treatment2. (1 pt)

### Your code below

uptake_treatment2 = CO2$uptake>uptake_test
uptake_treatment2
all.equal(uptake_treatment, uptake_treatment2)

#PART 3.  San Francisco Housing Data (25 pts.)
#
# Load the data into R.
load(url("https://www.stanford.edu/~vcs/StatData/SFHousing.rda"))

# Q10. (3 pts.)
# What objects are in SFHousing.rda? Give the name and class of each.

### Your code below

names(housing)
str(housing)

### Your answer here

# The housing dataset consists of the following objects along with their class.

# Object Name	  Object class
# 1.	county		Factor
# 2.	city		  Factor
# 3.	zip		    Factor
# 4.	street		Character
# 5.	price	  	Numeric
# 6.	br		    Integer
# 7.	lsqft		  Numeric
# 8.	bsqft		  Integer
# 9.	year		  Integer
# 10.	date		  POSIXt
# 11.	long		  Numeric
# 12.	lat		    Numeric
# 13.	quality		Factor
# 14.	match		  Factor
# 15.	wk		    Date

# Q11. give a summary of each object, including a summary of each variable and the dimension of the object. (4 pts)

### Your code below

dim(housing)
summary(housing$county)
summary(housing$city)
summary(housing$zip)
summary(housing$street)
summary(housing$price)
summary(housing$br)
summary(housing$lsqft)
summary(housing$bsqft)
summary(housing$year)
summary(housing$date)
summary(housing$long)
summary(housing$lat)
summary(housing$quality)
summary(housing$match)
summary(housing$wk)

# Q12. After exploring the data (maybe using the summary() function), describe in words the connection
# between the two objects (e.g., what links them together). (2 pts)

### Write your response here

# The county and zip objects are related in the sense that the county name can 
# be used to determine the range of zip values for that county. These variables 
# are also linked to the city object as the range of zip values  and the county 
# can also be decided by the city name.

# Q13. Describe in words two problems that you see with the data. (2 pts)

### Write your response here

# One issue I can observe in the dataset is the use of different date formats 
# for the date and wk variables. Using one date format can maintain data 
# consistency in the dataset. The other issue I can find is the existence of 
# garbage values in the year variable viz. 0, 1, 2, 3894, 3885, 3881 and so on.
# These values are either too old or in the future to hold any meaning. 
# We could also have used a factor datatype instead of integer for the year 
# variable.

# Q14. (2 pts.)
# We will work with the houses in San Francisco, Fremont, Vallejo, Concord and Livermore only.

# Subset the housing data frame so that we have only houses in these cities
# and keep only the variables county, city, zip, price, br, bsqft, and year.

# Call this new data frame SelectArea. This data frame should have 36686 observations
# and 7 variables. (Note you may need to reformat any factor variables so that they
# do not contain incorrect levels)

### Your code below

cities = c("San Francisco", "Fremont", "Vallejo", "Concord", "Livermore")
col = c("county", "city", "zip", "price", "br", "bsqft", "year")
SelectArea = housing[is.element(housing$city,cities), col]
SelectArea$city = factor(SelectArea$city, levels = cities)
str(SelectArea)

# Q15. (3 pts.)
# We are interested in making plots of price and size of house, but before we do this
# we will further subset the housing dataframe to remove the unusually large values.

# Use the quantile function to determine the 95th percentile of price and bsqft
# and eliminate all of those houses that are above either of these 95th percentiles
# Call this new data frame SelectArea (replacing the old one) as well. It should 
# have 33693 observations.

### Your code below

# Code to calculate the value of 95th percentile of price
q_value_bsqft = quantile(SelectArea$bsqft, probs = c(0.95), na.rm = TRUE)

# Code to calculate the value of 95th percentile of bsqft
q_value_price = quantile(SelectArea$price, probs = c(0.95), na.rm = TRUE)

# Code to select only those rows fulfilling all the conditions
SelectArea = SelectArea[SelectArea$price<q_value_price & SelectArea$bsqft<q_value_bsqft & !is.na(SelectArea$bsqft) & !is.na(SelectArea$price),]
str(SelectArea)

# Q16. (2 pts.)
# Create a new vector that is called price_per_sqft by dividing the sale price by the square footage
# Add this new variable to the data frame.

### Your code below

SelectArea$price_per_sqft = SelectArea$price/SelectArea$bsqft
head(SelectArea$price_per_sqft)

# Q17. (2 pts.)
# Create a vector called br_new, that is the number of bedrooms in the house, except
# when the number is greater than 5, set it (br_new) to 5.  

### Your code below

br_new = SelectArea$br
br_new[br_new>5] = 5
head(br_new)

# Q18. (4 pts. 2 + 2 - see below)
# Use the heat.colors function to create a vector of 5 colors, call this vector rCols.
# When you call this function, set the alpha argument to 0.25.

# Create a vector called brCols where each element's value corresponds to the color in rCols 
# indexed by the number of bedrooms in the br_new.

# For example, if the element in br_new is 3 then the color will be the third color in rCols.
# (2 pts.)

### Your code below

rCols = heat.colors(5,alpha = 0.25)
rCols
brCols = rCols[br_new]
head(brCols)

######
# We are now ready to make a plot!
plot(price_per_sqft ~ bsqft, data = SelectArea,
     main = "Housing prices in the San Francisco Area",
     xlab = "Size of house (square ft)",
     ylab = "Price per square foot",
     col = brCols, pch = 18, cex = 0.5)
legend(legend = 1:5, fill = rCols, "topright")

# what's your interpretation of the plot? 
# e.g., the trend? the cluster? the comparison? (1 pt.)

# From the above plot it can be observed that as the size of the house (square 
# ft) increases we see a decrease in the price per square foot of the house.
# Also, the houses with more bedrooms tend to be cheaper than the less 
# bedrooms having the same square footage of the house. We can also observe 
# that most of the houses have 1, 2 bedrooms are clustered below the 1250 
# square feet size range which makes sense as bigger houses tend to have 
# more bedrooms.
