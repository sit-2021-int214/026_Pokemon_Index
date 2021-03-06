# Pokémon Index Dataset

Dataset from [pokemon_clean.csv](./pokemon_cleandata.csv)


### My Step
1. Define a question
2. Loading Library and dataset
3. Clearing data by remove special characters in data, remove special characters in column name, change column name
4. Finding the answer (result) from the given question
5. Summarize the results and re-check for correact answers


## Define a question

1. find the dark's pokemon(s)that have a total(power) morethan 600 
2. Which pokemon type have the gratest average of special defense ?
3. which pokemon have a highest and lowest speed and what the diffrent of two of them ?
4. From the given index which pokemons types have a highest amount? and how much is it ?
5. which pokemon(s) have a hp is morethan 80 and speed lower than 50 ? What are the top 5 ? 
6. Find the lowest speed pokemon that total(power) is morethan 600

## Step 0 Loading library and dataset

```
#library

library(janitor)
library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)
library(psych)

#dataset
pokemon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/026_Pokemon_Index/main/pokemonIndex_original.csv")
```

## Cleaning data

```
colnames(pokemon)
glimpse(pokemon)

pokemon <- pokemon %>% rename(Pokemon_Number=ï..Number,Special_Attack=Special.Attack,Special_Defense=Special.Defense)

pokemon$Pokemon_Number <- pokemon$Pokemon_Number %>% str_remove("Â")
pokemon$Pokemon_Number <- pokemon$Pokemon_Number %>% str_remove("ย") 

pokemon$Name <- pokemon$Name %>% str_remove("™€")
pokemon$Name <- pokemon$Name %>% str_remove("โ€")
pokemon$Name <- pokemon$Name %>% str_remove("โ")

pokemon$Pokemon_Number <- pokemon$Pokemon_Number %>% str_trim()

tabyl(pokemon$Type)

describe(pokemon)

range(pokemon$Total)
range(pokemon$HP)
range(pokemon$Attack)
range(pokemon$Defense)
range(pokemon$Special_Attack)
range(pokemon$Special_Defense)
range(pokemon$Speed)
```
Result

```
final column name are :
"Pokemon_Number"  "Name"            "Type"           
"Total"           "HP"              "Attack"         
"Defense"         "Special_Attack"  "Special_Defense"
"Speed" 

the range of pokemon's total power is               180 and 780.
the range of pokemon's HP power is                    1 and 255
the range of pokemon's attack power  power is         5 and 190
the range of pokemon's defense power is               5 and 230
the range of pokemon's total special attack power is 10 and 194
the range of pokemon's special defense power is      20 and 230
the range of pokemon's total speed is                 5 and 180
```
```
> glimpse(pokemon)
Rows: 1,168
Columns: 10
$ Pokemon_Number  <chr> " 001", " 001", " 002", " 002", ~
$ Name            <chr> "Bulbasaur", "Bulbasaur", "Ivysa~
$ Type            <chr> "GRASS", "POISON", "GRASS", "POI~
$ Total           <int> 318, 318, 405, 405, 525, 525, 62~
$ HP              <int> 45, 45, 60, 60, 80, 80, 80, 80, ~
$ Attack          <int> 49, 49, 62, 62, 82, 82, 100, 100~
$ Defense         <int> 49, 49, 63, 63, 83, 83, 123, 123~
$ Special_Attack  <int> 65, 65, 80, 80, 100, 100, 122, 1~
$ Special_Defense <int> 65, 65, 80, 80, 100, 100, 120, 1~
$ Speed           <int> 45, 45, 60, 60, 80, 80, 80, 80, ~
```
## 1. find the dark's pokemon(s)that have a total(power) morethan 600

Explain here

```
pokemon %>% filter( pokemon$Type == "DARK",pokemon$Total > 600)
```

Result

```
# A tibble: 3 x 10
  Pokemon_Number Name           Type  Total    HP Attack Defense Special_Attack Special_Defense Speed
  <chr>          <chr>          <chr> <int> <int>  <int>   <int>          <int>           <int> <int>
1 130.1          Mega Gyarados  DARK    640    95    155     109             70             130    81
2 248.1          Mega Tyranitar DARK    700   100    164     150             95             120    71
3 717            Yveltal        DARK    680   126    131      95            131              98    99
```
Description
- Mega Gyarados, Mega Tyranitar, Yveltal ทั้ง 3 ตัว เป็นโปรเกมอนธาตุมืดที่มีtotal(power)มากกว่า 600 ครั้ง

## 2.Which pokemon type have the gratest average of special defense ?

Explain here
```
distinct(pokemon,pokemon$Type, .keep_all = FALSE)
pokemonAverage <- aggregate(pokemon$Special_Defense, list(pokemon$Type), FUN=mean)
pokemonAverage <- pokemonAverage %>% rename(Type=Group.1,Average_Speed_Defense = x)
pokemonAverage %>% filter(pokemonAverage$Average_Speed_Defense == max(pokemonAverage$Average_Speed_Defense))
```
Result
```
     Type Average_Speed_Defense
1 PSYCHIC              84.37349
```
Description
- โปรเกมอนธาตุพลังจิตมีค่าเฉลี่ยการป้องกันสูงที่สุด อยู่ที่ 84.37349

## 3. which pokemon have a highest and lowest speed and what the diffrent of two of them ?

Explain here
```
pokemon %>% select(Name,Speed) %>% filter(pokemon$Speed == min(pokemon$Speed))
pokemon %>% select(Name,Speed) %>% filter(pokemon$Speed == max(pokemon$Speed))

max(pokemon$Speed)-min(pokemon$Speed)
```
Result
```
> pokemon %>% select(Name,Speed) %>% filter(pokemon$Speed == min(pokemon$Speed))
# A tibble: 3 x 2
  Name     Speed
  <chr>    <int>
1 Shuckle      5
2 Shuckle      5
3 Munchlax     5
> pokemon %>% select(Name,Speed) %>% filter(pokemon$Speed == max(pokemon$Speed))
# A tibble: 1 x 2
  Name                Speed
  <chr>               <int>
1 Deoxys- Speed Forme   180
> 
> max(pokemon$Speed)-min(pokemon$Speed)
[1] 175
```
Description
- Shuckle, Munchlax มีค่าความเร็วต่ำที่สุดคือ 5 เเละ Deoxys- Speed Forme มีค่าความเร็วสูงที่สุดคือ 180 โดยทั้ง 2 ค่า มีความต่างอยู่ที่ 175

## 4. From the given index which pokemons types have a highest amount? and how much is it ?
Explain
```
pokemonType <- data.frame(table(pokemon$Type)) 
pokemonType  <- pokemonType %>% rename(Type=Var1) 
pokemonType  <- pokemonType %>% rename(Amount=Freq) 
pokemonType %>% filter(Amount == max(Amount)) 
```
Result
```
   Type Amount
1 WATER    122
```
Description
- โปรเกมอนที่เป็นธาตุน้ำมีจำนวนสูงที่สุด โดยมีจำนวน 122 ตัว

## 5. which pokemon(s) have a hp is morethan 80 and speed lower than 50 ? What are the top 5 ?
Explain
```
pokemon %>% select(Name,Speed,HP) %>% filter( pokemon$Speed < 50 ,pokemon$HP > 80) %>% distinct() %>% arrange(desc(Speed)) %>% slice_head(n=5)
```
Result
```
        Name Speed  HP
1 Wigglytuff    45 140
2    Slowbro    30  95
3  Lickitung    30  90
4 Jigglypuff    20 115
5   Slowpoke    15  90
```
Description
- Wigglytuff, Slowbro, Lickitung, Jigglypuff, Slowpoke เป็น 5 อันดับเเรก ที่มีความเร็วต่ำกว่า 50 เเต่ HP มากกว่า 80

## 6. Find the lowest speed pokemon that total(power) is morethan 600
Explain
```
pokemon  %>% select(Name,Total,Speed)%>% filter(pokemon$Total > 600,pokemon$Speed==min(pokemon$Speed[pokemon$Total>600]))%>%distinct 
```
Result
```
> pokemon  %>% select(Name,Total,Speed)%>% filter(pokemon$Total > 600,pokemon$Speed==min(pokemon$Speed[pokemon$Total>600]))%>%distinct
# A tibble: 1 x 3
  Name          Total Speed
  <chr>         <int> <int>
1 Mega Ampharos   610    45
```
Description
- Mega Ampharos เป็นตัวที่มีค่าความเร็วต่ำที่สุดอยู่ที่ 45 เเต่มีtotal(power)มากกว่า 600 โดยมีอยู่ 610
