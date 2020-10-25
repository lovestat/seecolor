##' @importFrom magrittr `%>%`

detect_colors <- function() {
  if (!rstudioapi::isAvailable()) {
    return(character(0))
  }

  active.context <- rstudioapi::getActiveDocumentContext()
  active.text <- active.context$selection[[1]][["text"]]
  detected.colors.hex.six <- stringr::str_extract_all(active.text,
                                                      "(#[[:alnum:]]{6})") %>% unlist()
  detected.colors.builtin.literal <- stringr::str_extract_all(active.text,
                                                              colors() %>%
                                                                paste(collapse = '|') %>%
                                                                paste0('"', ., '"') ) %>% unlist()
  detected.colors <- c(detected.colors.hex.six, detected.colors.builtin.literal)
  detected.colors
}

detected.colors <- detect_colors()

