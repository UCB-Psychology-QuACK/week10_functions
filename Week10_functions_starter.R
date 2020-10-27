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




# This is annoying to write so many times. We could us a for loop! Try writing it as a for loop:





# That's pretty good, but what if we want to make something even more general than that? What if we want to be able to take a vector of ages for any grade as input and output a histogram? 


#### Group Practice ####

# Let's start with a simple example
# 1) Goal: Make a function that takes a string, and prints out that string plus an exclamation point at the end!
# Example:
# Input     Output
# "Hello"   "Hello!"




# And don't forget to add a comment explaining what your function does, what arguments it takes, and what it returns!

# 2) Let's use functions to do our histogram example from the warm up!






# 3) Write your version of the sum function! Call it my.sum






# 4) Now add the na.rm functionality to your sum function! Name it my.sum2




#### More practice ####

# 1) Now write your version of the mean function. Call it my.mean. Use your new my.sum2 function! And make sure it has na.rm functionality






# The following problems were adapted from YaRrr!
# https://bookdown.org/ndphillips/YaRrr/functions.html

# 2a) Create a function called oh.god.how.much.did.i.spend that helps hungover pirates figure out how much gold they spent after a long night of pirate debauchery.
# The function will have three inputs: grogg: the number of mugs of grogg the pirate drank, port: the number of glasses of port the pirate drank, and crabjuice: the number of shots of fermented crab juice the pirate drank.
# Based on this input, the function will calculate how much gold the pirate spent. We'll also assume that a mug of grogg costs 1, a glass of port costs 3, and a shot of fermented crab juice costs 10.

# Write the function!




# Test cases
# Tamara: 10 groggs, 3 port, 0 crabjuice
# Test that result is 19!



# Cosima: 0 groggs, 0 port, 7 crabjuice
# Test that the result is 70.



# And 2 more test cases to make sure your function is doing what you think it is doing!


# 2b) How can you improve your function? Can you set any devault argument values to make the function calls more simple?




# 3) Write a function called is.it.true(). The function will take a single input x. If the input x is TRUE, the function will print one sentence. If the input x is FALSE, it will return a different sentence. The sentences can be whatever you'd like as long as they are different.




# Here are some test cases:
is.it.true(TRUE) # TRUE
is.it.true(FALSE) # FALSE
is.it.true(10 > 0) # TRUE
is.it.true(10 < 0) # FALSE

# Write some more test cases:




# 4) Captain Jack is convinced that he can predict how much gold he will find on an island with the following equation: (a * b) - c * 324 + log(a), where a is the area of the island in square meters, b is the number of trees on the island, and c is how drunk he is on a scale of 1 to 10. Create a function called Jacks.Equation that takes a, b, and c as arguments and returns Captain Jack's predictions.
# Here is an example of Jacks.Equation in action:
# Jacks.Equation(a = 1000, b = 30, c = 7)
## [1] 27739




# Try running the equation on the example. Do you get your expected output?


# Write a few more test cases:


# What would "break" your function?



# 5) Often times you will need to recode values of a dataset. For example, if you have a survey of age data, you may want to convert any crazy values (like anything below 0 or above 100) to NA. Write a function called recode.numeric() with 3 arguments: x, lb, and ub. We'll assume that x is a numeric vector. The function should look at the values of x, convert any values below lb (lower bound) and above ub (upper bound) to NA, and then return the resulting vector. 
# Here is the function in action:
# recode.numeric(x = c(5, 3, -5, 4, 3, 97), lb = 0, ub = 10)
## [1]  5  3 NA  4  3 NA






# Write 2 more test cases:




