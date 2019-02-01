# Do not remove any of the comments. These are marked by #

# HW 3 - Due Monday, Oct 1, 2018 in moodle and hardcopy in class

# (1). Please upload R code and report to Moodle 
#      with filename: HW3_IS457_YourClassID.
# (2). Turn in hard copy of your report in class
#      without your name but only your class ID

## Important: Make sure there is no identifying information on your printout, including name, username etc. 
## Only include your class ID on there.

### ClassID:

# In this assignment you will practice "apply" family function
# You will also work with linear regression in R

# Part 1. Start with "apply" function (9pts)

# (1) Create a new matrix by the following codes, briefly but completely explain what each line is doing. (3pts)
set.seed(457)
one_num <- sample(1:9,25,replace=TRUE)
one_matrix <- matrix(one_num,ncol=5)

### Your answer here


# Use the "apply" function on one_matrix to answer questions(2)(3)(4).

# (2) Calculate the mean of each row. (1pt)
#     Calculate the sum of each column. (1pt)

### Your code here

apply(one_matrix, 1, mean)

apply(one_matrix, 2, sum)


# (3) Find the difference between the biggest and the smallest number for each row. (2pts)

### Your code here

apply(one_matrix, 1, max)-apply(one_matrix, 1, min)

# (4) Calculate the sum of all numbers smaller than 5 for each column. (2pts)

### Your code here

apply(apply(one_matrix, c(1, 2), function(x){ if(x<5) return (x) else return(0) }), 2, sum)

# Part 2. Get familiar with "sapply" and "lapply" functions (6pts)

# (5) Let's play with the "iris" dataset. Here's the command to load it:
data(iris)

#     Tell me the data types of each column(variable) by using "sapply" function (1pt)

### Your code here

sapply(iris[,1], class)
sapply(iris[,2], class)
sapply(iris[,3], class)
sapply(iris[,4], class)
sapply(iris[,5], class)

# (6) Do question(5) again and get the same result (check the data type), but use "lapply" function. (1pt)
#     Based on the output format, briefly explain the difference between "sapply" and "lapply" functions. (2pts)

### Your code/answer here

lapply(iris[,1], class)
lapply(iris[,2], class)
lapply(iris[,3], class)
lapply(iris[,4], class)
lapply(iris[,5], class)

# (7) Now create a new list from one_matrix by using the following codes.
list_1 <- list(a=one_matrix[,1],b=c(one_matrix[,2],one_matrix[,3]))

#     Take natural log of this list using the following code:
log(list_1)

#     Please briefly explain why the code above doesn't work. (1pt)

#     Now write code that takes the natural log of list_1 (using the apply family of functions). (1pt)

### Your code/answer here

sapply(list_1, log)

# Part 3. Try "tapply" function and its equivalents. (12pts)

# we will use the data set "mtcars"; familiarize yourself with it first. Here is the code to load the data:
data(mtcars)

# (8) Subset 4 columns "mpg", "hp", "wt" and "am" to a new data frame, named df_car. (1pt)
#     In df_car, convert "am" to a factor variable with two levels: "automatic" and "manual" (2pts)
#     (Hint: read help documentation of mtcars)

### Your code here

df_car = mtcars[ , c("mpg","hp", "wt", "am")]

df_car$am = factor(df_car$am, labels = c("automatic", "manual"))

str(df_car)

# (9) Use "tapply" function on df_car to find the mean of mpg by different am levels. (2pts)

### Your code here

tapply(df_car$mpg, df_car$am, mean)

# (10) Look up the function "by".
#      Obtain the mean of mpg, hp and wt, by different am levels, using only one function call. (2pts)

### Your code here

by(df_car[, 1:3], df_car[,"am"], apply, 2, mean)

# (11) Do question(10) again by using the "aggregate" function. You may need to look this up as well. (2pts)

### Your code here

aggregate(df_car[,1:3], df_car["am"], mean)

# (13) Same as question(10), but this time use the combination of "apply" and "tapply" functions to get the same results. (3pts)

### Your code here

apply(df_car[1:3],2,tapply,df_car$am,mean)

# Part 4. More functions in "apply" family (4pts)

# (14) "mapply" function is a multivariate version of "sapply".
#      Create list_2 by following code:
list_2 <- list(a=one_matrix[,2],b=c(one_matrix[,3],one_matrix[,4]))
#      Add up corresponding elements in list_1 and list_2, then take natural log of it. (2pts)

### Your code here

sapply(mapply("+", list_1, list_2),log)

# (15) "rapply" function is used to apply a function to all elements of a list recursively.
#      Create list_3 by following code:
list_3 <- list(aa=one_matrix[,1],b=c("this","is","character"))
#      Calculate the natural log of all integer in list_3. (2pts)
#      Do not remove characters in the list or subsetting.

### Your code here

rapply(list_3, log, classes = "integer", how = "replace")

# Part 5. Linear regression (9pts)

# (16) Look back in the "iris" dataset.
data(iris)
#      Fit a simple linear regression model using lm() to predict Petal.Length from Petal.Width. (2pts)

#      How do you interpret the result of regression? Hint: interpret the two coefficients from the output of lm(). (2pts)

### Your code/answer here

lm(Petal.Length ~ Petal.Width, data = iris)

# (17) Create a scatterplot with x-axis of Petal.Width and y-axis of Petal.Length. (2pt)

#      Add the linear regression line you found above to the scatterplot. (1pt) 

#      Provide an interpretation for your plot. (2pts)

### Your code/answer here

plot(iris$Petal.Width,iris$Petal.Length, pch = 2, col = "blue", main = "Regression model for Petal width and Petal Length", xlab = "Petal Width", ylab = "Petal Length")
abline(lm(Petal.Length ~ Petal.Width, data = iris))