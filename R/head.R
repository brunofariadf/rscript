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

## format comment to script
## not export

.format_comment_line <- function(...) {
    paste0("## ", ...)
}

# .format_comment_line(c("test", "test 2"))

## format the structure from comment to script
## not export

.format_comment_structure <- function(type_line, type_size) {
    .format_comment_line(paste0(rep(type_line, type_size), collapse = ""))
}

# .format_comment_structure("-", 80)

## format comment to script
## not export

.format_content_comment <- function(x, type_comment) {
    if (type_comment == "h1") {
        paste0(.format_comment_line(x), " - date: ", format.POSIXct(Sys.time()))
    } else if (type_comment == "h2") {
        paste0(.format_comment_line(x))
    } else if (type_comment == "h3") {
        x
    }
}

# .format_content_comment("test", "h1")
# .format_content_comment("test", "h2")
# .format_content_comment("test", "h3")

## format comment to script create
## not export

.format_content_create_head <- function() {
    .format_comment_line(gsub("\\,", "", toString(rep(" ", 13))), "Date: ", Sys.Date())
}

# .format_content_create_head()

## format comment to script create
## not export

.format_content_create_basic <- function(name_author, name_project, type_language, add_line) {
    .format_comment_line(
        c(
            paste0("Project: ", name_project),
            paste0("Author: ", name_author),
            paste0(""),
            paste0("GUI: ", .format_gui()),
            paste0("Language: ", .format_language(type_language)),
            paste0("Platform: ", .format_platform()),
            add_line
        )
    )
}

# .format_content_create_basic("Bruno", "test", "julia", NULL)

## format content to script
## not export

.join_content_format <- function(name_author, name_project, type_language, 
    type_line, type_size, add_line) {
    c(
        .format_comment_structure(type_line, type_size),
        .format_content_create_head(),
        .format_comment_structure(type_line, type_size),
        .format_content_create_basic(name_author, name_project, type_language, add_line),
        .format_comment_structure(type_line, type_size)
    )
}

# .join_content_format("Bruno", "Test", "julia", "-", 42, NULL)

.join_content_format_rm <- function(name_author, name_project, 
    type_language, type_line, type_size, add_line, rm_line) {
    basic_i <- .join_content_format(name_author, name_project, type_language, 
        type_line, type_size, add_line)
    Filter(function(x)!grepl(x, pattern = paste0(rm_line, collapse = "|")), basic_i)
}

# .join_content_format_rm("Bruno", "Test", "julia", "-", 42, NULL, "Platform")

.join_content_format_add <- function(name_author, name_project, 
    type_language, type_line, type_size, add_line) {
    .join_content_format(name_author, name_project, 
        type_language, type_line, type_size, add_line)
}

# .join_content_format_add("Bruno", "Test", "julia", "-", 42, "Welcome!")

.join_content_format_rm_add <- function(name_author, name_project, 
    type_language, type_line, type_size, add_line, rm_line) {
    add_i <- .join_content_format_add(name_author, name_project, 
        type_language, type_line, type_size, add_line)
    Filter(function(x)!grepl(x, pattern = paste0(rm_line, collapse = "|")), add_i)
}

# .join_content_format_rm_add("Bruno", "Test", "julia", "-", 42, "Welcome!", c("Platform", "GUI"))

# engineer head
## not export

.get_script_head <- function(name_author, name_project, 
    type_language, type_line, type_size, add_line, rm_line, clipboard) {
    if (is.null(add_line) && is.null(rm_line)) {
        h_i <- .join_content_format(name_author, name_project, 
            type_language, type_line, type_size, add_line)
        .write_clip(h_i, clipboard)
    } else if (!is.null(add_line) && is.null(rm_line)) {
        h_i <- .join_content_format_add(name_author, name_project, 
            type_language, type_line, type_size, add_line)
        .write_clip(h_i, clipboard)
    } else if (is.null(add_line) && !is.null(rm_line)) {
        h_i <- .join_content_format_rm(name_author, name_project, 
            type_language, type_line, type_size, add_line, rm_line)
        .write_clip(h_i, clipboard)
    } else if (!is.null(add_line) && !is.null(rm_line)) {
        h_i <- .join_content_format_rm_add(name_author, name_project, 
            type_language, type_line, type_size, add_line, rm_line)
        .write_clip(h_i, clipboard)
    }
}
