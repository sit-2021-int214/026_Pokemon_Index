# 026-Pokémon Index

Original Datasets from: [Pokémon Index](https://www.kaggle.com/brendan45774/pokmon-index-database?select=pokemon.csv)

![pokemon](https://github.com/sit-2021-int214/026_Pokemon_Index/blob/main/img/1200px-International_Pok%C3%A9mon_logo.svg.png)

### About's Pokémon Index Datasets

This dataset is about all Pokemon characters. It's a full list of every Pokémon from all 8 generations of the Pokémon series, along with their main data andstats
which are names, Character type,Total Power, Attack, Defense, Speed, and HP stats

## Inspiration / Overview

We choose pokemon as our dataset because, pokemon is one of the most intersting cartoon
their characters have specific name, characteristics, power and most of them when its turn to the dataset are in numeric value.
This allow us to exploring the data of each pokemons
Which pokemon have a highest powe? On the other hand which one is the lowest
and also their type we can also applied the used of pokemon types as a tools to explore more deeply too.
Our teams believing that explore the interesting data that we all like can bring higher quality of the work!

![pokemonsub](https://github.com/sit-2021-int214/026_Pokemon_Index/blob/main/img/pokemon-pc-game-1-900x506.jpg)

## Column show in the cleaning data set

1. `Pokemon_Number` : Number of Pokemons
2. `Name` : Pokemons names
3. `Type` : Type of each Pokemons
4. `Total` : Total attack power of each Pokemons
5. `HP` : Hp power each Pokemons
6. `Attack` : How much attack power of each Pokemons
7. `Defense` : How powerful defense is in each Pokemons
8. `Special_Attack` : How much special attack is in each Pokemons
9. `Special_Defense` : How much special defense is in each Pokemons
10. `Speed` : What speed that each pokemons have

## Explore topics

1. find the dark's pokemon(s)that have a total(power) morethan 600
2. Which pokemon type have the gratest average of special defense ?
3. which pokemon have a highest and lowest speed and what the diffrent of two of them ?
4. From the given index which pokemons types have a highest amount? and how much is it ?
5. which pokemon(s) have a hp is morethan 80 and speed lower than 50 ? What are the top 5 ?
6. Find the lowest speed pokemon that total(power) is morethan 600

### Steps

1. Define a question
2. Search datasets from Kaggle
3. Retrieve the relevant dataset from Kaggle
4. Explore the dataset from the original dataset
5. Data Cleaning and Data Transformation
6. Exploratory Data Analysis

### Tools

- [R Studio Desktop](https://www.rstudio.com/)
- [Microsoft Excel](https://www.microsoft.com/en-us/microsoft-365/excel)
- [Data Studio](https://datastudio.google.com)

## Table of Contents

1. [Exploratory Data Analysis](./01_explore.md)
2. [Analytical Inferential Statistics](./pokemon_hypothesisTesting.md)


## Resources
1. [Pokemon Sheet](https://docs.google.com/spreadsheets/d/1m10t2Za9cGxzlBOojroUCRX46_5TbkoFXDcF6JEG6zo/edit?usp=sharing) : Pokemon Index in google sheet
2. [Data Studio](https://datastudio.google.com/s/jOp4W8SIFaw) : Pokemon data statics using data studio
3. [Presentation Slide](https://www.canva.com/design/DAEyco9Dne8/eCN0lRAhU5hhGT1yN70cXQ/view?utm_content=DAEyco9Dne8&utm_campaign=designshare&utm_medium=link&utm_source=sharebutton) : Slide for presentation

### Important Files in Repository

- [pokemonIndex_original.csv](./pokemonIndex_original.csv): Original Dataset
- [pokemon_clean.csv](./pokemon_clean.csv): Clean Dataset
- [01_explore.md](./01_explore.md) : Exploratory Data Analysis (Mark Down file)
- [pokemonIndex.R](./pokemonIndex.R) : Exploratory Data Analysis (R file)
- [pokemon_hypothesisTesting.md](./pokemon_hypothesisTesting.md): Hypothesis Statement

### References

https://www.kaggle.com/brendan45774/pokmon-index-database?select=pokemon.csv

## About Us

งานนี้เป็นส่วนของวิชา INT214 Statistics for Information technology <br/> ภาคเรียนที่ 1 ปีการศึกษา 2564 คณะเทคโนโลยีสารสนเทศ มหาวิทยาลัยเทคโนโลยีพระจอมเกล้าธนบุรี

### Team: แก๊งร็อคเก็ต [ ロケット団 Rocket Gang ]
1. นางสาวสาริศา  ภูละคร       StudentID: 63130500116
2. นายสิรภพ     ภัทรเกษวิทย์   StudentID: 63130500119
3. นายธนัตถ์     ลีเรืองกิจ      StudentID: 63130500156


### Instructor

- ATCHARA TRAN-U-RAIKUL
- JATAWAT XIE (Git: [safesit23](https://github.com/safesit23))
