# Do not remove any of the comments. These are marked by #

# HW 1 - Due Monday Sep 17, 2018 in moodle at 1pmCT and hardcopy in class.

# (1). Please upload R code and report to Moodle 
#      with filename: HW1_IS457_YourClassID.
# (2). Turn in a hard copy of your report in class 
#      without your name but only your class ID, 
#      violators will be subject to a points deduction.

## Important: Make sure there is no identifying information on your printout, including name, username etc. 
## Only include your class ID on there. 

# Part 1. LifeCycleSavings Data

# In this part, we will work with a built-in dataset -- LifeCycleSavings.
# (1) R has a built-in help funtion, write your call to the help function below, as well as something
# that you learned about this dataset from the help function. (1 pt)

# Your code/answer here

help(LifeCycleSavings)

# This dataset gives us information of life-sycle savings from the decade 
# 1960-1970 from 50 countries according to the hypothesis developed by Franco 
# Modigliani.It contains 50 observations from 50 countries on 5 variables
# viz. 1) savings ratio 2) population under 15 3) population over 75 
# 4) real per-capita disposable income (di) 5) percent growth rate of di

# (2) Describe this dataset (structure, variables, value types, size, etc.) (2 pts)

# Your code/answer here

summary(LifeCycleSavings)
str(LifeCycleSavings)

# This dataset consists of 5 variables (columns) and 50 observations (rows) 
# for the variables from 50 countries. The name for each column is 
# "sr", "pop15", "pop75", "dpi", "ddpi" respectively. The datatype for each 
# column is of numeric. The dataset has the dimensions of [1] 50  5 which 
# stands form 50 rows and 5 columns. The summary() function summarizes the 
# values of each variable according to its data type. In this case its gives 
# us the mean, median, min, max value for each columns.

# (3) What is "aggregate personal savings" in this dataset? Calculate the average aggregate 
# personal savings of these 50 countries. (1 pt)

# Your code/answer here

mean(LifeCycleSavings[["sr"]])

# The aggregate personal savings in this dataset is the ratio between the personal savings and the 
# disposable income of individual. It signifies the average savings rate of the individuals from a
# particular country from the decade 1960-1970
# Running the above command gives us the average aggregate personal savings to be 9.671.

# (4) What is "dpi" in this dataset? Find the highest and lowest dpi. (2 pts)

# Your code/answer here

summary(LifeCycleSavings[4])
min(LifeCycleSavings[4])
max(LifeCycleSavings[4])

# The dpi in the dataset is the real per-capita disposable income for each country.
# Disposable income means the income the remains in a person's hand after deducting taxes
# and other mandatory charges. The person can either spend it or save it.
# Per-capita means that the income is for each individual rather than household income.
# The highest and the lowest dpi in the dataset is 4001.89 and 88.94 respectively.

# (5) How many countries have a dpi above median? (2 pts)
# hint: you might need to find a function to count rows.

# Your code/answer here

m = median(LifeCycleSavings[["dpi"]]) 
nrow(LifeCycleSavings[LifeCycleSavings$dpi > m,])

# The above code shows us that there are 25 countries having a dpi greater than median.

# (6) What is the highest aggregate personal savings of the countries 
# whose pop15s are more than 10 times their pop75s? (2 pts)

# Your code/answer here

d = LifeCycleSavings[LifeCycleSavings$pop15 > (10*LifeCycleSavings$pop75),]
max(d["sr"])

# The highest aggregate personal savings of the countries is 21.1.

# (7) For the countries with dpi above the 75th percentile, what is their average aggregate personal savings? 
# For the countries with dpi above the 75th percentale, what is their median aggregate personal savings?
# Why are these two statistics different?

# Your code/answer here

mean(LifeCycleSavings$sr[LifeCycleSavings$dpi > 1795.62])
median(LifeCycleSavings$sr[LifeCycleSavings$dpi > 1795.62])

# The values are different because the mean averages all the values evenly and 
# even considers any outlier values whereas the median sorts the sample values 
# and then picks out the middlemost value in case of odd number of samples and 
# takes the average of two middle values in case of even number of samples.

# (8) Let's look at countries with dpi below the 25th percentile. What is their average and their median
# aggregate personal savings? 
# Why are these two statistics different? Is the pattern of difference different than what you saw in 
# Q7? Why or Why not?

# Your code/answer here

mean(LifeCycleSavings$sr[LifeCycleSavings$dpi < 288.21])
median(LifeCycleSavings$sr[LifeCycleSavings$dpi < 288.21])

# The values are different for the same reasons they were different in Q7. 
# There is a strong positive correlation between the values of mean and median. 
# The pattern of difference is same as that of the Q7 as the relationship between
# mean and median remains the same across different quartile ranges.

# (9). (3 pts)
# Try running each expression in R.
# Record the error message in a comment
# Explain what it means. 
# Be sure to directly relate the wording of the error message with 
# the problem you find in the expression.

LifeCycleSavings[LifeCycleSavings$pop15 > 10]

### Error message here

#Error in `[.data.frame`(LifeCycleSavings, LifeCycleSavings$pop15 > 10) : 
#  undefined columns selected

### Explanation here

# Explanation: The above error is shown because R expects the expression 
# between the square brackets to subset rows and columns in case of a dataframe.
# The above expression LifeCycleSavings$pop15 > 10 subsets only the rows of the 
# dataframe and does not provide any condition for the columns. If we want the
# above code to work for all columns then the correct statement is 
# LifeCycleSavings[LifeCycleSavings$pop15 > 10, ]. The comma subsets the 
# column by all.

mean(pop15,pop75)

### Error message here

# Error in mean(pop15, pop75) : object 'pop15' not found

### Explanation here

# Explanation: pop15 is a variable of the dataset LifeCycleSavings. So to use it we must
# access them through the dataset name. Hence R throws a no object found error.

mean(LifeCycleSavings$pop15, LifeCycleSavings$pop75)

### Error message here

#Error in mean.default(LifeCycleSavings$pop15, LifeCycleSavings$pop75) : 
#'trim' must be numeric of length one

### Explanation here

# The syntax for the mean function is mean(object, trim = ). Here LifeCycleSavings$pop75 does not have
# length one. So it cannot be used as a trim value.

# Part 2. Plot analysis

# Run the following code to make a plot.
# (don't worry right now about what this code is doing)
plot(LifeCycleSavings$pop15, LifeCycleSavings$pop75, xlab = 'pop15', ylab = 'pop75', main = 'pop15 vs pop75')

# (1) Use the Zoom button in the Plots window to enlarge the plot. 
# Resize the plot so that it is long and short, making it easier to read.
# Include an image of this plot in the homework you turn in. (1 pt)

# Your answer here


# (2) Make an interesting observation about the relationship between
#     pop15 and pop75 based on your plot. 
# (something that you couldn't see with the calculations so far.) (1 pt)

# Your answer here

# The relation between the two variables show negative correlation from the 
# above graph which means that as the percentage of population under 15 
# increases the percentage of population over 75 decreases. This makes sense 
# as the population distribution is over the entire age range and is hardly 
# concentrated over and under both the age range.

# (3) Based on our analysis so far, what interesting question about the LifeCycleSavings data
# would you like to answer, but don't yet know how to do it? (1 pt)

# Your answer here

# The relationship between the pop75 and pop15 variables divides the data into 
# two clusters. I would like to know what factors might have influenced this 
# clustering of data.

# Part 3. Random number generators
# For the remainder of this assignment we will work with 
# one of the random number generators in R.

# (1) Use you UIN number to set the seed in the set.seed() function. (1 pt)

# Your code here

set.seed(668936908)

# (2) Generate a vector called "normsample" containing 1000 random samples from a 
# normal distribution with mean 2 and standard deviation 1. (1 pt)

# Your code here

normsample = rnorm(1000,2,1)
plot(normsample)

# (3) Calculate the mean and standard deviation of the normsample. (2 pts)

# Your code here

normsample_mean = mean(normsample)
normsample_mean

normsample_sd = sd(normsample)
normsample_sd

# The mean of the above normsample is 2.02 and the standard deviation is 0.99.

# (4) Use logical operations (>,<,==,....) to calculate
# the fraction of the values in "normsample" that are more than 3. (1 pt)

# Your code here

no_greaterthan3 = length(normsample[normsample>3])
fraction = (no_greaterthan3/length(normsample))
fraction

#Running the above code gives me the fraction value as 0.164

# (8). Find the area under the normal(2, 1) curve to the right of 3.  
# This should be the probability of getting a random value more than 3. 
# (Hint: Look up the help for rnorm. You will see a few other functions listed.  
#  Use one of them to figure out about what answer you should expect.)
# What value do you expect? 
# What value did you get? 
# Why might they be different? (3 pts)

# Your code here

right_area = pnorm(3, mean = 2, sd = 1, lower.tail = FALSE)
right_area

# The value I expected was 0.158
# The value I got is 0.156
# The reason they are different is because of the chance factor. The expected 
# value is a theoretical value for the given outcome. The real value 
# corresponds to this value as it is closer to this value but may never the 
# same as it because of the chance factor influencing the real value.