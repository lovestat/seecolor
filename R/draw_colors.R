draw_color <- function(bg.color, text.color = "ivory", blank.len = 20 - nchar(bg.color), next.line = TRUE){
  tc <- make_style(text.color)
  bgc <- make_style(bg.color, bg = T)
  dc <- combine_styles(tc, bgc)
  cat(
    dc(paste0(bg.color, paste0(rep(" ", blank.len), collapse = "")))
  )
  if (next.line) cat("\n")
}

draw_colors <- function(colors){
  purrr::walk(colors, draw_color)
}


draw_color_oneribbon <- function(bg.color, text.color = "ivory", blank.len = 1, next.line = FALSE){
  tc <- make_style(text.color)
  bgc <- make_style(bg.color, bg = T)
  dc <- combine_styles(tc, bgc)
  cat(
    dc(paste0(paste0(rep(" ", blank.len), collapse = "")))
  )
  if (next.line) cat("\n")
}


draw_colors_oneribbon <- function(colors){
  purrr::walk(colors, draw_color_oneribbon)
}

