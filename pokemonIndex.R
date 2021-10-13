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

# 1. find the dteel's pokemon(s)that have a total(power) morethan 600 
pokemon %>% filter(pokemon$Type == "DARK",pokemon$Total > 600)

# 2. Which pokemon type have the gratest average of special defense ?
distinct(pokemon,pokemon$Type, .keep_all = FALSE)
pokemonaverage <- aggregate(pokemon$Special_Defense, list(pokemon$Type), FUN=mean)
pokemonaverage <- pokemonaverage %>% rename(Type=Group.1,Average_Speed_Defense = x)
pokemonaverage %>% filter(pokemonaverage$Average_Speed_Defense == max(pokemonaverage$Average_Speed_Defense))

# 3. which pokemon have a highest and lowest speed and what the diffrent of two of them ?
pokemon %>% select(Name,Speed) %>% filter(pokemon$Speed == min(pokemon$Speed)) 
pokemon %>% select(Name,Speed) %>% filter(pokemon$Speed == max(pokemon$Speed))
max(pokemon$Speed)-min(pokemon$Speed)

# 4. From the given index which pokemons types have a highest amount? and how much is it ?
pokemonType <- data.frame(table(pokemon$Type))
pokemonType <- pokemonType %>% rename(Type=Var1)
pokemonType <- pokemonType %>% rename(Amount=Freq)
pokemonType %>% filter(Amount == max(Amount))

# 5. which pokemon(s) have a hp is morethan and speed lower than 50 ? what is his/her type ? 
pokemon %>% select(Name,Type,Speed,HP) %>% filter( pokemon$Speed < 50 ,pokemon$HP > 80) 

# 6. Find the lowest speed pokemon that total(power) is morethan 600
pokemon  %>% select(Name,Total,Speed)%>% filter(pokemon$Total > 600,pokemon$Speed==min(pokemon$Speed[pokemon$Total>600]))%>%distinct


##Checkpoint 1
write_csv(pokemon,file = "C:/Users/PHOP009/Desktop/R-INT214/pokemon_cleandata.csv")
