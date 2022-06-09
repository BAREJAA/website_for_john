# from p107 onwards of R in Action and
# https://cran.r-project.org/doc/manuals/r-release/R-intro.html#Control-statements

# Notes - 
# Remember to use the terms "control flow" and "conditional execution"
# The ifelse() construct is a compact and vectorized version of the if/else construct - quote this!
# "vectorized" means that the function will operate on all elements of a vector without needing to 
# loop through and act on each element one at a time

# one way to add an `in_europe` column to `happy` df (see ifelse().R for more)
in_europe <- c()
for(i in 1:length(happy$country_name)){
  if (happy$country_name[i] == "Spain") {
    in_europe[i] <- "Yes"
  } else {
    in_europe[i] <- "No"
  }
}

happy$in_europe <- in_europe

# not sure if we should even introduce this...
# how about building it up like this
# first show a very simply if/else statement -
if(3 > 5){
  "is greater than 5"
} else {
  "is not greater than 5"
}
# and
if(7 > 5){
  "is greater than 5"
} else {
  "is not greater than 5"
}

# let's try this for `happy`
if(happy$country_name == "Spain"){
  "Yes"
} else {
  "No"
}
# we have to write a for loop!
for(i in 1:length(happy$country_name)){
  if(happy$country_name[i] == "Spain"){
    print("Yes")
  } else {
    print("No")
  }
}

# or we can just us ifelse()!
ifelse(happy$country_name == "Spain", "Yes", "No")

# and so we can easily use ifelse() to add a new column to the happy df (as in ifelse().R)

# Run this all by Matt and Allie

