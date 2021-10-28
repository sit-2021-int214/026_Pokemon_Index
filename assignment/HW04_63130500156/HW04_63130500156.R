# Library
library(dplyr)
library(stringr)
library(readr)
library(data.table)
library(janitor)
library(ggplot2)



# Dataset
sales <- read.csv("https://raw.githubusercontent.com/safesit23/INT214-Statistics/main/datasets/superstore_sales.csv")
View(sales)

glimpse(sales)

# Cleaning Data
sales <- clean_names(sales)
colnames(sales)

# 1
  sales %>% select(customer_name,sales) %>% slice_min(sales , n=5 )
# 2
  sales %>% select(customer_name,sales) %>% slice_max(sales)
# 3 
  sales  %>% 
  select(customer_name,category,region) %>% 
  filter((sales$customer_name %like% 'Aaron Hawkins'),(sales$region == "West")) 
# 4
  sales %>% select(product_id,product_name,sales) %>% filter(sales > 12000)
# 5
  sales %>% group_by(product_id) %>% summarise(sales = min(sales))
# 6
  sales  %>% 
  select(product_name, product_id, state) %>% 
  filter((sales$product_name %like% 'Xerox'),(sales$state == "Alabama")) 
  
  #Visualization
  # 1
  category_plot <- ggplot(sales,aes(x = category)) + geom_bar()

  category_plot + ggtitle("Number of categories sold out") + xlab("Category") + ylab("Amount")
  
  # 2
  pro <- sales %>% group_by(city) %>%  summarise(total_sales = sum(sales)) %>% filter(total_sales > 100000)
  product_plot2 <- pro %>% ggplot(aes(x = city , y = total_sales )) + geom_point()
  product_plot2 + ggtitle("Where City buy more than 100,000$")
  
  #SAVE CSV
  write.csv(sales,"C:/Users/Administrator/Desktop/sales.csv", row.names=FALSE)