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
  detected.colors.hex.six <- stringr::str_extract_all(active.text,
                                                      "(#[[:alnum:]]{6})") %>% unlist()
  detected.colors.builtin.literal <- stringr::str_extract_all(active.text,
                                                              colors() %>%
                                                                paste(collapse = '|') %>%
                                                                paste0('"', ., '"') ) %>% unlist()
  detected.colors <- c(detected.colors, detected.colors.hex.six, detected.colors.builtin.literal)
  detected.colors
}

