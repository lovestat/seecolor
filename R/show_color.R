##' @importFrom crayon make_style combine_styles
##' @export

show_color <- function(type = "mosaic") {
  previous.colors <- 0
  previous.text <- ""

  switch (type,
    mosaic = show_color_mosaic(previous.colors),
    ribbon = show_color_ribbon(previous.colors),
    stop("Invalid type argument")
  )


}


show_color_mosaic <- function(previous.colors) {
  message("Press esc twice to stop")

  while (TRUE) {
    Sys.sleep(0.3)
    detected.colors <- detect_colors()
    diff.colors <- dplyr::setdiff(detected.colors, previous.colors)
    if( !purrr::is_empty(diff.colors)  && !purrr::is_empty(detected.colors)) {
      draw_colors_mosaic(diff.colors)
    }
    previous.colors <- detected.colors
  }
}

show_color_ribbon <- function(previous.colors) {
  message("Press esc twice to stop")

  while(TRUE) {
    Sys.sleep(0.3)
    detected.colors <- detect_colors()

    diff.colors <- dplyr::setdiff(detected.colors, previous.colors)
    if( !purrr::is_empty(diff.colors)  && !purrr::is_empty(detected.colors)) {
      draw_colors_ribbon(diff.colors)
    }
    previous.colors <- detected.colors
  }
}


