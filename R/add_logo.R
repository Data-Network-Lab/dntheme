#' Add a logo to the current plot
#'
#' @param g ggplot obj
#'
#' @return Add the logo in the below right side
#' @export
add_dn_logo <- function(g) {
  url <- "https://raw.githubusercontent.com/Data-Network-Lab/indicatore_zona_gialla/add_documentation/documentation/img/apple-touch-icon.png"
  logo <- magick::image_read(url)
  g <- g + ggplot2::theme(
      plot.margin = ggplot2::margin(
        t = 12,
        r = 12,
        b = 45,
        l = 12))

  plot <-
    cowplot::ggdraw(g) +
    cowplot::draw_image(
      logo,
      scale = .2,
      x = 1,
      hjust = 1,
      halign = 1,
      valign = 0
    )
  return(plot)
}
