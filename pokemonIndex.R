library(dplyr)
library(stringr)
library(tidyr)
library(assertive)
library(readr)

# Step 1: Load data
survey214 <- read.csv("https://raw.githubusercontent.com/sit-2021-int214/000-INT214Survey/main/SurveyINT214_original.csv")
# Step 2: Change to tibble
survey214 <- as_tibble(survey214)
glimpse(survey214)

# Step 3: TransformData
survey214 <- survey214 %>% rename(
  timestamp = ประทับเวลา,
  skill_excel = X1..ทักษะการใช้งาน.Excel.Google.Sheet,
  skill_r = X2..ทักษะภาษา.R,
  skill_stat = X3..ประเมินตัวเองหน่อย.คิดว่ามีความรู้เกี่ยวกับสถิติอยู่ขั้นไหน,
  int214_level = X4..คิดว่า.INT214.ที่กำลังจะเรียนมีความง่าย.ยากเพียงใด,
  int214_att = X5..คิดว่า.INT214.น่าเรียนมากน้อยแค่ไหน,
  std_ready = X6..นักศึกษามีความพร้อมที่จะเรียนมากน้อยเพียงใด,
  music_genres = แนวเพลงที่ชอบฟัง,
  salary = เงินเดือนที่อยากได้เมื่อเรียนจบ..พิมพ์เป็นตัวเลข.,
  sec = เรียน.Sec.ไหน,
  gender = เพศ,
  birthday = วันเดือนปีเกิด,
  program = มัธยมปลาย.เรียนสายการเรียนอะไร
)

# Step 4: Cleaning Data
## Change data type
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
write_csv(survey214,file = "../datasets/survey214_v1.csv")