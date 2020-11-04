##' @importFrom magrittr `%>%`


#----- Detect colors
detect_colors <- function() {

  #----- Return empty char when RStudio is not running
  if (!rstudioapi::isAvailable()) {
    return(character(0))
  }

  #----- Capture the highlighted text in the edit panel
  active.context <- rstudioapi::getActiveDocumentContext()
  active.text <- active.context$selection[[1]][["text"]]

  #----- Check and return if the highlighted text remains same
  if(active.text == previous.text) {
    return(character(0))
  }

  #----- Set the flag text
  previous.text <<- active.text

  #----- Initialize
  detected.colors <- NULL

  #----- Capture the colors contained in functions like colors(), palette()
  if (tryCatch(
    {
      eval(parse(text = paste0("eval.text <- ", active.text, "()")))
      is.character(eval.text)
    },
    error = function(error_condition) {
      return(FALSE)
      }
    )) {
    detected.colors.func <- extract_colors_literal(eval.text)
    detected.colors <- c(detected.colors, detected.colors.func)
  }

  #----- Capture the colors used by a ggplot object
  if (tryCatch({eval(parse(text = paste0("class(", active.text, ")[1]"))) == "gg"},
               error = function(error_condition) {
                 return(FALSE)
               })) {
    detected.colors.ggplot <- unlist(map(ggplot_build(eval(parse(text = active.text)))[["data"]], extract_colors_gg))
    detected.colors <- c(detected.colors, detected.colors.ggplot)
  }

  #----- Caputure the literal colors
  hex.and.bti.colors <- extract_colors_literal(active.text)
  detected.colors <- c(detected.colors, hex.and.bti.colors)

  #----- Values
  detected.colors
}


#----- Unit function for literal extract
extract_colors_literal <- function(x){
  hex.col <- stringr::str_extract_all(x, "(#[[:alnum:]]{6})") %>% unlist()
  builtin.col <- stringr::str_extract_all(x,
                                          grDevices::colors() %>%
                                            rev() %>%
                                            paste(collapse = '|') ) %>% unlist()
  c(hex.col, builtin.col)
}

#----- Unit function for ggplot extract
extract_colors_gg <- function(x) {
  colors_gg <- NULL
  if ("colour" %in% names(x)) colors_gg <- unique(x[["colour"]])
  if ("fill" %in% names(x)) colors_gg <- c(colors_gg, unique(x[["fill"]]))
  colors_gg[!is.na(colors_gg)]
}




