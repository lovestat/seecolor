##' @export

print_color <- function(x, type = "mosaic"){

  if (type == "m") type <-  "mosaic"
  if (type == "r") type <-  "ribbon"

  if (class(x)[1] == "gg") {
    x = unlist(map(ggplot_build(x)[["data"]], extract_colors_gg))
  }

  switch (type,
          mosaic = draw_colors_mosaic(x),
          ribbon = draw_colors_ribbon(x),
          stop("Invalid type argument")
  )
}
