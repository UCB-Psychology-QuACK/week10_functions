# QuACK 2020
# Week 10 - Functions
# Elena Leib & Willa Voorhies


#### Set options ####
options(stringsAsFactors = FALSE)

#### Load packages ####
library(tidyverse)


#### Warm up ####

# Here are vectors with ages for 100 students in each grade
grade4 <- rnorm(100, mean = 9.5)
grade5 <- rnorm(100, mean = 10.5)
grade6 <- rnorm(100, mean = 11.5)
grade7 <- rnorm(100, mean = 12.5)
grade8 <- rnorm(100, mean = 13.5)

# Using hist(), make a histogram of the ages for each grade. Check out ?hist if you have any questions.
# Be sure to name each graph with the title "Historgram of Participant Ages in Grade ..." and say the grade number. (use main = "")
# Also, make the color of each plot different (use col = )

hist(grade4, main = "Historgram of Participant Ages in Grade 4", col = "red")
hist(grade5, main = "Historgram of Participant Ages in Grade 5", col = "orange")
hist(grade6, main = "Historgram of Participant Ages in Grade 6", col = "yellow")
hist(grade7, main = "Historgram of Participant Ages in Grade 7", col = "green")
hist(grade8, main = "Historgram of Participant Ages in Grade 8", col = "blue")
# Can also add an argument xlab = "Ages" to change the name of the x-axis

# This is annoying to write so many times. We could us a for loop!

data <- list(grade4, grade5, grade6, grade7, grade8) # List of 5 vectors
grades <- c(4:8)
colors <- c("red", "orange", "yellow", "green", "blue")
for(i in 1:length(data)) { # iterates through list
  ages <- data[[i]] # Gets current vector
  hist(ages, main = paste("Historgram of Participant Ages in Grade", grades[i]), col = colors[i]) # Can add xlab = "Ages"
}

# That's pretty good, but what if we want to make something even more general than that? What if we want to be able to take a vector of ages for any grade as input and output a histogram? 

## A note about vectors versus lists
# vectors --> only hold one type of data!
x <- c(1, 2, 3)
x1 <- c(x, "4")

# lists can hold more than one type
# Create list
x2 <- list(1, 2, 3, "4", TRUE, c(1, 2, 3))
# You can name each entry (i.e., position, index) of the list
names(x2) <- c("1", "2", "3", "4", "bool", "vec")

# Indexing lists
x2$bool # works for named lists, like x2
x2[[1]] # use double bracket [[]] to index using numers

#### Group Practice ####

# Let's start with a simple example
# 1) Goal: Make a function that takes a string, and prints out that string plus an exclamation point at the end!
# Example:
# Input     Output
# "Hello"   "Hello!"

# Step 1: Write the function
addExcl <- function(text) {
  new_text <- paste0(text, "!")
  return(new_text)
}

# Step 2: Call (use) the function
new_text <- addExcl("hello")
addExcl("Hi, my name is Elena")

# And don't forget to add a comment explaining what your function does, what arguments it takes, and what it returns!

# 2) Let's use functions to do our histogram example from the warm up!

makeAgeHist <- function(ages, grade, color) {
  hist(ages, main = paste("Historgram of Participant Ages in Grade", grade), col = color)
  #return(h)
}

makeAgeHist(grade4, 4, "red")


# We briefly talked about setting seeds for randomization:
set.seed(342)
makeAgeHist(rnorm(100, mean = 21.5), 14, "purple")

# 3) Write your version of the sum function! Call it my.sum

my.sum <- function(x) {
  sum.x <- 0
  for(i in 1:length(x)) {
    sum.x <- sum.x + x[i]
  }
  return(sum.x)
}

my.sum(1:5)
sum(1:5)

my.sum(c(1, 3, 5))
sum(c(1, 3, 5))

# But what about this...
my.sum(c(1, 3, NA, 7))
sum(c(1, 3, NA, 7))
sum(c(1, 3, NA, 7), na.rm = TRUE)


# 4) Now add the na.rm functionality to your sum function! Name it my.sum2
# This function models good commenting practice!
my.sum2_a <- function(x, na.rm) {
  # Input: x - numeric vector
  #        na.rm - Logical (either true or false) that indicates how to handle NAs in the input vector.
  # Output: my.sum - sum of numbers in numeric vector
  
  # Start sum cummulator at 0
  sum.x <- 0
  for(i in 1:length(x)) {
    if(na.rm & !is.na(x[i])) sum.x <- sum.x + x[i]
    if(!na.rm) sum.x <- sum.x + x[i]
    
  }
  return(sum.x)
}


# Another way to do it with the logic:
# my.sum2_a <- function(x, na.rm) {
  # my.sum <- 0
  # 
  # for(i in 1:length(x)) {
  #   if(na.rm) {
  #     if(!is.na(x[i])) {
  #       my.sum = my.sum + x[i]
  #     }
  #   } else {
  #     my.sum = my.sum + x[i]
  #   }
  # return(my.sum)
# }

my.sum2_a(c(1, 3, NA, 7), na.rm = TRUE)
sum(c(1, 3, NA, 7), na.rm = TRUE)

my.sum2_a(c(1, 3, NA, 7), na.rm = FALSE)
# But the sum function doesn't need to set na.rm to FALSE... it is already the default!
sum(c(1, 3, NA, 7))


# Set na.rm default to FALSE
# By doing this, R will set na.rm to FALSE when the user doesn't specify it. In other words, it will assume that you don't want to remove NAs.

my.sum2 <- function(x, na.rm = FALSE) {
  sum.x <- 0
  for(i in 1:length(x)) {
    if(na.rm & !is.na(x[i])) sum.x <- sum.x + x[i]
    if(!na.rm) sum.x <- sum.x + x[i]
    
  }
  return(sum.x)
}

my.sum2(c(1, 3, NA, 7), na.rm = TRUE)
sum(c(1, 3, NA, 7), na.rm = TRUE)

my.sum2(c(1, 3, NA, 7))
sum(c(1, 3, NA, 7))

#### More practice ####

# 1) Now write your version of the mean function. Call it my.mean. Use your new my.sum2 function! And make sure it has na.rm functionality

# Option #1
my.mean <- function(x, na.rm = FALSE) {
  x.sum <- my.sum2(x, na.rm)
  x.length <- ifelse(na.rm, length(x[!is.na(x)]), length(x))
  return(x.sum / x.length)
}

# Option #2
my.mean2 <- function(x, na.rm = FALSE) {
  if(na.rm) {
    x.noNA <- x[!is.na(x)]
    return(my.sum2(x.noNA) / length(x.noNA))
    
  } else {
    return(my.sum2(x) / length(x))
  }
}

mean(c(1, 3, NA, 7))
mean(c(1, 3, NA, 7), na.rm = TRUE)

my.mean(c(1, 3, NA, 7))
my.mean(c(1, 3, NA, 7), na.rm = TRUE)

my.mean2(c(1, 3, NA, 7))
my.mean2(c(1, 3, NA, 7), na.rm = TRUE)


# The following problems were adapted from YaRrr!
# https://bookdown.org/ndphillips/YaRrr/functions.html

# 2a) Create a function called oh.god.how.much.did.i.spend that helps hungover pirates figure out how much gold they spent after a long night of pirate debauchery.
# The function will have three inputs: grogg: the number of mugs of grogg the pirate drank, port: the number of glasses of port the pirate drank, and crabjuice: the number of shots of fermented crab juice the pirate drank.
# Based on this input, the function will calculate how much gold the pirate spent. We'll also assume that a mug of grogg costs 1, a glass of port costs 3, and a shot of fermented crab juice costs 10.

# Write the function!

oh.god.how.much.did.i.spend <- function(grogg, port, crabjuice) {
  total <- 1 * grogg + 3 * port + 10 * crabjuice
  return(total)
}


# Test cases
# Tamara: 10 groggs, 3 port, 0 crabjuice
# Test that result is 19!

(tamara.spent <- oh.god.how.much.did.i.spend(grogg = 10, port = 3, crabjuice = 0))

# Cosima: 0 groggs, 0 port, 7 crabjuice
# Test that the result is 70.

(cosima.spent <- oh.god.how.much.did.i.spend(grogg = 0, port = 0, crabjuice = 7))

# And 2 more test cases to make sure your function is doing what you think it is doing!


# 2b) How can you improve your function? Can you set any devault argument values to make the function calls more simple?
oh.god.how.much.did.i.spend2 <- function(grogg = 0, port = 0, crabjuice = 0) {
  total <- 1 * grogg + 3 * port + 10 * crabjuice
  return(total)
}

(tamara.spent <- oh.god.how.much.did.i.spend(grogg = 10, port = 3)) # Get an error! "crabjuice" is missing!
(tamara.spent <- oh.god.how.much.did.i.spend2(grogg = 10, port = 3)) # Much better
(cosima.spent <- oh.god.how.much.did.i.spend2(crabjuice = 7)) # So much simpler to write out!


# 3) Write a function called is.it.true(). The function will take a single input x. If the input x is TRUE, the function will print one sentence. If the input x is FALSE, it will return a different sentence. The sentences can be whatever you'd like as long as they are different.

is.it.true <- function(x) {
  if(x) print("x is true")
  else print("x is false")
}

is.it.true2 <- function(x) {
  if(x == TRUE) print("x was true!")
  if(x == FALSE) print("x was false!")
}

# Here are some test cases:
is.it.true(TRUE)
is.it.true(FALSE)
is.it.true(10 > 0)
is.it.true(10 < 0)

# Write some more test cases:




# 4) Captain Jack is convinced that he can predict how much gold he will find on an island with the following equation: (a * b) - c * 324 + log(a), where a is the area of the island in square meters, b is the number of trees on the island, and c is how drunk he is on a scale of 1 to 10. Create a function called Jacks.Equation that takes a, b, and c as arguments and returns Captain Jack's predictions.
# Here is an example of Jacks.Equation in action:
# Jacks.Equation(a = 1000, b = 30, c = 7)
## [1] 27739

Jacks.Equation <- function(a, b, c) {
  total.gold <- (a * b) - c * 324 + log(a)
  return(total.gold)
}

# Try running the equation on the example. Do you get your expected output?


# Write a few more test cases:


# What would "break" your function?



# 5) Often times you will need to recode values of a dataset. For example, if you have a survey of age data, you may want to convert any crazy values (like anything below 0 or above 100) to NA. Write a function called recode.numeric() with 3 arguments: x, lb, and ub. We'll assume that x is a numeric vector. The function should look at the values of x, convert any values below lb (lower bound) and above ub (upper bound) to NA, and then return the resulting vector. 
# Here is the function in action:
# recode.numeric(x = c(5, 3, -5, 4, 3, 97), lb = 0, ub = 10)
## [1]  5  3 NA  4  3 NA


recode.numeric <- function(x, lb, ub) {
  x.updated <- c()
  for(i in 1:length(x)) {
    x.updated[i] <- ifelse(x[i] < lb | x[i] > ub, NA, x[i])
  }
  
  return(x.updated)
}

recode.numeric(x = c(5, 3, -5, 4, 3, 97), lb = 0, ub = 10)


# Write 2 more test cases: