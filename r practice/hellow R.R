add_2 <- function(x, y){
    sum = x + y
    return(sum)
}

above <- function(x, n = 10) {
    above_num <- x>n
    x[above_num]
}

mean_of_col <- function(y, remove_NA = TRUE) {
    nc <- ncol(y)
    means <- numeric(nc)
    for (i in 1:nc) {
        means[i] <- mean(y[,i], na.rm = remove_NA)
    }
}