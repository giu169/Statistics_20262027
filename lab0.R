#R can also be used as a calculator 

5*12 
sqrt(9)
log(1) #logarithm based e (natural logarithm)
(12*2)+2
log10(100) #logarithm based 10

#MATRIXES AND VECTORS
#vector = a column of numbers 
a <- 2 
#left arrow is the left hand assignment --> it assigns the value on the right to the variable name on the left 
b = 2
#I can also assign with the equal sign (=)
c <- a*b
v1 <- c(2,4,7,10)
letters = c('a', 'b', 'c')
# a vector can also be made by letters too --> with ''
matrix(0, nrow = 3, ncol = 2)

2 = 3
2 = 2 
#it's an assignment --> Error

a == b 
#it's not an assignment
a == 3

a<- 7
#I re-assign 

v2 <- 1:10
#I'll have in this vector all the numbers from 1 to 10 

a <- 2
a <-10

v3 <-seq(0, 5, by = 0.5)
#sequence of numbers from 0 to 5 with pace of 0.5 
help("seq")

v4 <- rep(1,10)
#vector made by the repetition of 1 10 times 
help("rep")

#you can also bind vectors 
v5 <- c(v3,v4)
v5

matrix(0, nrow = 3, ncol = 2)
matrix(1:12, nrow = 4, ncol = 3)

matrix(0, nrow = 3, ncol = 2)
matrix(1:12, nrow = 3, ncol = 3)

M1 <- matrix(1:12, nrow = 4, ncol = 3)
M1
M2 <- matrix(1:12, nrow = 4, ncol =3, byrow = TRUE) #starts with filling the rows before 
M2 

v6 <- c(1,2,3)
v7 <- c(4,5,6)

#I can create a matrix binding two vectors

#binding the columns 
M3 <- cbind(v6, v7)
M3

#binding the rows 
M4 <- rbind(v6,v7)
M4

M5 <- t(M4)
M5

#transposition of a matrix -> the rows become the columns 

#a column in R is not a matrix 
is.matrix(v6)
#I re-assign v6 to be a matrix
v6 <- as.matrix(v6)
is.matrix(v6)
v6

length(v6)

#access elements
v6[4]
v6[1]

#access many elements 
v6[1:2]
#with indices
v6[c(1,3)]

M3
M3[2,2]
#in second row and second column 

M3[1:2,2]
M3
#first two numbers of the second column 

#all the first row 
M3[1,] 
#all the first column 
M3[,2]

#list of all the elements from the environment
ls() 
#remove --> in this case M3
rm(M3)
ls()
rm(list = ls()) 
#I remove all the elements of the environment 

M3
#error

#OPERATIONS WITH VARIABLES 
a = 1
b = 2
c <- c(2,3,4)
d <- rep(10,3) #repetition of 10 3 times

a+b
a*b
a/b
a-b
exp(a)

e <- 1:3
f <- rep(10,5)
e
f

e+f
#one of the two elements is longer 
#it is allowed but it gives you a warning 

#a vector + a scalar -> ads a to each element of e 
a+e

M1 <- matrix(1:12, nrow = 4, ncol = 3)
M2 <- rbind(rep(0,3), 1:3, 10:12, c(4,7,1))
M1
M2

M1+M2

M1*M2
M1 %*% M2 
#I should have nrowM1=ncolM2 --> non conformable arguments

dim(M1)
dim(M2)
#it gives me 4 rows 3 columns 
M2 <- t(M2)
M2
M1 %*% M2
#a matrix with the number of rows of the first matrix and the number of columns of the second matrix 

M1+a
M1

M1*2

e
sum(e)
prod(e)
M1
#I want the sum of elements of each column 
colSums(M1)

#Boolean variables 
a
bool1 <- a==1
bool1

a==1 #equal
a!=2
a!=1 #different

a>=1
a>1

if(a==1){
  cat("ciao")
}else{
  cat("bye")
}

if(a > 1){
  cat("ciao")
}else{
  cat("bye")
}

help(cat)

#I want to bind e with f
e
g <- c(e,f)
g

#I use a loop for

for(i in 1:10){
  cat("ciao\n")
  cat(i)
}

for(i in 1:length(g)){
 g[i] <- g[i]-1
}
g
#for every element in g I substract 1

#data.frames 
exam = data.frame(id=c(123, 456, 789), 
                  written = c(19, 30, 32), 
                  projects = c(30, 27, 25))
#I have to separate all the variables with a comma 

exam
exam$id #it gives me the vector with only the student id 
ID <- exam$id
ID

attach(exam)
id
detach(exam)

help(detach)
  
#graphics 
x = 0:3
x
y <- c(4,5,2,10)
plot(x,y, pch = 19)
#in this way I'll have dots
plot(x,y, type = "line")

x11()
quartz()
plot(x,y, type ="l", col = "red")

y2 <- c(1,2,3,4)
points(x,y2)
# I don't write plot otherwise it would substitute the previous one

lines(x,y2)

#how to I define funcion if I want to build my own function 
Heaviside_step_function <- function(x){
  if(x<0) return(0)
  return(1)
}

Heaviside_step_function(0)
Heaviside_step_function(2)
Heaviside_step_function(0)
Heaviside_step_function(-1)

#gets error you don't know --> use browser()
Heaviside_step_function <- function(x){
  browser()
  if(x<0) return(0)
  return(1)
}

Heaviside_step_function(0)

