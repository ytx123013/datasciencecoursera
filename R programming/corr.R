corr <- function(directory, threshold = 0) {
    complete_frame = complete("specdata", 1:332)
    ids_of_files = complete_table$id[complete_table[["nobs"]] > threshold]
    cor_vector = vector(mode = "numeric")
    for (file_id in ids_of_files) {
        file_path = get_file_path(directory,file_id)
        data <- read.csv(file_path,comment.char = "")
        valid_data_index = complete.cases(data)
        cor_of_file = cor(data$sulfate[valid_data_index],data$nitrate[valid_data_index])
        cor_vector = c(cor_vector,round(cor_of_file,5))
    }
    return(cor_vector)
}