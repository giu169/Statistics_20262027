# 28.09 

# descriptive statistics 
#categorical values --> classes 
rm(list = ls()) #remove the list of all the environment
graphics.off() #remove the graphics
getwd() #it tells me the work directory I'm in
setwd("C:/Users/giuli/OneDrive - Università degli Studi di Milano/Desktop/STATISTICS/Statistics_20262027/Lab_1")
# to change the work directory 
getwd()

# DATA IMPORT/EXPORT 
# Import the file "record.txt"
record <- read.table('data/record.txt')
help("read.table")

#dimensions and variables name 
dim(record) #dimensions --> first are rows, second columns
dimnames(record) #--> function that stores in the first element the names of the rows and in the second element the names of the columns

# show the first line
head(record) #to see how is made --> it shows me the first six rows 
str(record) #shows how the dataset is made --> n° of rows and col, type of elements and first elements
record[1:5,] #the first 5 rows of all the columns 
record[1:5,1:3] #the first 5 rows of the first 3 colums --> before the rows and then the col


View(record) #you can also click on the name of the database in the environment 
#capital letter!!

record <- data.frame(record[,1:7], row.names=record[,8]) 
# I change the name of the rows of the dataframe with the elements of the 8th column
help(data.frame)

#change the name of the columns 
var.names <- c("m100", "m200", "m400", "m800", "m1500", "m3000", "Marathon")
#I store the columns withthe new names in the environment as a vector 
dimnames(record)[[2]] <- var.names #I assign the new names sotred in the vector to the second element (the columens of the function dimnames)
head(record)

#save the modified version in my result
write.table(record, file = "results/record_mod.csv", sep = ";")
write.table(record, file = "results/record_mod.csv", sep = ' # ')
#it saves the dataset modified in result
# before was .txt now in .csv --> all elements are separated by ; (sep = ";")

# read the saved files 
record <- read.table('results/record_mod.csv', header = T) #in this way it's all in a column 
record <- read.table('results/record_mod.csv', header = T, sep = ";") #in different column
# ; or space or # or ,
# header = T --> the first line contains the names of the columns 

#CATEGORICAL VARIABLES 
#classes like gender , brand of a product ...
#plots and pie charts

#QUALITATIVE VARIABLES 
#numerical values
#mean, standard deviation
#histograms and boxplot 

#EXERCISE 1 
rm(list = ls())

# import studentdata
# to import a data in R we use the command 'read.table'
studentdata = read.table("data/studentdata.txt", header = T)
head(studentdata)

# How many observations and variables does the dataset contain?
dim(studentdata)

# What kind of variables are there in our dataframe?
# Which are the categorical variables and which are the quantitative ones?
str(studentdata)

#gender is a categorical data --> how do I tell R
studentdata$Gender = as.factor(studentdata$Gender)

#let access a data frame --> attach
attach(studentdata)
help("attach")
detach(studentdata)

#BARPLOT (absolute frequencies) --> just write plot
x11() #to open a graphic devic on the screen 
plot(Gender, col=c('slateblue', 'plum2'), 
     xlab='Gender', 
     ylab='Absolute frequencies', 
     main= 'Barplot Gender')
graphics.off()

table(Gender) # to see the absolute frequencies in number
Gender_abs =table(Gender)
Gender_abs

#relative frequencies table 
Gender_rel <- prop.table(Gender_abs)
Gender_rel

#Barplot (relative frequencies)
x11() #to open a graphic devic on the screen 
barplot(Gender_rel, col=c('slateblue', 'plum2'), 
     xlab='Gender', 
     ylab='Relative frequencies', 
     main= 'Barplot Gender')
graphics.off()

#Pie chart
x11() #to open a graphic devic on the screen 
pie(Gender_rel, col=c('slateblue', 'plum2'), 
        labels= c('Male', 'Female'),
        main= 'Pie char Gender')
graphics.off()

#compute the mode (most frequent item)
Gender_abs[Gender_abs==max(Gender_abs)] #it shows me the value which correspond to the maximum one
#the class with the maximum value is the mode 

### analysisi of the quantitative variable HEIGHT ###
mean(Height)
var(Height) #Unbiased sample variance (n-1)
#if I know the distance from the mean of all variance but not one I can compute it(????!!!!)
sd(Height) #Unbiased sample standard deviation 
min(Height)
max(Height)
median(Height) #the middle part 

#quantile of order alpha 
quantile(Height, 0.25) #Q1
quantile(Height, 0.50) #Q2
quantile(Height, 0.75) #Q3

#in a single command
summary(Height)
summary(Shoes)

#Histogram
hist(Height, 15, main = 'Histogram Height') #y axis = counts
# 10 --> domain -->not too much but enough --> square root of the n° of data (not strict rule)
hist(Height, main = 'Histogram Height', prob = T) #y axis = probability (density)

#specify the number of breaks (classes+1), using the argument 'braks'
x11()
par(mfrow=c(4,1)) # Four plots in the same graphics device
#how to devide the screen when you are plotting
hist(Height,main='Histogram Height',prob=TRUE,breaks=3)
hist(Height,main='Histogram Height',prob=TRUE,breaks=6)
hist(Height,main='Histogram Height',prob=TRUE,breaks=12)
hist(Height,main='Histogram Height',prob=TRUE,breaks=24)
graphics.off()

x11()
par(mfrow=c(2,2))
hist(Height,main='Histogram Height',prob=TRUE,breaks=seq(min(Height),max(Height),length.out=3))
hist(Height,main='Histogram Height',prob=TRUE,breaks=seq(min(Height),max(Height),length.out=5))
hist(Height,main='Histogram Height',prob=TRUE,breaks=c(150,160,165,190,203))
hist(Height,main='Histogram Height',prob=TRUE,breaks=c(150,155,170,175,190,195,203))
graphics.off()

#BOXPLOT
x11()
boxplot(Height, ylab = 'Height', main = 'Boxplot Height')

#to get the outliers 
boxplot(Height, plot = FALSE)$out #it tells me the index of the outliers 
graphics.off()

h <- Height
# I want to get rid of my outliers 
h <- Height[-boxplot(Height, plot = FALSE)$out]

#comparing the groups of male and female 
#are males higher than females?

# histograms devided in groups
x11()
par(mfrow=c(2,1)) # 2 rows, one column 
hist(Height[Gender=='0'],prob=TRUE,xlab='Height',main='Histogram Males',
     col='slateblue',xlim=range(Height),ylim=c(0,0.06),breaks=seq(150,210,by=5))
hist(Height[Gender=='1'],prob=TRUE,xlab='Height',main='Histogram Females',
     col='plum2',xlim=range(Height),ylim=c(0,0.06),breaks=seq(150,210,by=5))

summary(Height[Gender=='0'])
summary(Height[Gender=='1'])
graphics.off()

x11()
#with TILDE
boxplot(Haircut~Gender,col=c('slateblue','plum2'),names=c('Males','Females'),main="Haircut - Males and females")
#tilde in Windows is Alt+126 ~

#compute the main location and dispersion parameters
Haircut_male=Haircut[which(Gender =='0')]
Haircut_male=Haircut[Gender=='0']
Haircut_female=Haircut[which(Gender=='1')]

summary(Haircut_male)
summary(Haircut_female)

#studing the relationshios between two variables 
# Is the length of sleep for a student related to the time at which he or she goes to bed?
Hours_of_sleep = WakeUp - ToSleep
#matrix that bounds in two columns
studentdata=cbind(studentdata,Hours_of_sleep)
head(studentdata)

#scatter plot 
x11()
plot(ToSleep,Hours_of_sleep,xlab='Time at which the student goes to bed',
     ylab='Length of sleep',main="Scatterplot of Hours_of_sleep against ToSleep")
#correlation [-1,1]
cor(ToSleep,Hours_of_sleep)
#negative correlation 

detach(studentdata)


# EXERCISE 3 
#my variables are symmetrical? 

temp <- read.table('data/temperature.txt', header = TRUE, dec=',') #the comma is for decimal
attach(temp)
View(temp)

#when there is no simmetry you see the centre shifted 

x11()
hist(Temperature)
summary(Temperature)
boxplot(Temperature~as.factor(Sex)) #divided in two parts 

#some paramethers are not robust to outliers
