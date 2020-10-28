##' @importFrom magrittr `%>%`

detect_colors <- function() {
  if (!rstudioapi::isAvailable()) {
    return(character(0))
  }


  active.context <- rstudioapi::getActiveDocumentContext()
  active.text <- active.context$selection[[1]][["text"]]
  detected.colors <- NULL


  if (active.text == "colors") {
    detected.colors.gr.colors <- grDevices::colors()
    detected.colors <- c(detected.colors, detected.colors.gr.colors)
  }
  if (active.text == "palette"){
    detected.colors.gr.palette <- grDevices::palette()
    detected.colors <- c(detected.colors, detected.colors.gr.palette)
  }



  if (tryCatch({eval(parse(text = paste0("class(", active.text, ")[1]"))) == "gg"},
               error = function(error_condition) {
                 return(FALSE)
               })) {
    detected.colors.ggplot <- unlist(map(gg <- ggplot_build(eval(parse(text = active.text)))[["data"]], extract_colors_gg))
    detected.colors <- c(detected.colors, detected.colors.ggplot)
    }

  detected.colors.hex.six <- stringr::str_extract_all(active.text,
                                                      "(#[[:alnum:]]{6})") %>% unlist()
  detected.colors.builtin.literal <- stringr::str_extract_all(active.text,
                                                              grDevices::colors() %>%
                                                                rev() %>%
                                                                paste(collapse = '|') ) %>% unlist()
  detected.colors <- c(detected.colors, detected.colors.hex.six, detected.colors.builtin.literal)
  detected.colors
}


extract_colors_gg <- function(x) {

  colors_gg <- NULL

  if ("colour" %in% names(x)) colors_gg <- unique(x[["colour"]])
  if ("fill" %in% names(x)) colors_gg <- c(colors_gg, unique(x[["fill"]]))

  colors_gg[!is.na(colors_gg)]
}




