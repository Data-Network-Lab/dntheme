#' dntheme: A minimal customized ggplot2 theme for Data Network
#'
#' A general purpose ggplot2 theme with the company colors
#' palette
#'
#' @docType package
#' @name pilot
#' @importFrom ggplot2 %+replace%
#' @importFrom magrittr %>%
#' @importFrom rlang .data
NULL

# Tell R CMD check about new operators
if(getRversion() >= "2.15.1") {
  utils::globalVariables(c(".", ":="))
}
