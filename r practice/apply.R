# lapply   always return a list
# lapply(x,fun_c) 就是对list x 中每个元素进行 fun_c 运算，需要的参数往后面填
x <- list(a = 1:5,b = rnorm(10))
y <- lapply(x, mean)

x <- list(matrix(1:6,2,3),matrix(1:8,4,2))
y <- lapply(x,function(elt){
    elt[,1]x
})

#sapply     variant of lapply
#如果返回的 list 每个元素长度都为 1，则返回的是vector
#如果返回的 list 每个元素长度都相等，则返回一个matrix
#否则与 lapply 一样，返回一个list


#apply     针对array的 lapply
#array 就是多维的数据，1维又叫vector，2维又叫matrix,3维以上无别名
#apply(array, margin,func)    array是数据， margin指定第几维,  func是调用的函数
#有现成函数对应matrix rowSums,rowMeans,colSums,colMeans
x <- matrix(rnorm(200),20,10)
#即以x的第一维为基础，分割成20份，再采用lapply
y <- apply(x,1,sum)
#即以x的第二维为基础，分割成10ro份，再采用lapply
y <- apply(x, 2, sum)

#mapply   将传入的list 或 vector 的每一个元素分别作为函数的参数
#eg.list(rep(1,4), rep(2,3), rep(3,2), rep(4,1))  与下列式子等价
#   mapply(rep, 1:4, 4:1)  即将 1:4 4:1的每个元素成对作为函数参数运算

#tapply(array, index, func)
#array 与 index 长度相等 
#取出index中值相等的下标并分组 再分组去array取出对应下标的值作为参数去运算
#v <- c(1:5)
#ind <- c('a','a','a','b','b')
#tapply(v,ind,sum)          
#即将 ind中数据分组，分为a,b两组,a组下标为1，2，3 b组下标为4，5
#去v中取a组下标为1，2，3的数据求和，b组同理

#split 将vector或其他对象分割成不同的组
#与tapply类似但不会运行函数
#常用于 Data Frame