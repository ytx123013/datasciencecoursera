get_file_path <- function(directory, file_id) {
    if (file_id < 10){
        return(paste(directory,'/00',file_id,'.csv',sep = ''))
    }else if(file_id < 100 && file_id >=10){
        return(paste(directory,'/0',file_id,'.csv',sep = ''))
    }else{
        return(paste(directory,'/',file_id,'.csv',sep = ''))
    }
}

means_of_cities = vector(mode = "numeric")

pollutantmean <- function(directory ,pollutant ,id = 1:332){
    for (file_id in id) {
        file_path = get_file_path(directory,file_id)
        data <- read.csv(file_path)
        index = 2
        if (pollutant == "sulfate"){
            index = 2
        }else{
            index = 3
        }
        print(index)
        mean_of_this_city = mean(data[,index], na.rm = TRUE)
        means_of_cities <- c(means_of_cities, mean_of_this_city)
    }
    mean(means_of_cities)
}