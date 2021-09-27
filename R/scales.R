# Scales ----

#' @title Data Network palette
#' @description Original Data Network color palette
#' @inheritDotParams ggplot2::discrete_scale
#' @param n number of colors
#' @param type discrete or continuous
#' @param reverse reverse order, Default: FALSE
#' @rdname dn_palette
#' @export
#' @examples
#' library(scales)
#' show_col(dn_palette()(5))
#' @importFrom scales manual_pal
#' @importFrom glue glue
#' @importFrom grDevices colorRampPalette


dn_palette <- function(n,
                       type = c("discrete", "continuous"),
                       reverse = FALSE){

  dn_colors_pal <- get_dn_hex()

  if (reverse == TRUE) {
    dn_colors_pal <- rev(dn_colors_pal)
  }

  if (missing(n)) {
    n <- length(dn_colors_pal)
  }

  type <- match.arg(type)

  if (type == "discrete" && n > length(dn_colors_pal)) {
    stop(glue::glue("Palette does not have {n} colors, maximum is {length(dn_colors_pal)}!"))
  }

  dn_colors_pal <- switch(type,
                         continuous = grDevices::colorRampPalette(dn_colors_pal)(n),
                         discrete = dn_colors_pal[1:n])

  dn_colors_pal <- scales::manual_pal(dn_colors_pal)

  return(dn_colors_pal)
}




#' @title scale_color_dn
#' @rdname dn_pal
#' @export
#' @examples
#'
#' library(ggplot2)
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_color_dn()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_color_dn <- function(n, type = "discrete",
                                     reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("color", "dn_", dn_palette(), ...)
  } else { ## needs work...
    ggplot2::scale_color_gradientn(colors = dn_palette(n = n, type = type,
                                                             reverse = reverse)(6))
  }
}

#' @title scale_colour_dn
#' @rdname dn_palette
#' @export
#' @examples
#'
#' ggplot(airquality, aes(x = Day, y = Temp,
#'      group = as.factor(Month), color = as.factor(Month))) +
#'      geom_point(size = 2.5) +
#'      scale_colour_dn()
#' @importFrom ggplot2 discrete_scale scale_color_gradientn

scale_colour_dn <- scale_color_dn

#' @title scale_fill_dn
#' @rdname dn_palette
#' @export
#' @examples
#'
#' ggplot(mpg, aes(displ)) +
#'      geom_histogram(aes(fill = class), col = "black", size = 0.1) +
#'      scale_fill_dn()
#' @importFrom ggplot2 discrete_scale scale_fill_gradientn

scale_fill_dn <- function(n, type = "discrete",
                                    reverse = FALSE, ...){
  if (type == "discrete") {
    ggplot2::discrete_scale("fill", "dn_", dn_palette(), ...)
  } else { ## needs work...
    ggplot2::scale_fill_gradientn(colors = dn_palette(n = n, type = type,
                                                            reverse = reverse)(6))
  }
}
