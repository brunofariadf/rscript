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

# check head
# not export

.check_script_head <- function(name_author, name_project, 
    type_language, type_line, type_size, add_line, rm_line, clipboard) {

    if (!.is_windows()) {
        stop(.error("platform", NULL))
    }

    if (!is.null(name_author)) {
        if (!is.character(name_author)) {
            stop(.error("character", name_author))
        }
    }

    if (!is.null(name_project)) {
        if (!is.character(name_project)) {
            stop(.error("character", name_project))
        }
    }

    if (!is.character(type_language)) {
        stop(.error("character", type_language))
    }

    if (!is.element(tolower(type_language), c("r", "python", "julia"))) {
        stop(.error("language", type_language))
    }

    if (tolower(type_language) == "python") {
        if (!.exists_python()) {
            stop(.error("python", type_language))
        }
    }

    if (tolower(type_language) == "julia") {
        if (!.exists_julia()) {
            stop(.error("julia", type_language))
        }
    }

    if (!is.character(type_line)) {
        stop(.error("character", type_line))
    }

    if (!nchar(type_line) == 1 && length(type_line) == 1) {
        stop(.error("n_char", type_line))
    }

    if (!is.numeric(type_size)) {
        stop(.error("numeric", type_size))
    }

    if (!is.null(add_line)) {
        if (!is.character(add_line)) {
            stop(.error("character", add_line))
        }
    }

    if (!is.null(rm_line)) {
        if (!is.character(rm_line)) {
            stop(.error("character", rm_line))
        }
    }

    if (!is.logical(clipboard)) {
        stop(.error("logical", clipboard))
    }

    if (!is.element(clipboard, c(TRUE, FALSE))) {
        stop(.error("true_false", clipboard))
    }

    .get_script_head(name_author, name_project, 
        type_language, type_line, type_size, add_line, rm_line, clipboard)
}

# check comment
# not export

.check_script_comment <- function(x, type_comment, type_line, type_size, clipboard) {

    if (!.is_windows()) {
        stop(.error("platform", NULL))
    }

    if (!is.character(x)) {
        stop(.error("character", x))
    }

    if (!is.character(type_comment)) {
        stop(.error("character", type_comment))
    }

    if (!is.element(type_comment, c("h1", "h2", "h3"))) {
        stop(.error("comment", type_comment))
    }

    if (!is.character(type_line)) {
        stop(.error("character", type_line))
    }

    if (!nchar(type_line) == 1 && length(type_line) == 1) {
        stop(.error("n_char", type_line))
    }

    if (!is.null(type_size)) {
        if (!is.numeric(type_size)) {
            stop(.error("numeric", type_size))
        }
    }

    if (!is.logical(clipboard)) {
        stop(.error("logical", clipboard))
    }

    if (!is.element(clipboard, c(TRUE, FALSE))) {
        stop(.error("true_false", clipboard))
    }

    .get_check_script_comment(x, type_comment, type_line, type_size, clipboard)
}

# check create
# not export

.check_script_create <- function(path, name_script, name_author, name_project, 
        type_language, type_line, type_size, add_line, rm_line) {

    if (!.is_windows()) {
        stop(.error("platform", NULL))
    }

    if (!is.character(name_script)) {
        stop(.error("character", name_script))
    }

    if (!is.null(name_author)) {
        if (!is.character(name_author)) {
            stop(.error("character", name_author))
        }
    }

    if (!is.null(name_project)) {
        if (!is.character(name_project)) {
            stop(.error("character", name_project))
        }
    }

    if (!is.character(type_language)) {
        stop(.error("character", type_language))
    }

    if (!is.character(type_line)) {
        stop(.error("character", type_line))
    }

    if (!nchar(type_line) == 1 && length(type_line) == 1) {
        stop(.error("n_char", type_line))
    }

    if (!is.numeric(type_size)) {
        stop(.error("numeric", type_size))
    }

    if (!is.null(add_line)) {
        if (!is.character(add_line)) {
            stop(.error("character", add_line))
        }
    }

    if (!is.null(rm_line)) {
        if (!is.character(rm_line)) {
            stop(.error("character", rm_line))
        }
    }

    .get_script_create(path, name_script, name_author, name_project, 
        type_language, type_line, type_size, add_line, rm_line)
}

# check count
# not export

.check_script_count <- function(path, exclude) {

    if (!.is_windows()) {
        stop(.error("platform", NULL))
    }

    if (!is.character(path)) {
        stop(.error("character", path))
    }

    if (!file.exists(path)) {
        stop(.error("file_exists", path))
    }

    if (!.exists_extension(path)) {
        path_i <- toString(basename(path))
        stop(.error("extension", path_i))
    }

    if (!is.character(exclude)) {
        stop(.error("character", exclude))
    }

    .get_script_count(path, exclude)
}
