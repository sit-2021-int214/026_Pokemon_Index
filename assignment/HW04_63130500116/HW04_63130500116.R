# Part 1
# Library
library(assertive)
library(readr)
library(dplyr)
library(stringr)
library(tidyr)
library(ggplot2)
library(data.table)

# Dataset
comproBook <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/prog_book.csv")

# Viewdataset
View(comproBook)
comproBook <- as_tibble(comproBook)
glimpse(comproBook)

View(comproBook)
summary(comproBook)

# Clean data
comproBook$Reviews <-comproBook$Reviews %>% str_remove(",")
comproBook$Reviews <- as.integer(comproBook$Reviews)
typeof(comproBook$Reviews)

# Part 2
# arrange
comproBook %>% arrange(Rating) 
# slice
comproBook %>% slice_head(n=5)
# split
comproBook %>% split(comproBook, f = comproBook$Type)

# Part 3
# 1
noReview <- comproBook %>% select(Book_title,Reviews,Type) %>% filter(Reviews==0)
noReview <- data.frame(table(noReview$Type))
noReview <- noReview %>% rename(Type=Var1) 
noReview <- noReview %>% rename(Amount=Freq)

sum(noReview$Amount)
noReview %>% filter(Amount == max(Amount))

# 2
typePrice <- comproBook %>%  select(Book_title, Type, Price) %>% filter(comproBook$Price > 100)
count(typePrice)
typePrice %>% split(typePrice, f = typePrice$Type) 


# 3
comproBook %>% select(Rating, Reviews, Book_title) %>% filter(comproBook$Reviews > 500 , comproBook$Rating < 4)

# 4
mean(comproBook$Price)
comproBook %>% select(Book_title, Type, Price) %>% filter(comproBook$Price > mean(comproBook$Price), comproBook$Type == 'Hardcover') %>% slice_head(n=5)

# 5
comproBook %>% select(Book_title, Price,Type) %>% filter(comproBook$Description %ilike% 'python') %>% arrange(desc(Price)) %>% slice_head(n=5)

# 6
maxPage <- max(comproBook$Number_Of_Pages)
minPage <- min(comproBook$Number_Of_Pages)

comproBook %>% select(!Description) %>% filter(comproBook$Number_Of_Pages == maxPage) 
comproBook %>% select(!Description) %>% filter(comproBook$Number_Of_Pages == minPage)

max(comproBook$Number_Of_Pages) - min(comproBook$Number_Of_Pages)

# part 4

graph1 <- comproBook %>% ggplot(aes(x=Type)) + 
  geom_bar(aes(fill = Type)) + 
  ggtitle("Total of Types") + xlab("Type of Books") + ylab("count")
graph1

graph2 <- comproBook %>% filter(Rating<=5) %>% ggplot(aes(x=Rating,y=Reviews))+ geom_point() +
  geom_point(aes(color=Type))+ ggtitle("relation Rating and Review") + geom_smooth() 
graph2

# load dataset
write_csv(comproBook,"C:/Users/asus/Downloads/comproBook_clean.csv")
