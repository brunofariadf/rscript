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

# format gui
# not export

.format_gui <- function() {
    tryCatch(.get_gui(), error = function(i)"")
}

#.format_gui()

.format_language <- function(type) {
    tryCatch(.get_language(type), error = function(i)"")
}

# .format_language("julia")

## format the  platform with the version to create the script
## not export

.format_platform <- function() {
    if (.is_windows()) {
        as.vector(Sys.info()["sysname"])
    } else if (.is_unix()) {
        as.vector(Sys.info()["sysname"])
    }
}

# .format_platform()

# export clipboard
# not export

.write_clip <- function(x, clipboard) {
    if (isTRUE(clipboard)) {
        clipr::write_clip(x)
        message("Copied.")
    } else if (isFALSE(clipboard)) {
        return(x)
    }
}

## export r
## not export

.write_r <- function(x, path, name_script) {
    path_i <- file.path(path, paste0(name_script, ".R"))
    path_i <- suppressWarnings(normalizePath(path_i))
    writeLines(x, con = path_i, sep = "\n")
}

# check version
# not export

.count_version <- function(path, date, dev = TRUE) {
    .version <- function(x) {
        if (unique(x) == 0) {
            return(0)
        } else {
            return(max(x))
        }
    }

    if (file.exists(path)) {
        if (date == "start") {
            return("0.0.0.9000")
        } else {
            df_i <- utils::read.csv2(path, sep = ",")
            df_i <- if (date == "all") df_i else df_i[df_i[["date"]] <= as.Date(date),]
            major_i <- .version(df_i[["version"]])
            minor_i <- sum(grepl(df_i[["type"]], pattern = "minor"))
            patch_i <- sum(grepl(df_i[["type"]], pattern = "patch"))
            dev_i <- if (isTRUE(dev)) ".9000" else ""
            paste0(major_i, ".", minor_i, ".", patch_i, dev_i, " (", date, ")")
        }
    } else {
        stop("unknown file path.")
    }
}
