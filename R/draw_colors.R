
draw_color_mosaic <- function(bg.color,
                              text.color = "yellow",
                              blank.len = 1,
                              next.line = FALSE){
  tc <- make_style(text.color)
  bgc <- make_style(bg.color, bg = T)
  dc <- combine_styles(tc, bgc)
  cat(
    dc(paste0(paste0(rep(" ", blank.len), collapse = "")))
  )
  if (next.line) cat("\n")
}

draw_colors_mosaic <- function(colors){
  # purrr::walk(colors, ~ purrr::walk(.x, draw_color_mosaic))

  colors[["col.lit"]] %>%
    purrr::walk(draw_color_mosaic)

  if (!purrr::is_empty(colors[["col.pal"]])) cat("\n------", stringr::str_trim(colors[["active.pal"]]), "------\n")
  colors[["col.pal"]] %>%
    purrr::walk(draw_color_mosaic)

  if (!purrr::is_empty(colors[["col.gg"]])) cat("\n---ggplot object---\n")
  colors[["col.gg"]] %>%
    purrr::walk(draw_color_mosaic)
}





draw_color_ribbon <- function(bg.color,
                              text.color = "yellow",
                              blank.len = 20 - nchar(bg.color),
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

draw_colors_ribbon <- function(colors){
  ## purrr::walk(colors, ~ purrr::walk(.x, draw_color_ribbon))
  colors[["col.lit"]] %>%
    purrr::walk(draw_color_ribbon)

  if (!purrr::is_empty(colors[["col.pal"]])) cat("------palette------\n")
  colors[["col.pal"]] %>%
    purrr::walk(draw_color_ribbon)

  if (!purrr::is_empty(colors[["col.gg"]])) cat("---ggplot object---\n")
  colors[["col.gg"]] %>%
    purrr::walk(draw_color_ribbon)
}

contrast_color <- function(x) {
  dplyr::if_else(col2rgb(x) < 128, 255, 0) %>%
    as.list() %>%
    append(255) %>%
    purrr::set_names(c("red", "green", "blue", "maxColorValue")) %>%
    do.call(grDevices::rgb, .)
}


