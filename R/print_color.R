##' Print the colors
##'
##' Print out the colors used by a literal vector,
##' a palette, or a ggplot object
##'
##' @param x A literal vector, a palette, or a ggplot object
##' @param type A character. The style of printing. The default is `mosaic`. It should be one of the `mosaic`,
##' `ribbon`, or `m`, `r`
##' @param blank.len A integer. The length of color mosaic. The default value is 3.
##'
##' @examples
##' \donttest{
##' print_color(colors(), type = "mosaic", blank.len = 3)
##' print_color(palette(), type = "ribbon", blank.len = 3)
##' }
##' @importFrom crayon make_style combine_styles
##' @export
##' @md
##' @export

print_color <- function(x, type = "mosaic",
                        blank.len = 3){

  if (type == "m") type <-  "mosaic"
  if (type == "r") type <-  "ribbon"

  if (class(x)[1] == "gg") {
    x <- unlist(purrr::map(ggplot2::ggplot_build(x)[["data"]], extract_colors_gg))
    x <- list(col.gg = x)
  }

  if (is.character(x)) {
    x <- list(col.pal = x,
              active.pal = as.character(match.call()[["x"]]))
  }

  switch (type,
          mosaic = draw_colors_mosaic(x, blank.len = blank.len),
          ribbon = draw_colors_ribbon(x),
          stop("Invalid type argument")
  )
}

