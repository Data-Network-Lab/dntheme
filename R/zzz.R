# Options

#' Set the font family used for all supported text elements
#'
#' The font family used for each text element is controlled through a set of
#' options. This function sets each of these options to the same family,
#' allowing you to quickly customize the font family used by the theme.
#' Individual family options can be set with \code{options}.
#'
#' @param family The name of the font family to use.
#' @param title_family The name of the font family to use for the main chart
#'   title. This is an optional argument that lets you use a different font
#'   family for the main title. The argument is ignored if the value is NULL.
#'   The default value is NULL.
#' @export

set_dn_family <- function(family, title_family = NULL) {
  if (is.null(title_family)) title_family <- family
  options(dn.title_family = family)
  options(dn.subtitle_family = family)
  options(dn.axis_title_family = family)
  options(dn.axis_text_family = family)
  options(dn.legend_title_family = family)
  options(dn.legend_text_family = family)
  options(dn.facet_title_family = family)
  options(dn.caption_family = family)
  options(dn.geom_text_family = family)
  options(dn.annotate_family = family)
}

.onLoad <- function(libname, pkgname) {

  ## add G font "Raleway"
  sysfonts::font_add("raleway", here::here("inst", "fonts", "Raleway-Regular.ttf"))
  sysfonts::font_add("raleway_bold", here::here("inst", "fonts", "Raleway-ExtraBold.ttf"))

  # Set a default fonts if system can't be detected
  family <- "raleway"
  family_bold <- "raleway_bold"
  title_family <- family_bold


  # turn on showtext
  showtext::showtext_auto()

  # # Set a default font for each main desktop OS
  # switch(Sys.info()[['sysname']],
  #        Windows = {
  #          family <- "Trebuchet MS"
  #          title_family <- family},
  #        Linux = {
  #          family <- ""
  #          title_family <- family},
  #        Darwin = {
  #          family <- "Avenir Next"
  #          title_family <- "Avenir Next Demi Bold"})

  # Set default options if options have not already been set
  op <- options()

  op_dn <- list(
    dn.title_family = title_family,
    dn.subtitle_family = family,
    dn.axis_title_family = family,
    dn.axis_text_family = family,
    dn.legend_title_family = family,
    dn.legend_text_family = family,
    dn.facet_title_family = family,
    dn.caption_family = family,
    dn.geom_text_family = family,
    dn.annotate_family = family)

  to_set <- !(names(op_dn) %in% names(op))
  if (any(to_set)) options(op_dn[to_set])
  invisible()
}
