library(RCurl)
data <- getURL("http://biostat.jhsph.edu/~jleek/contact.html")
aa <- strsplit(data,"\n")
aa[[1]][10]

