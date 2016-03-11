get_file_path <- function(directory, file_id) {
    if (file_id < 10){
        return(paste(directory,'/00',file_id,'.csv',sep = ''))
    }else if(file_id < 100 && file_id >=10){
        return(paste(directory,'/0',file_id,'.csv',sep = ''))
    }else{
        return(paste(directory,'/',file_id,'.csv',sep = ''))
    }
}

pollutantmean <- function(directory ,pollutant ,id = 1:332){
    for (file_id in id) {
        file_path = get_file_path(directory,file_id)
        data <- read.csv(file_path)
        mean(data$pollutant, na.rm = TRUE)
    }
}