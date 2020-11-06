##' Select object by cursor and show colors in the console
##'
##' Simply highlight the text in the Source panel
##' and the colors used in the specific object will be
##' output in the console
##'
##' @param type A character. The style of printing. The default is `mosaic`. It should be one of the `mosaic`,
##' `ribbon`, or `m`, `r`
##' @param blank.len A integer. The length of color mosaic. The default value is 3.
##'
##' @examples
##' \donttest{
##' pick_color(type = "mosaic", blank.len = 3)
##' pick_color(type = "ribbon", blank.len = 3)
##' }
##'
##' @importFrom crayon make_style combine_styles
##' @export
##' @md

pick_color <- function(type = "mosaic", blank.len = 3) {

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

    if(active.text != previous.text &&
       !stringr::str_detect(active.text,
                           "pick_color|devtools|seecolor")) {

      previous.text <- active.text

      detected.colors <- detect_colors(active.text)
      diff.colors <- purrr::map2(detected.colors, previous.colors, dplyr::setdiff)
      if( !all(purrr::map_lgl(diff.colors, purrr::is_empty)) &&
          !all(purrr::map_lgl(detected.colors, purrr::is_empty))) {
        switch (type,
                mosaic = draw_colors_mosaic(diff.colors, blank.len = blank.len),
                ribbon = draw_colors_ribbon(diff.colors),
                stop("Invalid type argument")
        )
      }
      previous.colors <- detected.colors
    }
    Sys.sleep(0.3)
  }
}


