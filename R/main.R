## ------------------------------------------
##                          Date: 2022-07-26
## ------------------------------------------
## Project: rscript
## Author: Bruno Faria
## 
## GUI: vscode (1.69.2)
## Language: R (4.1.0)
## Platform: windows (10.0.14393)
## ------------------------------------------

#' Header to R Script
#'
#' Creates header with information from the code development environment, author, and more.
#'
#' @usage script_head(name_author = NULL, 
#'  name_project = NULL, 
#'  type_language = "r", 
#'  type_line = "-", 
#'  type_size = 42, 
#'  add_line = NULL, 
#'  rm_line = NULL, 
#'  clipboard = TRUE)
#' @param name_author character class vector that indicates the author name.
#' @param name_project character class vector that indicates the author project.
#' @param type_language character class vector that indicates the language version with option 'r', 'python' and 'julia'.
#' @param type_line character class vector that indicates the format type to header.
#' @param type_size numeric class vector that indicates the length to header.
#' @param add_line numeric class vector that indicates the vector to add in the header.
#' @param rm_line numeric class vector that indicates the vector to remove in the header.
#' @param clipboard logical class vector that indicates output to clipboard or console with option 'TRUE' or 'FALSE'.
#' @return character class vector with code development environment information.
#' @export 
#' @examples
#' # default
#' # script_head()
#' 
#' # usage other
#' script_head(clipboard = FALSE)
#' script_head(name_author = "test", clipboard = FALSE)
#' script_head(name_author = c("test 1", "test 2", "test 3"), clipboard = FALSE)
#' script_head(name_project = "test 2", clipboard = FALSE)
#' script_head(add_line = "Description: test", 
#'  rm_line = c("Platform", "GUI", "Author"), 
#'  clipboard = FALSE)

script_head <- function(name_author = NULL, name_project = NULL, 
    type_language = "r", type_line = "-", type_size = 42, 
    add_line = NULL, rm_line = NULL, clipboard = TRUE) {

    .check_script_head(name_author, name_project, 
        type_language, type_line, type_size, add_line, rm_line, clipboard)
}

#' Comment Type to Script R
#'
#' Creates title and subtitle as comment to organize the R script.
#'
#' @usage script_comment(x, 
#'  type_comment = 'h1',
#'  type_line = '-',
#'  type_size = NULL,
#'  clipboard = TRUE)
#' @param x character class vector that indicates the message of the title or subtitle of the comment.
#' @param type_comment character class vector that indicates the comment type with option 'h1', 'h2' or 'h3'.
#' @param type_line character class vector that indicates the format type to header.
#' @param type_size numeric class vector that indicates the length to header.
#' @param clipboard logical class vector that indicates output to clipboard or console with option 'TRUE' or 'FALSE'.
#' @return character class vector that indicates the comment type for R script.
#' @export 
#' @examples
#' # default
#' # script_comment("test")
#' 
#' # other usage
#' # h1
#' script_comment('test_1', clipboard = FALSE)
#' script_comment(c("test_1", "test_2"), clipboard = FALSE)
#' 
#' # h2
#' script_comment('test_1', type_comment = "h2", clipboard = FALSE)
#' script_comment(c("test_1", "test_2"), type_comment = "h2", clipboard = FALSE)
#' 
#' # h3
#' script_comment('test_1', type_comment = "h3", clipboard = FALSE)
#' script_comment(c("test_1", "test_2"), 
#'  type_comment = "h3", type_size = 40, clipboard = FALSE)

script_comment <- function(x, type_comment = "h1", 
    type_line = "-", type_size = NULL, clipboard = TRUE) {
    .check_script_comment(x, type_comment, type_line, type_size, clipboard)
}

#' Create R Script
#'
#' Creates the R script with the information header of the code development environment, author, and more.
#'
#' @usage script_create(path, 
#'  name_script, 
#'  name_author = NULL, 
#'  name_project = NULL, 
#'  type_line = "-", 
#'  type_size = 42, 
#'  add_line = NULL, 
#'  rm_line = NULL)
#' @param path character class vector that indicates the directory path.
#' @param name_script character class vector that indicates the file name.
#' @param name_author character class vector that indicates the author name.
#' @param name_project character class vector that indicates the author project.
#' @param type_line character class vector that indicates the format type to header.
#' @param type_size numeric class vector that indicates the length to header.
#' @param add_line numeric class vector that indicates the vector to add in the header.
#' @param rm_line numeric class vector that indicates the vector to remove in the header.
#' @return the R script file with code development environment information in header.
#' @export 
#' @examples
#' # script_create(getwd(), "test 1")
#' # script_create(getwd(), c("test 1", "test 2"))

script_create <- function(path, name_script, name_author = NULL, name_project = NULL, 
        type_line = "-", type_size = 42, add_line = NULL, rm_line = NULL) {

    if (dir.exists(path)) {
        invisible(lapply(name_script, function(i).check_script_create(path, i, 
            name_author, name_project, type_language = "r", 
            type_line, type_size, add_line, rm_line)))
    } else {
        stop(.error("directory", path))
    }
}

#' Count Line of Code
#'
#' Count of code line written in script R. The default counting process ignores comment and empty.
#'
#' @usage script_count(path, exclude = "#|^$")
#' @param path character class vector that indicates the file path.
#' @param exclude character class vector that indicates the default to exclude with regular expression.
#' @return character class vector that indicates the code line count for R script.
#' @export 
#' @examples
#' # default
#' # script_count(path)

script_count <- function(path, exclude = "#|^$") {
    unlist(lapply(path, function(x).check_script_count(x, exclude)))
}
