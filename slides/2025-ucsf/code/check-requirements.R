## helper function
regex_extract <- function(x, pattern)
    regmatches(x = x,
               m = regexpr(pattern = pattern,
                           text    = x))

rmd_files <-
  list.files(path       = ".",
             pattern    = "*\\.qmd$",
             full.names = TRUE,
             recursive  = TRUE)

rmd_files <- lapply(rmd_files, readLines)

packages_1 <-
  lapply(rmd_files,
         function(x) {
           grep(pattern = "(::|library\\(|require\\()",
                x = x, value = TRUE)
         })


lib_or_req <-
  lapply(packages_1,
         function(x) {
           gsub(pattern = "(require|library|\\(|\\))", "",
                regex_extract(x,
                              "(^library|^require)\\((.*?)\\)"))
         })

lib_or_req <- unlist(lib_or_req)

colon_lib <-
  lapply(packages_1,
         function(x) {
           pkgs <- regex_extract(x,
                                 "\\s*(\\w*)::")
           trimws(gsub("::", "", pkgs))
         })

colon_lib <- unlist(colon_lib)

to_inst <- unique(c(lib_or_req, colon_lib))
to_inst <- to_inst[to_inst != ""]
installed <- installed.packages()[, 1]
to_inst <- to_inst[!to_inst %in% installed]

if (length(to_inst) > 0)
    install.packages(to_inst)
