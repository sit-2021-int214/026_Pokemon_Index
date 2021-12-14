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
z_total <- (mean_total - 600)/(sd_total/sqrt(1169)) #32.03
```

Step 4: Finding P-value approach or Critical Value approach

```
# P-value
pvalue_total <- pnorm(z_total) 
# Critical Value 
zalpha_total <- qnorm(0.05)
```

Step 5: Compare

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

การที่โปเกมอนจะมีค่าพลังงานรวมอยู่ที่ 100 อันดับเเรกนั้น จะต้องมีค่า Total มากกว่า 600

