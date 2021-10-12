library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)

# Step 1: Load data
pokemon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/026_Pokemon_Index/main/pokemonIndex_original.csv")
View(pokemon)

# Step 2: Change to tibble
pokemon <- as_tibble(pokemon)
glimpse(pokemon)

# Step 3: TransformData
#rename column
pokemon <- pokemon %>% rename(Pokemon_Number=ï..Number)
pokemon <- pokemon %>% rename(Special_Attack=Special.Attack)
pokemon <- pokemon %>% rename(Special_Defense=Special.Defense)
View(pokemon)

# Step 4: Cleaning Data
## Change data type
pokemon$Pokemon_Number <- pokemon$Pokemon_Numbr %>% str_remove("Â")
pokemon$Pokemon_Number <- pokemon$Pokemon_Number %>% str_remove("ย")

survey214$skill_excel <- as.factor(survey214$skill_excel)
survey214$skill_r <- as.factor(survey214$skill_r)

## skill_stat by using replace (hard) --------------
str_0 <- "Level 0 \\(ไม่มีความรู้เลย คืนครูคณิตม.ปลายไปหมดแล้ว\\)"
str_1 <- "Level 1 \\(พอจำได้เรื่องการหาค่ากลางได้เช่น Average, Median, mode\\)"
str_2 <- "Level 2 \\(พอจำ concept จากม.ปลายได้เช่น s.d., z-score, normal distribution, variance\\)"
str_3 <- "Level 3 \\(จำได้ดี ถ้ามีสูตรมาสามารถคำนวณหาค่าได้ทันที\\)"
survey214$skill_stat %>% str_replace_all(str_0,"Level 0")
survey214$skill_stat %>% str_replace_all(str_1,"Level 1") 
survey214$skill_stat %>% str_replace_all(str_2,"Level 2")
survey214$skill_stat %>% str_replace_all(str_3,"Level 3")
#-------------

## skill_stat by using substring
survey214$skill_stat %>% str_sub(1,7)
survey214$skill_stat <- survey214$skill_stat %>% str_sub(1,7) %>% factor()
summary(survey214$skill_stat)

## sec by using substring
survey214$sec %>% str_sub(1,5)
survey214$sec <- survey214$sec %>% str_sub(1,5) %>% factor
summary(survey214$sec)

##Checkpoint 1

write_csv(pokemon,file = "C:/Users/PHOP009/Desktop/R-INT214/pokemon_cleandata.csv")
