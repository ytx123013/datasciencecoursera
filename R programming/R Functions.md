#R Functions

##basic func
***
unique():去重复  
%in%:是否存在于某个vector中  
match(x,y):查找x在y中的位置  
sort()  
order(a,b,c...):排序，现以a排序，再按b排序

##About read data
read.fwf()   Read a table of fixed width formatted data into a data.frame

##About debug
***
debug()  
trackbace()

##About file
***
list.files()  
file.exists()  
dir.create()  

##About Download
***
download.file())   method:curl(https)

##About data.frame
***
head()  
tail()  
names()  
ncol()  
nrow()  
##About data.table
***
tables():显示加载在内存中的所有table  
为data(a,b)添加一列c,使得该行c=a+b data[,c:={a+b}]  
关键字by a:根据a分组

##About string
strsplit()  分割字符串

##About na
na.omit()

##str
***
compactly display the structure of an R object  


##gl
***


##apply
***

##Generating Random Numbers
***  
各种分布在r中函数如下图  
![Alt text](./functions.jpg)  
注意使用r时先调用set.seed()

* sample():抽样函数

##System.time()
***
计算一个函数执行需要消耗的时间  
user time:cpu 处理的时间  
elapsed time:你等待的时间

##Rprof()
***
by.total  
by.self  
summaryRprof()