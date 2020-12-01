# QuACK 2020
# Week 10 - More for loop practice
# Elena Leib & Willa Voorhies


# 0) Make multiplication tables (1-10) for the numbers 47 thorugh 54. Store the output in a data frame so we can look back at the tables later on.
mult.df <- data.frame()
for(i in 47:57) {
  mult.table <- c()
  for(j in 1:10) {
    mult.table[j] <- i * j 
  }
  mult.df <- rbind(mult.df, mult.table)
}
rownames(mult.df) <- 47:57
colnames(mult.df) <- 1:10



# The following are adapted from YaRrr! The Pirate's Guide to R
# https://bookdown.org/ndphillips/YaRrr/test-your-r-might-7.html


# 1) Using a loop, create 4 histograms of the weights of chickens in the ChickWeight dataset, with a separate histogram for time periods 0, 2, 4 and 6.
# ChickWeight is a built in data set

View(ChickWeight)
for(i in c(0, 2, 4, 6)) {
  
  hist(ChickWeight[ChickWeight$Time == i,]$weight, 
       main = paste("Histogram of chick weight when Time =", i))
  
}


# 2) The following is a dataframe of survey data containing 5 questions I collected from 6 participants. The response to each question should be an integer between 1 and 5. Obviously, we have some invalid values in the dataframe. Let's fix them. Using a loop, create a new dataframe called survey.clean where all the invalid values (those that are not integers between 1 and 10) are set to NA.

survey <- data.frame("q1" = c(5, 3, 2, 7, 11, 5),
                     "q2" = c(4, 2, 2, 5, 5, 2),
                     "q3" = c(2, 1, 4, 2, 9, 10),
                     "q4" = c(2, 5, 2, 5, 4, 2),
                     "q5" = c(1, 4, -20, 2, 4, 2))

# Here's how your survey.clean dataframe should look:
  
  # The cleaned survey data
#  survey.clean
##   q1 q2 q3 q4 q5
## 1  5  4  2  2  1
## 2  3  2  1  5  4
## 3  2  2  4  2 NA
## 4 NA  5  2  5  2
## 5 NA  5 NA  4  4
## 6  5  2 NA  2  2


survey.clean <- survey
for(i in 1:nrow(survey.clean)) {
  for(j in 1:ncol(survey.clean)) {
    current.val <- survey.clean[i, j]
    survey.clean[i, j] <- ifelse(current.val > 5 | current.val < 1, NA, current.val)
  }
}


# From class:
survey.cleaned <- survey
for(row in 1:nrow(survey)) {
  for(col in 1:ncol(survey)) {
    if(survey[row, col] < 1 | survey[row, col] > 5) {
      survey.cleaned[row, col] <- NA
    }
  }
}


survey.cleaned <- survey
for(row in 1:nrow(survey)) {
  for(col in 1:ncol(survey)) {
    survey.cleaned[row, col] <- ifelse(survey[row, col] < 1 | survey[row, col] > 5, NA, survey[row,col])
  }
}

