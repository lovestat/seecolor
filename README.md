# seecolor <img src="man/figures/logo.png" align="right" width="120">

<!-- badges: start -->
![Build Status](https://travis-ci.com/lovestat/seecolor.svg?branch=master)
[![R build status](https://github.com/lovestat/seecolor/workflows/R-CMD-check/badge.svg)](https://github.com/lovestat/seecolor/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->


## Overview 

When you select color literals, a palette, or a ggplot2 object, the colors used there will be output in the console.

![Show the palette colors!](https://github.com/lovestat/seecolor/blob/master/man/figures/2.gif)

## Installation
```r
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

# Open the pre-define test file
open_sample()
```
