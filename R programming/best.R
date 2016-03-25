data <- read.csv('./rprog-data-ProgAssignment3-data/outcome-of-care-measures.csv',colClasses = 'character')
data[,11] <- as.numeric(data[,11])   #Heart Attack
data[, 17] <- as.numeric(data[, 17]) # Heart Failure
data[, 23] <- as.numeric(data[, 23]) # Pneumonia


check_outcome <- function(outcome) {
    valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')
    if(!outcome %in% valid_outcomes){
        stop('invalid outcomes')
    }
}

check_state <- function(state){
    if (!state %in% data$State) {
        stop('invalid state')
    }
}


get_state_data <- function(state) {
    state_data <- data[data[,7] == state,]
    return(state_data)
}

get_col_num <- function(outcome){
    data_col = 0
    if (outcome == 'heart attack'){
        data_col = 11
    }else if(outcome == 'heart failure'){
        data_col = 17
    }else if(outcome == 'pneumonia'){
        data_col = 23
    }
    return(data_col)
}

best <- function(state,outcome) {
    valid_outcomes <- c('heart attack', 'heart failure', 'pneumonia')

    if (!state %in% data$State) {
        stop('invalid state')
    }else if(!outcome %in% valid_outcomes){
        stop('invalid outcomes')
    }else{
        row = 0
        data_col = 0
        if (outcome == 'heart attack'){
            data_col = 11
        }else if(outcome == 'heart failure'){
            data_col = 17
        }else if(outcome == 'pneumonia'){
            data_col = 23
        }
        data_01 = cbind(data[,2],data[,data_col],data[,7])
        data_02 = cbind(data_01[,1][data_01[,3] == state],data_01[,2][data_01[,3] == state])
        return(data_02[match(min(as.numeric(data_02[,2]),na.rm = TRUE),data_02[,2]),1])
    }
}


rankhospital <- function(state,outcome,num = 'best') {
    check_outcome(outcome)
    check_state(state)
    
    row <- 0
    data_col <- 0
    state_data <- get_state_data(state)
    data_col <- get_col_num(outcome)
    data_01 <- cbind(state_data[,2],state_data[,data_col],state_data[,7])
    ordered_data <- data_01[order(as.numeric(data_01[,2]),data_01[,1]),]
    if (nrow(data_01) == 1) {
        ordered_data <- data_01
    }
    if (num == 'best') {
        return(ordered_data[1,1])
    }else if(num == 'worst'){
        ordered_data <- data_01[order(as.numeric(data_01[,2]),decreasing = TRUE),]
        if (nrow(data_01) == 1) {
            ordered_data <- data_01
        }
        return(ordered_data[1,1])
    }else{
        if (num > nrow(ordered_data)) {
            return(NA)
        }
        return(ordered_data[num,1])
    }
}

rankall <- function(outcome,num = 'best') {
    check_outcome(outcome)
    data_frame <- data.frame(hospital = c(NA),state = c(NA))
    for (state in unique(data$State)) {
        rankInfo <- rankhospital(state,outcome,num)
        data_frame <- rbind(data_frame,c(rankInfo,state))
    }
    data_frame <- data_frame[-1,]
    return(data_frame[order(data_frame$state),])
}
