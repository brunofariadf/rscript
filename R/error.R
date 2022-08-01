## ------------------------------------------
##                          Date: 2022-07-27
## ------------------------------------------
## Project: rscript
## Author: Bruno Faria
## 
## GUI: VSCode (1.69.2)
## Language: R (4.1.0)
## Platform: Windows
## ------------------------------------------

# check error
# not export

.error_platform <- function(insert) {
    p_i <- .Platform[["OS.type"]]
    paste0("Method not applied to the ", p_i, " platform.")
}

.error_directory <- function(insert) {
    paste0("'", insert, "' must be character class vector and the a existing directory.")
}

.error_character <- function(insert) {
    paste0("'", insert, "' must be character class vector.")
}

.error_logical <- function(insert) {
    paste0("'", insert, "' must be logical class vector.")
}

.error_numeric <- function(insert) {
    paste0("'", insert, "' must be numeric class vector.")
}

.error_language <- function(insert) {
    paste0("'", insert, "' must be character class vector with option 'r', 'python' or 'julia'.")
}

.error_n_char <- function(insert) {
    paste0("'", insert, "' must be character class vector to length and letter equal 1.")
}

.error_true_false <- function(insert) {
    paste0("'", insert, "' must be logical class vector with option 'TRUE' or 'FALSE'.")
}

.error_comment <- function(insert) {
    paste0("'", insert, "' must be character class vector with option 'h1', 'h2' or 'h3'.")        
}

.error_file_exists <- function(insert) {
    paste0("'", insert, "' must be character class vector and an existing file.")
}

.error_extension <- function(insert) {
    paste0("'", insert, "' must be character class vector with extension file 'r' or 'R'.")
}

.error_python <- function(insert) {
    paste0("Could not find the installation of the '", insert, "'")
}

.error_julia <- function(insert) {
    paste0("Could not find the installation of the '", insert, "'")
}

.error <- function(type, insert) {
    switch(type,
        "platform" = .error_platform(insert),
        "directory" = .error_directory(insert),
        "character" = .error_character(insert),
        "logical" = .error_logical(insert),
        "numeric" = .error_numeric(insert),
        "language" = .error_language(insert),
        "n_char" = .error_n_char(insert),
        "true_false" = .error_true_false(insert),
        "comment" = .error_comment(insert),
        "file_exists" = .error_file_exists(insert),
        "extension" = .error_extension(insert),
        "python" = .error_python(insert),
        "julia" = .error_julia(insert),
        "Unknown error type."
    )
}
