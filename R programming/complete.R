get_file_path <- function(dir, file_id) {
    if (file_id < 10){
        return(paste(dir,'/00',file_id,'.csv',sep = ''))
    }else if(file_id < 100 && file_id >=10){
        return(paste(dir,'/0',file_id,'.csv',sep = ''))
    }else{
        return(paste(dir,'/',file_id,'.csv',sep = ''))
    }
}

complete <- function(dirctory, id = 1:332) {
    nobs_vector = vector(mode = "numeric")
    for (file_id in id) {
        file_path = get_file_path(dirctory,file_id)
        data <- read.csv(file_path)
        sum_of_complete = sum(complete.cases(data))
        nobs_vector = c(nobs_vector,sum_of_complete)
    }
    frame_of_nobs = data.frame(id = id, nobs = nobs_vector)
    return(frame_of_nobs)
}