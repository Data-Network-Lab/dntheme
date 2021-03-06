#' @title dn geom
#' @description most of the code is from emoGG https://github.com/dill/emoGG
#'
#' @param x raster grob x dim
#' @param y raster grob y dim
#' @param size logo size
#' @param theme inherits theme
#' @param geom_key which logo
#'
#' @export geom_dn
#'
#' @export
dnGrob <- function(x, y, size, theme, geom_key = list(
  dn_logo = "please insert logo",
  google = "http://logok.org/wp-content/uploads/2015/09/Google-logo-2015-G-icon.png"
)) {

  img <- grDevices::as.raster(png::readPNG(RCurl::getURLContent(geom_key[[theme[[1]]]])))

  grid::rasterGrob(x             = x,
                   y             = y,
                   image         = img,
                   # only set height so that the width scales proportionally and so that the icon
                   # stays the same size regardless of the dimensions of the plot
                   height        = size * ggplot2::unit(10, "mm"))
}

Geomdn <- ggplot2::ggproto(`_class` = "Geomdn",
                             `_inherit` = ggplot2::Geom,
                             required_aes = c("x", "y"),
                             non_missing_aes = c("size", "theme"),
                             default_aes = ggplot2::aes(size = 1, theme = "google"),

                             draw_panel = function(data, panel_scales, coord, na.rm = FALSE) {
                               coords <- coord$transform(data, panel_scales)
                               ggplot2:::ggname(prefix = "geom_dn",
                                                grob = dnGrob(
                                                  x = coords$x,
                                                  y = coords$y,
                                                  size = coords$size,
                                                  theme = coords$theme))
                             })

#' @title dn Icon Ggplot Layer
#' @description The geom is used to create scatterplots but with a dn Company logo instead of the
#'   points. See \code{?ggplot2::geom_points} for more info. This geom works exactly the same as
#'   that geom except you cannot change the color as it is a PNG.
#' @inheritParams ggplot2::geom_point
#' @export
#' @examples \dontrun{
#'   sample.data <- data.frame(x = c(1:4, 1:4), y = c(1:4, 1.5:4.5), z = c(rep("A", 4), rep("B", 4)))
#'   ggplot2::ggplot(sample.data) +
#'   geom_dn(ggplot2::aes(x = x, y = y, size = z))
#' }
geom_dn <- function(mapping = NULL,
                      data = NULL,
                      stat = "identity",
                      position = "identity",
                      ...,
                      na.rm = FALSE,
                      show.legend = NA,
                      inherit.aes = TRUE) {

  ggplot2::layer(data = data,
                 mapping = mapping,
                 stat = stat,
                 geom = Geomdn,
                 position = position,
                 show.legend = show.legend,
                 inherit.aes = inherit.aes,
                 params = list(na.rm = na.rm, ...))
}
