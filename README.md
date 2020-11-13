# seecolor <img src="man/figures/logo.png" align="right" width="120">

<!-- badges: start -->
[![CRAN\_Status\_Badge](http://www.r-pkg.org/badges/version/seecolor?color=green)](https://cran.r-project.org/package=seecolor)
![Build Status](https://travis-ci.com/lovestat/seecolor.svg?branch=master)
[![R build status](https://github.com/lovestat/seecolor/workflows/R-CMD-check/badge.svg)](https://github.com/lovestat/seecolor/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
[![Codecov test coverage](https://codecov.io/gh/lovestat/seecolor/branch/master/graph/badge.svg)](https://codecov.io/gh/lovestat/seecolor?branch=master)
<!-- badges: end -->


## Overview 

When you select color literals, a palette, or a ggplot2 object, the colors used there will be output in the console.


## Installation
```r
# install from CRAN
install.packages("seecolor")

# install from GitHub:
devtools::install_github("lovestat/seecolor")
```

## Usage


```r
# Highlight objects by cursor to show the contained colors
pick_color()

# Change output styles, "ribbon" or "mosaic"
pick_color(type = "r")

# Change the length of the color blocks
pick_color(blank.len = 1)

# Print colors contained in literal, palette and ggplot objects
print_color(colors(), type = "m", blank.len = 1)

# Open the pre-defined test file
open_sample()
```

![Show the palette colors!](https://github.com/lovestat/seecolor/raw/master/man/figures/2.gif)

