=====================================================
PRACTICAL APPLICATIONS OF R IN DATA ANALYSIS AND DATA MANAGEMENT
=====================================================
Student Information
Name: Emmanuel Kayihura
Student ID: 20252MBI019
Course: R for Data Science
=====================================================
1. INTRODUCTION TO R PROGRAMMING
=====================================================

32 + 18 56 - 24 9 * 6 144 / 12 5^3

=====================================================
2. UNDERSTANDING DATA STRUCTURES IN R
=====================================================
2.1 Working with Vectors

exam_marks <- c(68, 79, 84, 91, 73, 86)

sum(exam_marks) mean(exam_marks)

attendance <- c(TRUE, FALSE, TRUE, TRUE, TRUE)

student_names <- c("Brian", "Sandra", "Joseph", "Claudine")

week_numbers <- seq(1, 7)

numbers <- c(6 + 3i, 8 + 5i)

class(exam_marks)

2.2 Creating Matrices

matrix_one <- matrix(3:10, nrow = 2, ncol = 4)

matrix_one

matrix_two <- matrix(2:9, nrow = 4, ncol = 2)

matrix_two

matrix_one %*% matrix_two

2.3 Using Lists

student_record <- list( student_name = "Emmanuel", age = 24, enrolled = TRUE, examination_score = 89 )

student_record

student_record$student_name

student_record[[4]]

2.4 Working with Factors

results <- factor( c("Pass", "Pass", "Fail", "Pass", "Fail", "Pass") )

results

levels(results)

2.5 Identifying Missing Values

test_scores <- c(72, 81, 95, NA, 68, 87)

is.na(test_scores)

mean(test_scores, na.rm = TRUE)

temperature <- c(22, 26, 29, NA, 31)

humidity <- c(55, 62, NA, 70, 68)

complete.cases(temperature, humidity)

2.6 Understanding Data Type Conversion

information <- c(15, 30, "Forty-five", 60)

information

sum(c(TRUE, TRUE, FALSE, TRUE))

class(information)

=====================================================
3. CREATING AND ORGANIZING DATA FRAMES
=====================================================

student_number <- 1:6

student_names <- c( "Brian", "Sandra", "Joseph", "Claudine", "Patrick", "Alice" )

marks <- c(74, 89, 68, 95, 81, 77)

ages <- c(22, 24, 27, 21, 25, 23)

departments <- c( "Finance", "Statistics", "Management", "Economics", "Finance", "Management" )

class_records <- data.frame( student_number, student_names, marks, ages, departments )

class_records

3.1 Entering Information Manually

employee_data <- data.frame( employee_name = character(), monthly_salary = numeric(), working_years = numeric() )

employee_data <- edit(employee_data)
=====================================================
4. IMPORTING DATA INTO R
=====================================================
4.1 Reading Text Files

results_data <- NULL

results_data <- read.table(
"examination_results.txt",
header = TRUE
)
names(results_data)
head(results_data)
tail(results_data)
results_data[2:7, ]
4.2 Importing Excel Worksheets
install.packages("readxl")
excel_records <- readxl::read_excel("academic_records.xlsx")
head(excel_records)
4.3 Importing Statistical Data Files
install.packages("haven")
survey_spss <- haven::read_sav("research_survey.sav")
survey_stata <- haven::read_dta("research_survey.dta")
survey_sas <- haven::read_sas("research_survey.sas7bdat")
4.4 Connecting to a Database
install.packages(c("DBI", "RPostgres"))
con <- DBI::dbConnect(
RPostgres::Postgres(),
dbname = "university_records",
host = "localhost",
port = 5432,
user = "your_username",
password = "your_password"
)
DBI::dbListTables(con)
records <- DBI::dbReadTable(con, "student_information")
DBI::dbDisconnect(con)
4.5 Using Datasets Included in R

data()

data("mtcars")

names(mtcars)

str(mtcars)

head(mtcars)

=====================================================
5. EXPLORING AND SUMMARIZING DATA
=====================================================

class_records

summary(class_records)

str(class_records)

nrow(class_records)

ncol(class_records)

length(class_records$marks)

5.1 Selecting Rows and Columns

class_records[2:5, ]

class_records$marks

class_records[, 3]

class_records[, -1]

5.2 Calculating Descriptive Statistics

summary(class_records$marks)

mean(class_records$marks)

sd(class_records$marks)

max(class_records$marks)

min(class_records$marks)

aggregate( marks ~ departments, data = class_records, FUN = mean )

=====================================================
6. COMPARING NUMERICAL AND CATEGORICAL DATA
=====================================================

data("iris")

head(iris)

mean(iris$Petal.Length)

6.1 Group-Based Statistical Analysis

by( iris$Petal.Length, iris$Species, mean )

by( iris$Petal.Length, iris$Species, sd )

by( iris$Petal.Length, iris$Species, summary )

6.2 Visualizing Data with Boxplots

boxplot( Sepal.Width ~ Species, data = iris, main = "Sepal Width Across Flower Species", xlab = "Flower Species", ylab = "Sepal Width", col = c("lightyellow", "lightblue", "lightgreen") )

=====================================================
7. ANALYSIS OF CATEGORICAL VARIABLES
=====================================================

admission_data <- as.data.frame(UCBAdmissions)

head(admission_data)

gender_admission <- xtabs( Freq ~ Gender + Admit, data = admission_data )

gender_admission

prop.table(gender_admission, margin = 1)

=====================================================
8. DATA VISUALIZATION USING BAR CHARTS
=====================================================
8.1 Comparing Product Revenue

revenue <- data.frame( Product_A = c(175, 195), Product_B = c(115, 145), Product_C = c(95, 125), Product_D = c(140, 165) )

barplot( as.matrix(revenue), beside = TRUE, main = "Product Revenue Comparison", ylab = "Revenue", col = c("purple", "orange") )

8.2 Comparing Performance Across Regions

regional_performance <- data.frame( Kigali = c(28, 38, 42, 32), Rubavu = c(35, 48, 39, 52), Nyagatare = c(23, 43, 47, 37) )

barplot( as.matrix(regional_performance), main = "Performance Comparison Across Regions", ylab = "Performance Values", col = c("lightpink", "lightblue", "lightgreen"), beside = TRUE )

=====================================================
9. SCATTER PLOTS AND CORRELATION ANALYSIS
=====================================================

plot( class_records$ages, class_records$marks, main = "Relationship Between Student Age and Marks", xlab = "Student Age", ylab = "Examination Marks", pch = 19, col = "darkgreen" )

9.1 Measuring Correlation

cor( class_records$ages, class_records$marks )

=====================================================
10. LINEAR REGRESSION ANALYSIS
=====================================================

marks_model <- lm( marks ~ ages, data = class_records )

summary(marks_model)

10.1 Plotting the Regression Line

plot( marks ~ ages, data = class_records, main = "Regression Analysis of Student Age and Marks", xlab = "Student Age", ylab = "Examination Marks", pch = 19 )

abline(marks_model, col = "blue", lwd = 2)

10.2 Checking Model Diagnostics

par(mfrow = c(2, 2))

plot(marks_model)

par(mfrow = c(1, 1))

10.3 Adding a Smooth Trend Line

plot( class_records$ages, class_records$marks, main = "Age and Academic Performance", xlab = "Age", ylab = "Marks", pch = 19 )

abline(marks_model, col = "blue")

lines( lowess(class_records
𝑎
𝑔
𝑒
𝑠
,
𝑐
𝑙
𝑎
𝑠
𝑠
𝑟
𝑒
𝑐
𝑜
𝑟
𝑑
𝑠
marks), col = "red", lwd = 2 )

=====================================================
11. DATA MANAGEMENT AND VARIABLE CREATION
=====================================================
11.1 Creating a Performance Category

class_records$performance <- ifelse( class_records$marks >= 85, "Excellent", ifelse( class_records$marks >= 75, "Good", "Average" ) )

class_records

table(class_records$performance)

11.2 Viewing Dataset Observations

head(class_records, 3)

tail(class_records, 3)

summary(class_records$marks)

stem(class_records$marks)

=====================================================
12. WORKING WITH DATES IN R
=====================================================

current_date <- Sys.Date()

current_date

format(current_date, "%d %B %Y")

format(current_date, "%A")

registration_date <- as.Date("2026-08-15")

examination_date <- as.Date("2026-12-20")

examination_date - registration_date

=====================================================
13. SUBSETTING AND MANAGING SURVEY DATA
=====================================================

participant_id <- 1:6

location <- c( "Kigali", "Rubavu", "Nyagatare", "Musanze", "Huye", "Rwamagana" )

sex <- c("F", "M", "F", "M", "F", "M")

participant_age <- c(26, 33, 29, 99, 37, 44)

response1 <- c(3, 4, 5, 4, 3, 5)

response2 <- c(4, 5, 3, 4, 4, 5)

response3 <- c(5, 3, 4, 5, 2, 4)

response4 <- c(4, 5, 4, NA, 3, 5)

response5 <- c(3, 4, 5, NA, 4, 3)

survey_results <- data.frame( participant_id, location, sex, participant_age, response1, response2, response3, response4, response5 )

survey_results

str(survey_results)

names(survey_results)

13.1 Cleaning Missing Information

survey_results$participant_age[ survey_results$participant_age == 99 ] <- NA

is.na(survey_results)

colSums(is.na(survey_results))

clean_survey <- na.omit(survey_results)

clean_survey

13.2 Categorizing Participants by Age

survey_results$age_category <- ifelse( is.na(survey_results$participant_age), NA, ifelse( survey_results$participant_age < 30, "Young", ifelse( survey_results$participant_age <= 40, "Middle-aged", "Older" ) ) )

survey_results

13.3 Calculating Total Survey Scores

survey_results$total_points <- rowSums( survey_results[ , c( "response1", "response2", "response3", "response4", "response5" ) ], na.rm = TRUE )

survey_results

13.4 Sorting Survey Participants

order(survey_results$participant_age)

ordered_survey <- survey_results[ order(survey_results$participant_age), ]

ordered_survey

13.5 Combining Two Datasets

department_records <- data.frame( participant_id = 1:6, department = c( "Accounting", "Human Resources", "Information Technology", "Marketing", "Research", "Administration" ) )

combined_records <- merge( survey_results, department_records, by = "participant_id" )

combined_records

13.6 Selecting and Removing Variables

responses_only <- survey_results[ , c( "response1", "response2", "response3", "response4", "response5" ) ]

responses_only

simplified_survey <- survey_results[ , -c(1, 2) ]

simplified_survey

13.7 Accessing Specific Columns and Rows

survey_results$participant_age

survey_results[[3]]

survey_results[c(1, 3, 5), ]

13.8 Filtering Observations

female_participants <- subset( survey_results, sex == "F" )

female_participants

older_participants <- subset( survey_results, participant_age > 32 )

older_participants

kigali_participants <- subset( survey_results, location == "Kigali" )

kigali_participants

selected_participants <- subset( survey_results, sex == "F" & participant_age >= 30 )

selected_participants