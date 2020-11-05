##' @importFrom crayon make_style combine_styles
##' @export

pick_color <- function(type = "mosaic") {

  if (!rstudioapi::isAvailable()) {
    return(NULL)
  }

  message("Press esc twice to stop")

  if (type == "m") type <-  "mosaic"
  if (type == "r") type <-  "ribbon"

  previous.colors <- 0
  previous.text <- ""

  while (TRUE) {
    #----- Capture the highlighted text in the edit panel
    active.context <- rstudioapi::getActiveDocumentContext()
    active.text <- active.context$selection[[1]][["text"]]

    if(active.text != previous.text) {

      previous.text <- active.text

      detected.colors <- detect_colors(active.text)
      diff.colors <- purrr::map2(detected.colors, previous.colors, dplyr::setdiff)
      if( !all(purrr::map_lgl(diff.colors, purrr::is_empty)) &&
          !all(purrr::map_lgl(detected.colors, purrr::is_empty))) {
        switch (type,
                mosaic = draw_colors_mosaic(diff.colors),
                ribbon = draw_colors_ribbon(diff.colors),
                stop("Invalid type argument")
        )
      }
      previous.colors <- detected.colors
    }
    Sys.sleep(0.3)
  }
}


