# Analytical Inferential Statistics
## Hypothesis testing
Top 100 pokemons (ranked by total power) will have Total power morethan 500 %
by top 100 pokemons have an average (mean) equals to 617.44 and standard diviation is 46.9 (givan that alpha is 0.5)


Step 0: Assign variables

```
toptotal <- pokemon %>% select(Name,Total) %>% distinct(Name,Total) %>% arrange(desc(Total), .by_group = TRUE)  %>% slice_head(n=100)
allpokemon <- pokemon %>% select(Name) %>% distinct(Name)
n <- count(allpokemon) #773
mean_total <- mean(toptotal$Total) #617.44
sd_total <- sd(toptotal$Total)  #46.89604
```

Step 1: State the hypothesis

```
Ho:mue > 500
Ha:mue <= 500
```

Step 2: Level of significance

```
alpha = 0.05 
```

Step 3: Test statistic

```
z_total <- (mean_total - 500)/(sd_total/sqrt(1169)) #32.03
```

Step 4: Finding P-value approach or Critical Value approach

```
# P-value
pvalue_total <- pnorm(z_total) 
# Critical Value 
zalpha_total <- qnorm(0.05)
```

Step 5: Comparison statement

```
if(pvalue_total<=0.05){
  print("Reject H0")
}else{
  print("Accept H0")
}
# Using critical value
if(z_total<=zalpha_total){
  print("Reject H0")
}else{
  print("Accept H0")
}
```
result
```
[1] "Accept H0"
----------------
[1] "Accept H0"
```

Step 6: Conclusion

From cacultion its can be summarize that, all top 100 pokemon order by total power have a total power more than 500.

