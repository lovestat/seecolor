# seecolor <img src="man/figures/logo.png" align="right" width="120">

<!-- badges: start -->
![Build Status](https://travis-ci.com/songshangchen6/seecolor.svg?branch=master)
[![R build status](https://github.com/songshangchen6/seecolor/workflows/R-CMD-check/badge.svg)](https://github.com/songshangchen6/seecolor/actions)
[![lifecycle](https://img.shields.io/badge/lifecycle-experimental-orange.svg)](https://www.tidyverse.org/lifecycle/#experimental)
<!-- badges: end -->


## Overview 

When you select a color literal and a ggplot2 object, the colors used there will be output in the console.


![Show the colors as ribbons!](https://github.com/songshangchen6/seecolor/blob/master/man/figures/3.gif)

## Installation
```r
# install from GitHub:
devtools::install_github("songshangchen6/seecolor")
```

## Usage

![Show the literal colors!](https://github.com/songshangchen6/seecolor/blob/master/man/figures/1.gif)
```r
# Highlight objects by cursor to show the contained colors
seecolor::pick_color()
```

![Show the palette colors!](https://github.com/songshangchen6/seecolor/blob/master/man/figures/2.gif)

```r
# Change output styles, "ribbon" or "mosaic"
seecolor::pick_color(type = "r")

# Change the length of the color blocks
seecolor::pick_color(blank.len = 1)

# Print colors contained in literal, palette and ggplot objects
seecolor::print_color(colors(), type = "m", blank.len = 1)

# Open the pre-define test file
seecolor::open_sample()
```
