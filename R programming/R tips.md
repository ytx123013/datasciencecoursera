#关于data.frame
***
##创建一个空的data.frame
aaaa <- data.frame(state = c(NA),hos = c(NA))
aa <- aaaa[-1,]  
添加完后执行  
aa <- aa[-1,]  
删除掉第一行即可

##data.frame按某一列排序
data[order(data$a),]

##data.frame添加一行
空的data.frame使用rbind添加会改变names

##注意
如果data.frame只有一行,则data[1,]为character