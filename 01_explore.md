# Pokémon Index Dataset

Dataset from [anime_clean.csv](./pokemonIndex_original.csv)


### My Step
1. Define a questionCancel changes
2. Loading Library and dataset
3. xxxxxxx

## Define a question

1. find the dteel's pokemon(s)that have a total(power) morethan 600 
2. Which pokemon type have the gratest average of special defense ?
3. which pokemon have a highest and lowest speed and what the diffrent of two of them ?
4. From the given index which pokemons types have a highest amount? and how much is it ?
5. which pokemon(s) have a hp is morethan and speed lower than 50 ? what is his/her type ? 
6. Find the lowest speed pokemon that total(power) is morethan 600

## Step 0 Loading library and dataset

```
#library
library(dplyr)
#dataset
pokemon <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/026_Pokemon_Index/main/pokemonIndex_original.csv")

```

## 1.

Explain here

```
```

Result

```

```


## 2.

Explain here
```
```
Result
```

```


## 3. 

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

## 4.
Explain
```
```
Result
```
```

## 5. 
Explain
```
```
Result
```
```

## 6.
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
