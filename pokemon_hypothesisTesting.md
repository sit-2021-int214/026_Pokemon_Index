# Analytical Inferential Statistics
## Hypothesis testing

โปเกมอนที่มีค่าพลังงานสูงที่สุด 100 อันดับเเรก จะมีจำนวนTotal มากกว่า 600 โดยใน 100 อันดับเเรกจะมีค่าเฉลี่ยเท่ากับ 634.28 
เเละส่วนเบี่ยงเบนมาตรฐานอยู่ที่ 46.78 (กำหนดค่า alpha = 0.5)

Step 0: Assign variables

```
n <- 1169
toptotal <- pokemon %>% select(Name, Type, Total) %>% arrange(desc(Total), .by_group = TRUE)  %>% slice_head(n=100)
mean_total <- mean(toptotal$Total) # 634.28
sd_total <- sd(toptotal$Total)  #46.78
```

Step 1: State the hypothesis

```
Ho:mue > 600
Ha:mue <= 600
```

Step 2: Level of significance

```
alpha = 0.05 
```

Step 3: Test statistic

```

```

Step 4: Finding P-value approach or Critical Value approach

```

```

Step 5: Compare

```

```

Step 6: Conclusion
```

```
