##' @importFrom magrittr `%>%`

#----- Detect colors
detect_colors <- function(active.text) {

  active.pal <- NULL

  #----- Capture the colors contained in palette like colors(),
  #----- palette(), rainbow(50)
  detected.colors.palette <- NULL
  if (tryCatch(
    {
      eval.text <- NULL
      eval(parse(text = paste0("eval.text <- ", active.text)))
      is.character(eval.text)
    },
    error = function(error_condition) {
      return(FALSE)
      }
    )) {
    active.pal <- active.text
    detected.colors.palette <- extract_colors_literal(eval.text)
  }

  #----- Capture the colors used by a ggplot object
  detected.colors.ggplot <- NULL
  if (tryCatch({eval(parse(text = paste0("class(", active.text, ")[1]"))) == "gg"},
               error = function(error_condition) {
                 return(FALSE)
               })) {
    detected.colors.ggplot <- unlist(purrr::map(ggplot2::ggplot_build(eval(parse(text = active.text)))[["data"]], extract_colors_gg))
  }

  #----- Capture the literal colors
  hex.and.bti.colors <- NULL
  hex.and.bti.colors <- extract_colors_literal(active.text)

  #----- Values
  list(col.pal = detected.colors.palette,
       col.gg = detected.colors.ggplot,
       col.lit = hex.and.bti.colors,
       active.pal = active.pal)
}


#----- Help function for literal extract
extract_colors_literal <- function(x){
  hex.col <- stringr::str_extract_all(x, "(#[[:alnum:]]{6})") %>% unlist()
  builtin.col <- stringr::str_extract_all(x,
                                          grDevices::colors() %>%
                                            rev() %>%
                                            paste(collapse = '|') ) %>% unlist()
  c(hex.col, builtin.col)
}

#----- Help function for ggplot extract
extract_colors_gg <- function(x) {
  colors_gg <- NULL
  if ("colour" %in% names(x)) colors_gg <- unique(x[["colour"]])
  if ("fill" %in% names(x)) colors_gg <- c(colors_gg, unique(x[["fill"]]))
  colors_gg[!is.na(colors_gg)]
}




