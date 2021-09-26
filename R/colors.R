
#' Data Network colors
#' @export

dn_colors <- c(
  "han_purple"             = "#5c3afe",
  "maximum_blu_purple"     = "#ad9cfe",
  "lavender_blue_1"        = "#ccc2fe",
  "lavender_blue_2"        = "#ddd7fe",
  "sky_blue_crayola"       = "#71d1de",
  "turquoise_1"            = "#7ef1e0",
  "turquoise_2"            = "#20e9c8"
  )




#' Get the hex code for a dn color
#'
#' @param color_name The name of the color.
#'
#' @return
#' @export
dn_color <- function (color_name) {
  unname(dn_colors[color_name])
}
