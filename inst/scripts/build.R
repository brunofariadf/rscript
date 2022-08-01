## ------------------------------------------
##                          Date: 2022-07-28
## ------------------------------------------
## Project: vscoder
## Author: Bruno Faria
## 
## GUI: VSCode (1.69.2)
## Language: R (4.1.0)
## Platform: Windows
## ------------------------------------------

## --------------------------------------------------------------------------------
## set variable - date: 2022-07-28 15:44:11
## --------------------------------------------------------------------------------

path_csv <- file.path("inst", "exdata", "version", "news.csv")
path_rmd <- file.path("inst", "exdata", "version", "news.Rmd")
path_md <- file.path("inst", "exdata", "version", "NEWS.md")
path_news <- file.path(getwd(), "NEWS.md")

## --------------------------------------------------------------------------------
## News - date: 2022-07-28 15:47:39
## --------------------------------------------------------------------------------

rmarkdown::render(input = path_rmd, output_file = path_news)

## ------------------------------------------
## remove
## ------------------------------------------

rm(path_csv, path_md, path_news, path_rmd)
