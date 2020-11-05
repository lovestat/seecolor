# seecolor <img src="man/figures/logo.png" align="right" width="120">

<!-- badges: start -->
[![Build Status](https://travis-ci.com/songshangchen6/seecolor.svg?branch=master)
[![R build status](https://github.com/songshangchen6/seecolor/workflows/R-CMD-check/badge.svg)](https://github.com/songshangchen6/seecolor/actions)
<!-- badges: end -->


## Overview 

When you select a color literal and a ggplot2 object, the colors used there will be output in the console.

![Show the colors!](https://github.com/songshangchen6/seecolor/blob/master/man/figures/seecolor_ribbons.gif)

## Installation
```r
# install from GitHub:
devtools::install_github("songshangchen6/seecolor")
```

## Usage

```r
# show the colors as ribbons
seecolor::show_color()

# show the colors as single continous ribbon
seecolor::show_color(type = "oneribbon")

# show the colors used by a ggplot2 object (Testing)
seecolor::show_color()
seecolor::show_color(type = "oneribbon")

ggplot(diamonds, aes(carat, price)) + geom_bin2d()
 
```
