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

## search the platform
## not export

.is_windows <- function() {
    w_i <- .Platform[["OS.type"]]
    if (w_i == "windows") TRUE else FALSE
}

.is_unix <- function() {
    x_i <- .Platform[["OS.type"]]
    if (x_i == "unix") TRUE else FALSE
}

# .is_reditorsupport <- function() {
#     if (.is_windows()) {
#         editor_i <- Sys.getenv()[["VSCODE_INIT_R"]]
#         grepl(editor_i, pattern = "reditorsupport")
#     }
# }

.is_vscode <- function() {
    if (.is_windows()) {
        if (.exists_vscode()) {
            check_i <- search()
            is.element("tools:vscode", check_i)
        }
    }
}

.is_rstudio <- function() {
    if (.is_windows()) {
        if (.exists_rstudio()) {
            check_i <- search()
            is.element("tools:rstudio", check_i)
        }
    }
}

## search the software
## not export

.exists_vscode <- function() {
    if (.is_windows()) {
        x_i <- shell("where code", intern = TRUE)
        x_i <- file.exists(x_i)
        is.element(TRUE, x_i)
    }
}

.exists_rstudio <- function() {
    if (.is_windows()) {
        program_i <- dirname(Sys.getenv("CommonProgramFiles"))
        path_i <- file.path(program_i, "RStudio", "bin", "rstudio.exe")
        path_i <- suppressWarnings(normalizePath(path_i))
        file.exists(path_i)
    }
}

# .exists_rstudio()

.exists_python <- function() {
    if (.is_windows()) {
        p_i <- shell("where python", intern = TRUE)
        is.element("python.exe", basename(p_i))
    }
}

.exists_julia <- function() {
    if (.is_windows()) {
        j_i <- shell("where julia", intern = TRUE)
        is.element("julia.exe", basename(j_i))
    }
}

.exists_xclip <- function() {
    if (.is_unix()) {
        x_i <- system("which xclip", intern = TRUE)
        # x_i <- file.exists(system("which xclip", intern = TRUE))
        x_i <- file.exists(Sys.which("xclip")[1L])
        if (isTRUE(x_i)) TRUE else FALSE
    }
}

# extract extension in the file
# not export

.exists_extension <- function(path) {
    ext_i <- tolower(tools::file_ext(path))
    ext_i <- is.element("r", ext_i)
    all(ext_i)
}
