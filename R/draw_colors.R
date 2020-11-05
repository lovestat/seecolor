
draw_color_mosaic <- function(bg.color,
                              blank.len,
                              text.color = "yellow",
                              next.line = FALSE){
  tc <- make_style(text.color)
  bgc <- make_style(bg.color, bg = T)
  dc <- combine_styles(tc, bgc)
  cat(
    dc(paste0(paste0(rep(" ", blank.len), collapse = "")))
  )
  if (next.line) cat("\n")
}

draw_colors_mosaic <- function(x, blank.len){
  # purrr::walk(colors, ~ purrr::walk(.x, draw_color_mosaic))
  x[["col.lit"]] %>%
    purrr::walk(draw_color_mosaic, blank.len = blank.len)

  if (!purrr::is_empty(x[["col.pal"]])) cat("\n", "------", stringr::str_trim(x[["active.pal"]]), "------\n")
  x[["col.pal"]] %>%
    purrr::walk(draw_color_mosaic, blank.len = blank.len)

  if (!purrr::is_empty(x[["col.gg"]])) cat("\n", "---ggplot object--- \n")
  x[["col.gg"]] %>%
    purrr::walk(draw_color_mosaic, blank.len = blank.len)
}





draw_color_ribbon <- function(bg.color,
                              blank.len = 20 - nchar(bg.color),
                              text.color = "yellow",
                              next.line = TRUE) {
  #----- text color brush
  tc <- make_style(contrast_color(bg.color))
  #----- background color brush
  bgc <- make_style(bg.color, bg = T)
  #----- draw color brush
  dc <- combine_styles(tc, bgc)
  cat(
    dc(paste0(bg.color, paste0(rep(" ", blank.len), collapse = "")))
  )
  if (next.line) cat("\n")
}

draw_colors_ribbon <- function(x){
  ## purrr::walk(colors, ~ purrr::walk(.x, draw_color_ribbon))
  x[["col.lit"]] %>%
    purrr::walk(draw_color_ribbon)

  if (!purrr::is_empty(x[["col.pal"]])) cat("\n", "------", stringr::str_trim(x[["active.pal"]]), "------\n")
  x[["col.pal"]] %>%
    purrr::walk(draw_color_ribbon)

  if (!purrr::is_empty(x[["col.gg"]])) cat("---ggplot object---\n")
  x[["col.gg"]] %>%
    purrr::walk(draw_color_ribbon)
}



contrast_color <- function(x) {
  args <- dplyr::if_else(grDevices::col2rgb(x) < 128, 255, 0) %>%
    as.list() %>%
    append(255) %>%
    purrr::set_names(c("red", "green", "blue", "maxColorValue"))

  do.call(grDevices::rgb, args)
}


