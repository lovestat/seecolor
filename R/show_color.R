##' @importFrom crayon make_style combine_styles
##' @export

show_color <- function() {
  previous.colors <- 0
  show_color_while(previous.colors)
}


show_color_while <- function(previous.colors) {
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
