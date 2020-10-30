##' @importFrom crayon make_style combine_styles
##' @export

show_color <- function(type = "ribbons") {
  previous.colors <- 0
  if (type == "ribbons")   show_color_ribbons(previous.colors)
  if (type == "oneribbon") show_color_oneribbon(previous.colors)
}


show_color_ribbons <- function(previous.colors) {
  message("Press esc twice to stop")

  while (T) {
    Sys.sleep(0.3)
    detected.colors <- detect_colors()
    diff.colors <- dplyr::setdiff(detected.colors, previous.colors)
    if( !purrr::is_empty(diff.colors)  && !purrr::is_empty(detected.colors)) {
      draw_colors(diff.colors)
    }
    previous.colors <- detected.colors
  }
}


show_color_oneribbon <- function(previous.colors) {
  message("Press esc twice to stop")

  while (T) {
    Sys.sleep(0.3)
    detected.colors <- detect_colors()
    diff.colors <- dplyr::setdiff(detected.colors, previous.colors)
    if( !purrr::is_empty(diff.colors)  && !purrr::is_empty(detected.colors)) {
      draw_colors_oneribbon(diff.colors)
    }
    previous.colors <- detected.colors
  }
}
