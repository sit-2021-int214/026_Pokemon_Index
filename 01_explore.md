# Pokémon Index Dataset

Dataset from [anime_clean.csv](./pokemonIndex_original.csv)


### My Step
1. Define a questionCancel changes
2. Loading Library and dataset
3. xxxxxxx

## Define a question

1. find the dark's pokemon(s)that have a total(power) morethan 600 
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
anime <- read.csv("D:/IT/IT Y.2/INT214 Stat for IT/R/Midterm assignment/anime_clean.csv)
```

## 1.

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


## 2.

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
```
Result
```
```
