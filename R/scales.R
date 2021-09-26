# Scales

#' Extract Data Network colors as hex codes
#'
#' @param ... Names of colors in \code{dn_colors}.
#' @export

get_dn_colors <- function(...) {

  colors <- c(...)
  if (is.null(colors))
    return (dn_colors)
  dn_colors[colors]
}

#' Return a function which interpolates a dn color palette
#'
#' @param palette Name of palette in \code{dn_palettes}.
#' @param reverse Boolean to indicate whether the palette should be reversed.
#' @param ... Additional arguments to pass to \code{colorRampPalette}.
#' @export

get_dn_palette <- function(
  palette = "five",
  reverse = FALSE, ...) {

  dn_palettes <- list(
    two =   get_dn_colors(
      "han_purple",
      "maximum_blu_purple"),
    three =  get_dn_colors(
      "han_purple",
      "maximum_blu_purple",
      "lavender_blue_1"),
    four = get_dn_colors(
      "han_purple",
      "maximum_blu_purple",
      "lavender_blue_1",
      "lavender_blue_2"),
    five = get_dn_colors(
      "han_purple",
      "maximum_blu_purple",
      "lavender_blue_1",
      "lavender_blue_2",
      "sky_blue_crayola"),
    six = get_dn_colors(
      "han_purple",
      "maximum_blu_purple",
      "lavender_blue_1",
      "lavender_blue_2",
      "sky_blue_crayola",
      "turquoise_1"),
    seven = get_dn_colors(
      "han_purple",
      "maximum_blu_purple",
      "lavender_blue_1",
      "lavender_blue_2",
      "sky_blue_crayola",
      "turquoise_1",
      "turquoise_2"))

  p <- dn_palettes[[palette]]
  if (reverse) p <- rev(p)
  grDevices::colorRampPalette(p, ...)
}

#' Color scale for dn colors
#'
#' @param palette Name of palette in \code{dn_palettes}.
#' @param discrete Boolean to indicate if color aesthetic is discrete.
#' @param reverse Boolean to indicate whether palette should be reversed.
#' @param ... Additional arguments passed to \code{discrete_scale} or
#'   \code{scale_color_gradientn}, depending on the value of \code{discrete}.
#' @export

scale_color_dn <- function(
  palette = "seven",
  discrete = TRUE,
  reverse = FALSE, ...) {

  p <- get_dn_palette(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(
      "color", paste0("dn_", palette), palette = p, ...)
  } else {
    ggplot2::scale_color_gradientn(colors = p(256), ...)
  }
}

#' Fill scale for dn colors
#'
#' @param palette Name of palette in \code{dn_palettes}.
#' @param discrete Boolean to indicate if color aesthetic is discrete.
#' @param reverse Boolean to indicate whether palette should be reversed.
#' @param ... Additional arguments passed to \code{discrete_scale} or
#'   \code{scale_color_gradientn}, depending on the value of \code{discrete}.
#' @export

scale_fill_dn <- function(
  palette = "seven",
  discrete = TRUE,
  reverse = FALSE, ...) {

  p <- get_dn_palette(palette = palette, reverse = reverse)

  if (discrete) {
    ggplot2::discrete_scale(
      "fill", paste0("dn_", palette), palette = p, ...)
  } else {
    ggplot2::scale_fill_gradientn(colors = p(256), ...)
  }
}
