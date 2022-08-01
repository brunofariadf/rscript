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

## ------------------------------------------
## engineer
## ------------------------------------------

# get comment
# not export

.get_check_script_comment <- function(x, type_comment, type_line, type_size, clipboard) {
    if (type_comment == "h1") {
        if (is.null(type_size)) {
            comment_i <- unlist(lapply(x, 
                function(i).join_comment_format(i, type_comment, type_line, type_size = 80)))
            .write_clip(comment_i, clipboard)
        } else if (!is.null(type_size)) {
            comment_i <- unlist(lapply(x, 
                function(i).join_comment_format(i, type_comment, type_line, type_size)))
            .write_clip(comment_i, clipboard)
        }
    } else if (type_comment == "h2") {
        if (is.null(type_size)) {
            comment_i <- unlist(lapply(x, 
                function(i).join_comment_format(i, type_comment, type_line, type_size = 42)))
            .write_clip(comment_i, clipboard)
        } else if (!is.null(type_size)) {
            comment_i <- unlist(lapply(x, 
                function(i).join_comment_format(i, type_comment, type_line, type_size)))
            .write_clip(comment_i, clipboard)
        }
    } else if (type_comment == "h3") {
        if (is.null(type_size)) {
            comment_i <- unlist(lapply(x, 
                function(i).join_comment_format(i, type_comment, type_line, type_size = 3)))
            .write_clip(comment_i, clipboard)
        } else if (!is.null(type_size)) {
            comment_i <- unlist(lapply(x, 
                function(i).join_comment_format(i, type_comment, type_line, type_size)))
            .write_clip(comment_i, clipboard)
        }
    }
}

# .get_check_script_comment(c("1", "2"), "h1", "-", NULL, TRUE)
# .get_check_script_comment(c("1", "2"), "h2", "-", NULL, TRUE)
# .get_check_script_comment(c("1", "2"), "h3", "-", NULL, TRUE)

# get create
# not export

.get_script_create <- function(path, name_script, name_author, name_project, 
            type_language, type_line, type_size, 
            add_line, rm_line) {
    .write_r(
        .get_script_head(name_author, name_project, 
            type_language, type_line, type_size, 
            add_line, rm_line, clipboard = FALSE),
        path, name_script
    )
}

# .join_comment_format("test", "h1", "-", 80)
# .join_comment_format("test", "h2", "-", 40)
# .join_comment_format("test", "h3", "-", 3)

# count line
# not export

.get_script_count <- function(path, exclude) {
    file_i <- trimws(suppressWarnings(readLines(path)))
    file_i <- Filter(function(x)!grepl(x, pattern = exclude), file_i)
    n_i = length(file_i)
    names(n_i) <- basename(path)
    return(n_i)
}

## ------------------------------------------
## utils engineer
## ------------------------------------------

## format comment to script
## not export

.join_comment_format <- function(x, type_comment, type_line, type_size) {
    if (is.element(type_comment, c("h1", "h2"))) {
        c(
            .format_comment_structure(type_line, type_size),
            .format_content_comment(x, type_comment),
            .format_comment_structure(type_line, type_size)
        )
    } else if (type_comment == "h3") {
        h3_i <- paste0(rep(type_line, type_size), collapse = "")
        .format_comment_line(paste0(x, " ", h3_i))
    }
}

# get gui
# not export

.get_gui <- function() {
    if (.is_windows()) {
        if (.is_vscode()) {
            .vsc_ver <- shell("code --version", intern = TRUE)[1]
            paste0("VSCode", " (", .vsc_ver, ")")
        } else if (.is_rstudio()) {
            program_i <- dirname(Sys.getenv("CommonProgramFiles"))
            path_i <- file.path(program_i, "RStudio", "VERSION")
            path_i <- suppressWarnings(normalizePath(path_i))
            .rstudio_ver <- suppressWarnings(readLines(path_i))
            paste0("RStudio", " (", .rstudio_ver, ")")
        } else {
            .Platform[["GUI"]]
        }
    }
}

# get language
# not export

.get_language <- function(type) {
    if (.is_windows()) {
        if (tolower(type) == "r") {
            r_i <- paste0(R.Version()[["major"]], ".", R.Version()[["minor"]])
            paste0("R (", r_i, ")")
        } else if (tolower(type) == "python") {
            p_i <- shell("python --version", intern = TRUE)
            paste0(gsub("\\ ", "\\ (", p_i), ")")
        } else if (tolower(type) == "julia") {
            j_i <- shell("julia --version", intern = TRUE)
            j_i <- paste0(gsub("\\bversion\\b ", "\\(", j_i), ")")
            gsub("\\bjulia\\b", "Julia", j_i)
        }
    }
}
