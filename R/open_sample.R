##' Open the sample test file
##'
##' @export

open_sample <- function(){
  text <- 'WHITE\t#FFFFFF\tRGB(255, 255, 255)\nSILVER\t#C0C0C0\tRGB(192, 192, 192)\nGRAY\t#808080\tRGB(128, 128, 128)\nBLACK\t#000000\tRGB(0, 0, 0)\nRED\t#FF0000\tRGB(255, 0, 0)\nMAROON\t#800000\tRGB(128, 0, 0)\nYELLOW\t#FFFF00\tRGB(255, 255, 0)\nOLIVE\t#808000\tRGB(128, 128, 0)\nLIME\t#00FF00\tRGB(0, 255, 0)\nGREEN\t#008000\tRGB(0, 128, 0)\nAQUA\t#00FFFF\tRGB(0, 255, 255)\nTEAL\t#008080\tRGB(0, 128, 128)\nBLUE\t#0000FF\tRGB(0, 0, 255)\nNAVY\t#000080\tRGB(0, 0, 128)\nFUCHSIA\t#FF00FF\tRGB(255, 0, 255))\nPURPLE\t#800080\tRGB(128, 0, 128))\n\ncolors()\npalette()\nrainbow(30)\n\nseecolor::pick_color(type = "r")\nseecolor::print_color(colors())'
  temp.path <- tempfile(fileext = ".R")
  writeLines(text, temp.path)
  if (rstudioapi::isAvailable()){
    rstudioapi::navigateToFile(temp.path)
  }
}

