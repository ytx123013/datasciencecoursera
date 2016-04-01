library('RMySQL')

# 连接远程数据库并查询
# ucscDB <- dbConnect(MySQL(),user="genome",host="genome-mysql.cse.ucsc.edu")
# result <- dbGetQuery(ucscDB,"show databases;")
# dbDisconnect(ucscDB)

# 连接指定数据库
hg19 <- dbConnect(MySQL(),user="genome",db="hg19",host="genome-mysql.cse.ucsc.edu")
# show tables;
all_tables <- dbListTables(hg19)
#desc HInv
field_names <- dbListFields(hg19,"HInv")
dbGetQuery(hg19,"select count(*) from HInv")
# select * from HInv
all_HInv_data <- dbReadTable(hg19,"HInv")

# 按条件查询数据集
query <- dbSendQuery(hg19, "select * from HInv where xxx between xxx and xxx")
subset <- fetch(query)
# 若只想查看前n 行(不会拉去很大数据集)
# subset_head_n <- fetch(query, n=xxx)

# 清理查询结果
dbClearResult(query)

# 断开连接
dbDisconnect(ucscDB)