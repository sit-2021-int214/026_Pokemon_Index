# Pokémon Index Dataset

Dataset from [pokemon_clean.csv](./pokemon_cleandata.csv)


### My Step
1. Define a questionCancel changes
2. Loading Library and dataset
3. Finding the answer (result) from the given question
4. Summarize the results and re-check for correact answers


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
pokemonType <- data.frame(table(pokemon$Type)) #สร้าง dataframe เพื่อเเยกข้อมูลเเละรู้จำนวนของเเต่ละ Type
pokemonType  <- pokemonType %>% rename(Type=Var1) #rename Type
pokemonType  <- pokemonType %>% rename(Amount=Freq) #rename Type
pokemonType %>% filter(Amount == max(Amount)) #เลือกเฉพาะข้อมูลที่มีจำนวนมากที่สุด

```
Result
```
   Type Amount
1 WATER    122
```

## 5. 
Explain
```
pokemon %>% select(Name,Type,Speed,HP) %>% filter( pokemon$Speed < 50 ,pokemon$HP > 80) 
#เลือกเเสดงข้อมูลเฉพาะคอลัมน์ Name,Type,Speed,HP 
#เลือกข้อมูลที่มี NameSpeed<50,HP>80

```
Result
```
             Name     Type Speed  HP
1      Jigglypuff   NORMAL    20 115
2      Jigglypuff    FAIRY    20 115
3      Wigglytuff   NORMAL    45 140
4      Wigglytuff    FAIRY    45 140
5        Slowpoke    WATER    15  90
6        Slowpoke  PSYCHIC    15  90
7         Slowbro    WATER    30  95
8         Slowbro  PSYCHIC    30  95
9       Lickitung   NORMAL    30  90
10         Rhydon   GROUND    40 105
11         Rhydon     ROCK    40 105
12        Snorlax   NORMAL    30 160
13      Igglybuff   NORMAL    15  90
14      Igglybuff    FAIRY    15  90
15  Mega Ampharos ELECTRIC    45  90
16  Mega Ampharos   DRAGON    45  90
17       Quagsire    WATER    35  95
18       Quagsire   GROUND    35  95
19       Slowking    WATER    30  95
20       Slowking  PSYCHIC    30  95
21      Wobbuffet  PSYCHIC    33 190
22      Dunsparce   NORMAL    45 100
23       Granbull    FAIRY    45  90
24         Phanpy   GROUND    40  90
25        Loudred   NORMAL    48  84
26        Cradily     ROCK    43  86
27        Cradily    GRASS    43  86
28         Wynaut  PSYCHIC    23  95
29         Sealeo      ICE    45  90
30         Sealeo    WATER    45  90
31      Gastrodon    WATER    39 111
32      Gastrodon   GROUND    39 111
33        Happiny   NORMAL    30 100
34       Munchlax   NORMAL     5 135
35      Hippowdon   GROUND    47 108
36 Mega Abomasnow    GRASS    30  90
37 Mega Abomasnow      ICE    30  90
38      Rhyperior   GROUND    40 115
39      Rhyperior     ROCK    40 115
40       Musharna  PSYCHIC    29 116
41       Gigalith     ROCK    25  85
42        Gurdurr FIGHTING    40  85
43     Conkeldurr FIGHTING    45 105
44          Throh FIGHTING    45 120
45      Reuniclus  PSYCHIC    30 110
46      Amoonguss    GRASS    30 114
47      Amoonguss   POISON    30 114
48       Stunfisk ELECTRIC    32 109
49       Stunfisk   GROUND    32 109
50     Aromatisse    FAIRY    29 101
51        Avalugg      ICE    28  95
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
